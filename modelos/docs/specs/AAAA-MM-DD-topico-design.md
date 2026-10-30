# Spec: PREENCHA (nome da feature)

Data: DD/MM/AAAA. Situação: rascunho | aprovada | implementada.

## Problema

Quem sofre, com o quê, hoje. Um parágrafo.

## Resultado esperado

O que a pessoa consegue fazer depois, em uma frase que dá para testar.

## Fora de escopo

O que esta feature NÃO faz.

## Dados

| Tabela ou view | Colunas novas ou usadas | De onde vem o dado |
|---|---|---|

Para cada número que aparece na tela: a query que o produz e um exemplo conferido à mão.

## Regras

Cada regra de negócio numerada, com um caso de exemplo e o resultado esperado.

## Permissões

| Ação | Quem pode | Como é garantido (política, gate, servidor) | Ataque que prova |
|---|---|---|---|

## Telas

O que aparece, o estado vazio, o estado de falha, o drill-down e a exportação.

## Riscos e falhas silenciosas

O que pode dar sucesso sem fazer nada aqui, e como a prova pega isso.

## Definition of Done

- [ ] Migration aplicada, re-executável, rollback em uma frase
- [ ] Query de prova de cada número, conferida à mão
- [ ] Ataques de permissão rodados, inclusive o caso negado
- [ ] Tela com vazio e falha distintos, exportação do estado filtrado
- [ ] Prints em 390 e 1440 px, claro e escuro, vistos
- [ ] `SISTEMA.md` e `DECISOES.md` atualizados
