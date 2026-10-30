# Prompt inicial

Cole no agente, na pasta do projeto, depois de preencher o `CLAUDE.md`.

---

Leia `CLAUDE.md` inteiro e as skills que ele cita. Depois, nesta ordem, sem pular etapa e me mostrando o resultado de cada uma antes de seguir:

**Fase 0, descoberta.** Me faça as perguntas que faltam para escrever a spec: quem usa, o que precisa ver, de onde vem cada dado, o que é segredo, quantas empresas e usuários, volume esperado de linhas. No máximo 10 perguntas, as mais importantes primeiro.

**Fase 1, spec.** Escreva `docs/specs/AAAA-MM-DD-visao-geral-design.md` com o modelo de dados (tabelas, colunas, relações), os papéis e permissões, as telas e, para cada número que aparece na tela, a query que o produz. Registre em `DECISOES.md` cada escolha de arquitetura e o motivo.

**Fase 2, fundação do banco.** Migrations de empresa, vínculo de usuário, papéis e permissões, com as quatro políticas por tabela e as funções auxiliares. Prove com o roteiro de `SEGURANCA.md`: cada ataque da lista, rodando como o usuário (`set local role` e `request.jwt.claims`, dentro de transação com rollback), incluindo os casos negados. Só siga com todos OK.

**Fase 3, regras de negócio no banco.** Funções e views que calculam o que as telas vão mostrar. Para cada uma, a query de prova com o resultado esperado conferido à mão.

**Fase 4, esqueleto da interface.** Tokens do design system, shell, login, troca de senha no primeiro acesso, rota `/design-system` fora do menu. Prints em 390 px e 1440 px, claro e escuro.

**Fase 5, telas.** Uma por vez, na ordem da spec. Cada tela distingue vazio de falha, exporta para Excel o estado filtrado e tem o print conferido.

Ao fim de cada fase, atualize `SISTEMA.md` com a data, o que é dado real e o que ainda falta.
