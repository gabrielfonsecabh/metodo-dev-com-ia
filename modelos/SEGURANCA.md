# SEGURANÇA · ataques testados

Cada linha é um ataque: o comando exato, o resultado esperado e o resultado obtido. Se houve correção, o ataque aparece de novo depois dela. Segurança aqui é o que foi provado, não o que o código parece garantir.

Como rodar um ataque de banco: dentro de uma transação que termina em `rollback`, personificando o usuário.

```sql
begin;
set local role authenticated;
set local request.jwt.claims = '{"sub":"<UUID_DO_USUARIO>","role":"authenticated"}';
-- o ataque aqui
rollback;
```

Sempre rode o caso negado. Um teste que só prova o caminho permitido passa contra uma política que libera todo mundo.

## Lista mínima de ataques (adapte ao projeto)

| # | Ataque | Esperado |
|---|---|---|
| C1 | Controle: usuário autorizado lê a própria empresa | 1 linha ou mais |
| A1 | Usuário de outra empresa faz select na tabela de negócio | 0 linhas |
| A2 | Usuário de outra empresa faz insert com o `company_id` alheio | erro 42501 |
| A3 | Usuário comum faz update na própria linha de vínculo para virar admin | 0 linhas ou permissão negada |
| A4 | Usuário comum cria vínculo de admin para outra pessoa | erro 42501 |
| A5 | Usuário sem permissão de escrita faz update numa linha que ele lê | 0 linhas (e a tela trata como erro) |
| A6 | Papel `anon` lê qualquer tabela ou chama qualquer função | permissão negada |
| A7 | Usuário chama função `SECURITY DEFINER` passando o id de outra empresa | erro 42501 |
| A8 | Usuário desativado, com sessão ainda válida, lê dados | 0 linhas |
| A9 | Usuário com troca de senha pendente acessa dados | 0 linhas |
| A10 | Chamada direta à API REST sem token | 401 |

## Execuções

<!-- Cole aqui o resultado de cada rodada, a mais recente no topo. -->

### DD/MM/AAAA, HH:MM (projeto PREENCHA)

PREENCHA de N conferências OK.

| # | Data | Ataque | Comando | Esperado | Resultado | Situação |
|---|---|---|---|---|---|---|
| A1 | DD/MM/AAAA | Usuário da empresa B faz select em `app.pedidos` | `scripts/ataques/banco.sql` | 0 linhas | 0 linhas | OK |

## Advisors do Supabase

O advisor é uma lista de suspeitos, não uma lista de tarefas. Registre o que ficou de fora e o motivo.

| Aviso | Decisão | Motivo |
|---|---|---|

## Pendências de segurança

- PREENCHA, cada uma com dono e prazo.
