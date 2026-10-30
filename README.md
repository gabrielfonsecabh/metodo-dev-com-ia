# Método de desenvolvimento com IA

Um kit de modelos e guias para construir **software de verdade** com agentes de IA (Claude Code, Codex, Cursor e afins) sem acabar com um sistema que funciona na demonstração e mente em produção.

Não é teoria. É o método que usei para construir, praticamente sozinho e com agentes, uma dezena de sistemas internos: planejamento orçamentário, fluxo de caixa, auditoria contábil, gestão de OKR e processos, painéis financeiros. Todos multi-empresa, com banco de dados em produção e dinheiro real passando por eles. Cada regra aqui custou um erro antes de virar regra.

## A ideia em três frases

1. **O agente escreve rápido, mas não sabe o que é verdade no seu projeto.** Então a verdade precisa estar escrita em arquivos que ele lê sozinho, toda sessão.
2. **As falhas perigosas não dão erro.** Então nada é "pronto" por ter compilado: é pronto quando foi provado contra o banco, inclusive o caso negado.
3. **Dado e regra antes da tela.** Uma tela bonita sobre um número errado é pior do que nenhuma tela.

## O que tem aqui

### `modelos/`: copie para a raiz do seu projeto

| Arquivo | Para quê |
|---|---|
| [`CLAUDE.md`](modelos/CLAUDE.md) | As regras não negociáveis do projeto. O agente lê automaticamente em toda sessão. (Para Codex e outros, copie como `AGENTS.md`.) |
| [`PROMPT-INICIAL.md`](modelos/PROMPT-INICIAL.md) | O primeiro prompt de um projeto novo: o que pedir e em que ordem. |
| [`SISTEMA.md`](modelos/SISTEMA.md) | O que é real e o que falta, tela por tela, com data. Acaba com o "achei que já estava pronto". |
| [`SEGURANCA.md`](modelos/SEGURANCA.md) | Os ataques testados, com o comando exato e o resultado. Segurança provada, não presumida. |
| [`DESIGN-SYSTEM.md`](modelos/DESIGN-SYSTEM.md) | As convenções de interface, escritas para servir de briefing no próximo projeto. |
| [`DECISOES.md`](modelos/DECISOES.md) | O registro de cada escolha e do motivo. Impede o agente (e você daqui a 3 meses) de "corrigir" o que foi feito de propósito. |
| [`RUNBOOK.md`](modelos/RUNBOOK.md) | A operação do dia a dia, com o comando exato. |
| [`docs/specs/AAAA-MM-DD-topico-design.md`](modelos/docs/specs/AAAA-MM-DD-topico-design.md) | Uma spec por feature, antes do código. |
| [`supabase/migrations/modelo.sql`](modelos/supabase/migrations/modelo.sql) | Migration com o porquê no cabeçalho, re-executável, com as quatro políticas de RLS e o `revoke` antes do `grant`. |

### `guias/`: leia uma vez

| Guia | O que ensina |
|---|---|
| [Doutrina da falha silenciosa](guias/falha-silenciosa.md) | As armadilhas do Postgres com Supabase que retornam sucesso e não fazem nada, e como provar cada decisão. |
| [Ordem de trabalho e Definition of Done](guias/ordem-de-trabalho.md) | A sequência obrigatória de uma feature de dados e a lista do que precisa ser verdade antes de chamar de pronta. |
| [Escolhendo a arquitetura](guias/arquitetura.md) | As duas famílias (navegador falando direto com o banco, ou servidor no meio) e a pergunta que decide entre elas. |
| [Vários agentes em paralelo](guias/agentes-em-paralelo.md) | A receita para pôr seis agentes escrevendo telas ao mesmo tempo sem um quebrar o trabalho do outro. |

## Como começar

1. Copie `modelos/` para a raiz do projeto novo.
2. Preencha os `PREENCHA` do `CLAUDE.md`: nome, propósito, stack e as regras específicas.
3. Abra o agente na pasta e cole o `PROMPT-INICIAL.md`.
4. A partir daí, cada sessão termina com `SISTEMA.md` atualizado e cada decisão com uma linha em `DECISOES.md`.

Para apps com Supabase, use junto as [skills de Supabase](https://github.com/gabrielfonsecabh/skills-apps-supabase). Para ver o método aplicado num sistema completo, veja o [Bússola](https://github.com/gabrielfonsecabh/bussola).

## Contribuindo

Usou e encontrou uma regra que faltava? Abra uma issue contando o erro que a regra evita. Regra entra com história.

## Licença

[MIT](LICENSE). Criado por Gabriel Fonseca.
