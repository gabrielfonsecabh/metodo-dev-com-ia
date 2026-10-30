# Ordem de trabalho e Definition of Done

## A ordem

1. **Spec.** `docs/specs/AAAA-MM-DD-topico-design.md`: problema, resultado testável, fora de escopo, dados, regras, permissões, telas. Para cada número da tela, a query que o produz.
2. **Dado.** Migration com o porquê no cabeçalho, re-executável, com rollback enunciável em uma frase.
3. **Regra.** O cálculo mora no banco (função ou view). "Postgres calcula, React renderiza." Cálculo que precisa ser auditado grava os insumos e a versão do motor, para ser reproduzido ao centavo.
4. **Prova.** A query de invariante rodada antes e depois, com o mesmo resultado onde deveria ser igual. Os ataques de permissão, inclusive o negado.
5. **Tela.** Só agora. Vazio e falha distintos, drill-down até o registro, exportação do estado filtrado.
6. **Registro.** `SISTEMA.md` com a data e o que é real; `DECISOES.md` com o motivo de cada escolha.

Inverter a ordem é a causa mais comum de retrabalho com agente: a tela fica pronta rápido, todo mundo se anima, e o número está errado.

## Definition of Done de uma feature de dados

- [ ] Spec escrita e aprovada.
- [ ] Migration aplicada e reaplicada sem erro.
- [ ] Rollback enunciado em uma frase.
- [ ] Toda tabela nova com RLS e as quatro políticas (ou fail-closed, na arquitetura com servidor).
- [ ] Toda função nova com `revoke` antes do `grant`; `SECURITY DEFINER` com gate.
- [ ] Query de prova de cada número, conferida à mão contra a fonte.
- [ ] Ataques rodados como usuário, com o caso negado.
- [ ] Paginação com ordem única; operação em massa com timeout ajustado.
- [ ] Tela distingue vazio, falha e "sem dado ainda".
- [ ] Exportação para Excel do estado filtrado.
- [ ] Prints em 390 e 1440 px, claro e escuro, vistos por uma pessoa.
- [ ] `SISTEMA.md`, `DECISOES.md` e `SEGURANCA.md` atualizados.

## Excel de saída

Quando a feature exporta para planilha: fórmula em vez de valor fixo onde o número é derivado, cor indicando o que é entrada e o que é cálculo, semáforo de variação em faixas claras (por exemplo 5% e 15%), e uma aba de Contexto com período, filtros aplicados e origem do dado.
