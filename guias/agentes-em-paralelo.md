# Vários agentes em paralelo

Dá para pôr seis agentes escrevendo seis telas ao mesmo tempo. Dá também para terminar com seis versões diferentes do mesmo componente e um build quebrado. A diferença está na preparação.

## A receita

1. **Escreva a camada compartilhada antes, uma vez só, com um agente só.** Tokens do design system, shell, cliente do banco, hooks de consulta, componentes de tabela, formatação de moeda e data, tratamento de vazio e falha. Faça o build passar.
2. **Dê a cada agente a lista exata dos arquivos dele.** "Você cria e edita só `src/features/pedidos/*`." Tudo fora da lista é somente leitura.
3. **Instrua a relatar em vez de editar fora da lista.** "Se precisar mudar algo compartilhado, não mude: escreva no relatório final o que precisa e por quê." Você decide depois e aplica uma vez.
4. **Uma spec por agente**, com as queries e os estados de cada tela.
5. **Um revisor por frente.** Outro agente, que não escreveu o código, confere contra a spec e o Definition of Done. O trabalho não se corrige sozinho.
6. **Junte em sequência.** Build e testes a cada frente integrada, não tudo de uma vez no final.

## Sinais de que a preparação faltou

- Dois agentes criaram `formatarMoeda` com comportamentos diferentes.
- Um agente "consertou" o tema para a tela dele ficar bonita e quebrou as outras.
- O build só passa com as frentes integradas numa ordem específica.

Quando isso acontece, pare, extraia o que é compartilhado para a camada comum e recomece as frentes a partir dela.
