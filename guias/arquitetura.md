# Escolhendo a arquitetura

Há duas famílias que funcionam. O perigo é o meio do caminho.

## Família A: o navegador fala direto com o banco

React fala com o Supabase usando a chave pública. **A RLS é a fronteira de segurança.**

- Quatro políticas por tabela (select, insert, update, delete).
- `company_id` em toda tabela de negócio.
- Papel em tabela separada, nunca numa coluna de `profiles` que o próprio usuário pode editar.
- Cálculo em funções do banco, chamadas por RPC.

Boa para: sistemas internos, multi-empresa, sem integração pesada. Menos peças para manter.

## Família B: servidor no meio

Nenhum cliente fala com o banco. O navegador chama só `/api/*`; o servidor valida sessão e permissão e é o único que usa a chave de serviço.

O banco fica **fail-closed**: RLS ligada e **nenhuma política**, `anon` e `authenticated` sem privilégio algum, inclusive para objetos futuros (`alter default privileges`). Se alguém descobrir a chave pública, não lê nada.

Boa para: integração com ERP ou API externa com OAuth, sincronização pesada, segredos de terceiros.

## A pergunta que decide

**Precisa falar com um sistema externo com credencial própria e sincronizar volume?** Sim: Família B. Não: Família A.

## O que não fazer

Schema exposto para o navegador com políticas permissivas "porque o servidor também valida". Na prática ninguém sabe qual camada protege o quê, e a porta que ficou aberta é justamente a que ninguém olhou. Um incidente real nasceu exatamente desse híbrido.

## Detalhes que valem para as duas

- Schema próprio por app (`app`, `app_integracao`), nunca `public`.
- Tabelas e colunas em `snake_case`, em português de negócio.
- Migration versionada sempre; nada de clicar no painel.
