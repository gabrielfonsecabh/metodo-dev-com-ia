# DESIGN-SYSTEM · convenções de interface do PREENCHA

Este arquivo tem duas funções: dizer como as telas deste projeto são feitas e servir de briefing para o próximo projeto. Tudo abaixo da marca "COLE A PARTIR DAQUI" pode ser colado no `CLAUDE.md` de outro repositório.

<!-- ======================= COLE A PARTIR DAQUI ======================= -->

## Cores

- Toda cor resolve para um token semântico. No momento em que um componente escreve um hex ou o nome de um matiz (`bg-blue-600`), o design system acabou.
- O shadcn/ui só traz `destructive`. Defina à mão `success`, `warning` e `info`, cada um com o seu `-foreground`, e variantes `-subtle` para tabela densa.
- Tokens em `src/index.css`, em `:root` e `.dark`. PREENCHA a cor de marca e onde ela pode aparecer.
- Semáforo de variação invertível: queda de custo é verde, queda de receita é vermelha.

## Tipografia

- PREENCHA as famílias e a escala.
- `tabular-nums` em toda coluna numérica. Moeda e percentual no formato pt-BR.

## Estrutura

- Shell: sidebar com grupo de token próprio, escura nos dois temas. Ação primária numa só cor.
- Detalhe em três níveis: o card com o número, a lista que compõe o número, a ficha do registro. Ação inline no nível do detalhe.
- Sheet quando o usuário precisa comparar com a tabela; dialog quando precisa responder uma pergunta; rota nova só quando o detalhe é destino que se compartilha por link.
- Exportação para Excel do estado filtrado em toda tabela.
- Filtro viaja para o banco. Agregado vem do banco, não de soma em JavaScript.

## Estados vazios e falhas

Vazio não é zero. Cada lista diz qual dos dois aconteceu:

- **Nenhum registro:** a consulta funcionou e nada corresponde ao filtro. Diz o que fazer em seguida.
- **A consulta falhou:** diz o motivo em uma frase e oferece "Tentar de novo".
- **Sem dado ainda:** diz o que falta para ativar, sem gráfico de exemplo.
- Período parcial leva tarja. Estimativa leva nota.

## Texto

Português do Brasil, frase curta, voz ativa. O botão diz o que acontece ("Salvar e enviar") e o aviso de sucesso repete a mesma palavra ("Enviado."). Erro diz o que houve e como resolver, sem pedir desculpa.

## Conferência antes de dizer que uma tela está pronta

1. Prints em 390 px e 1440 px, tema claro e escuro, sem rolagem horizontal.
2. Rota `/design-system` (fora do menu) conferida nos dois temas: todo quadro muda ao trocar o tema.
3. Foco visível no teclado em todo controle.
4. Estado vazio e estado de falha vistos de propósito, não só o caminho feliz.

<!-- ======================= ATÉ AQUI ======================= -->

## Específico deste projeto

PREENCHA: componentes próprios, onde ficam e quando usar cada um.
