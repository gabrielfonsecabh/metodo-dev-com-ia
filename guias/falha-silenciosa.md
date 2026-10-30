# Doutrina da falha silenciosa

No Postgres com Supabase, as falhas perigosas não levantam exceção. A escrita retorna sucesso e não grava. A paginação pula linhas sem avisar. A função devolve zero quando deveria devolver "não sei". Nenhum log fica vermelho, e a tela mostra o número com toda a confiança.

Com agente de IA isso piora, porque o agente lê o código e conclui que funciona. **A regra é: toda decisão de segurança e de escala é provada contra o banco, nunca inferida do código.**

## As armadilhas

**RLS ligada sem política para um verbo desabilita esse verbo em silêncio.** Sem política de `update`, o update casa zero linhas e retorna `error = null`. A tela mostra "salvo". No cliente, trate "0 linhas afetadas" como erro e diga as duas causas possíveis: o registro mudou (concorrência) ou você não tem permissão. Culpar só a concorrência manda o usuário tentar de novo para sempre contra um problema de permissão.

**`.range()` sem ordem única pula e duplica linhas.** Sempre `.order('id')`. `created_at` não serve: importação em lote grava milhares de linhas com o mesmo instante.

**O papel `authenticated` morre em cerca de 8 segundos** (o `anon`, em 3). Operação em massa precisa de `set local statement_timeout to '120s'` dentro da função. E isso é proibido em função marcada `stable`, com erro só na hora de rodar.

**Paginação em paralelo satura o pool e estoura o timeout.** O conserto de agregado lento é uma função no banco que devolve o resumo, não um loop mais rápido no cliente.

**`SECURITY DEFINER` ignora a RLS.** Precisa de gate próprio (`raise exception ... using errcode = '42501'`) e deve derivar a empresa da linha em vez de confiar no parâmetro.

**Função nova nasce executável por `PUBLIC`.** `revoke all ... from public, anon` antes de `grant execute ... to authenticated`, sempre nessa ordem.

**`auth.uid()` puro dentro de política é reavaliado a cada linha.** Use `(select auth.uid())`.

**O repositório pode estar atrás da produção.** Antes de editar uma função, leia `pg_get_functiondef`. Copiar o corpo de uma migration antiga desfaz tudo que mudou depois.

**Função que lê `jsonb` precisa ser conferida contra o dado que existe, não contra a documentação.** Caso real: uma régua de bônus pagava 0% com 100% de atingimento. A função lia `{ate, paga}` e o dado estava gravado como `{min, max, paga}`. Toda faixa virava nulo, o `coalesce` transformava em zero, e a tela exibia o zero sem erro nenhum.

**Vazio não é zero.** Quando a regra não consegue classificar, a resposta é "sem dado", não "zero". A tela distingue "nenhuma linha correspondeu" de "a consulta falhou", e ausência de dado é um traço, nunca 0.

**Ambiente sem credencial é ambiente quebrado.** Fail-closed: erro claro (503), nunca um modo liberado com usuário falso ou dado de demonstração no mesmo código que roda em produção.

## Como provar

Personifique o usuário dentro de uma transação que termina em `rollback` e rode o caso permitido e o negado:

```sql
begin;
set local role authenticated;
set local request.jwt.claims = '{"sub":"<UUID>","role":"authenticated"}';
select count(*) from app.pedidos;               -- a própria empresa: linhas
update app.pedidos set obs = obs where id = 1;  -- sem permissão: 0 linhas
select app.funcao_sensivel('<outra_empresa>');  -- empresa alheia: 42501
rollback;
```

Registre cada prova em `SEGURANCA.md`, com o comando e o resultado.

## O advisor não é lista de tarefas

O Security Advisor do Supabase é uma lista de suspeitos. Investigue cada um e registre o que ficou de fora, com o motivo.
