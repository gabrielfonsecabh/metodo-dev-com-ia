# RUNBOOK · operação do dia a dia

O que fazer, com o comando exato. Tudo assume o `.env` preenchido.

## Acesso

| Ambiente | Endereço |
|---|---|
| Local | `npm run dev` em http://localhost:PREENCHA |
| Produção | PREENCHA |
| Banco | PREENCHA |

## Cadastrar uma pessoa

PREENCHA os passos e o SQL exato (criar no Auth, vincular à empresa, dar papel, marcar troca de senha obrigatória).

## Tirar o acesso de uma pessoa

PREENCHA. Desativar o vínculo (`is_active = false`) antes de apagar qualquer coisa, e conferir com o ataque A8 de `SEGURANCA.md`.

## Aplicar uma migration

1. Ler a migration inteira e enunciar o rollback em uma frase.
2. Rodar a query de invariante antes e guardar o resultado.
3. Aplicar: `PREENCHA`.
4. Rodar a mesma query depois e comparar, ao centavo.
5. Rodar os ataques de `SEGURANCA.md`.

## Publicar

PREENCHA.

## Quando algo der errado

| Sintoma | Primeira coisa a olhar |
|---|---|
| Salvou e não mudou nada | Política de update da tabela; a escrita afetou 0 linhas |
| Consulta morre em 8 segundos | `statement_timeout` do papel `authenticated` |
| Exportação com linha faltando ou repetida | Paginação sem ordem única |
| Usuário vê dado de outra empresa | Função `SECURITY DEFINER` sem gate |
