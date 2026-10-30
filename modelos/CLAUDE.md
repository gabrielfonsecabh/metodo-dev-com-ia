# Regras não negociáveis do PREENCHA (nome do projeto)

Este arquivo é lido automaticamente pelo agente em toda sessão aberta nesta pasta. Ele vale mais que qualquer preferência genérica. Se uma instrução da conversa contrariar uma regra daqui, pergunte antes de seguir.

## O que é este projeto

PREENCHA em 3 a 5 linhas: o que o sistema faz, para quem, e o que ele NÃO faz. Leia `docs/specs/` antes de qualquer decisão de escopo.

## Stack

- Frontend: PREENCHA (ex.: React + Vite + TypeScript strict, Tailwind + shadcn/ui).
- Estado de servidor: PREENCHA (ex.: TanStack Query; nada de fetch solto em `useEffect`).
- Formulários: PREENCHA (ex.: React Hook Form + Zod; o Zod valida o cliente, o banco valida de verdade).
- Banco: PREENCHA (ex.: Supabase Postgres, schema próprio `app`, nunca `public`).
- Deploy: PREENCHA.

## Arquitetura

PREENCHA com a família escolhida (ver o guia de arquitetura do kit):

- **Família A (navegador fala direto com o banco):** a RLS é a fronteira de segurança. Quatro políticas por tabela (select, insert, update, delete). `company_id` em toda tabela de negócio. Papel em tabela separada, nunca em `profiles`.
- **Família B (servidor no meio):** nenhum cliente fala com o banco. O servidor valida sessão e permissão e é o único que usa a chave de serviço. Banco fail-closed: RLS ligada e zero políticas, `anon` e `authenticated` sem privilégio, inclusive para objetos futuros.

Nunca o meio do caminho: schema exposto com políticas permissivas mais um servidor.

## Banco e migrations

1. Toda mudança de schema é migration versionada. Nada de alteração manual no painel.
2. Cabeçalho de toda migration diz o porquê. Migration re-executável (`if not exists`, `drop ... if exists`).
3. Nunca aplicar migration cujo rollback não se enuncia em uma frase.
4. Antes de editar função existente, ler a definição que está rodando no banco (`pg_get_functiondef`), não a do repositório.
5. `revoke all ... from public, anon` antes de todo `grant execute`.
6. `SECURITY DEFINER` tem gate próprio (`raise exception ... using errcode = '42501'`) e deriva o tenant da linha, não do parâmetro.
7. Cálculo mora no banco. O frontend renderiza; não soma, não recalcula.

## Ordem de trabalho

1. Dado e regra corretos primeiro, tela depois.
2. Spec em `docs/specs/AAAA-MM-DD-topico-design.md` antes de feature nova.
3. Pronto é provado: a query que demonstra o resultado, o caso negado testado, o print da tela visto. "Compilou" não é pronto.
4. Ao fim de cada entrega: `SISTEMA.md` atualizado com data; decisão nova em `DECISOES.md` com o motivo; ataque novo em `SEGURANCA.md`.

## Honestidade do dado

- Resultado vazio nunca aparece como zero. A tela diz se "nenhuma linha correspondeu" ou se "a consulta falhou".
- Ausência de dado é um traço curto, nunca 0.
- Sem dado real, a tela explica o que falta para ativar. Nada de gráfico de exemplo no código de produção.
- Escrita que afetou 0 linhas é erro, e a mensagem nomeia as duas causas possíveis (concorrência ou permissão).

## Segredos

- `.env` nunca entra no git. Só `.env.example`.
- Chave de serviço só no servidor ou em Edge Function, nunca no bundle do navegador.
- Ambiente sem credencial é ambiente quebrado (erro claro), não ambiente liberado com usuário falso.

## Texto e código

- Interface em português do Brasil, frase curta, voz ativa.
- PREENCHA as regras de estilo da casa (ex.: nunca usar travessão; nomes de tabela em `snake_case` e em português de negócio).

## Skills

PREENCHA as skills que o agente deve carregar e quando. Exemplo:

- Antes de escrever qualquer coisa de banco: `supabase-app-hardening`.
- Antes de tema, shell ou telas: `admin-app-design-system`.
- Em tela de relatório ou drill-down: `progressive-disclosure-tables`.
