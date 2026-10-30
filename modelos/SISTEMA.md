# SISTEMA · o que é real e o que falta

O estado do sistema, entrada por entrada, a mais recente no topo. Cada entrada diz com data o que funciona com dado real, o que funciona com dado de teste e o que ainda não existe. Quem chega no projeto (você daqui a três meses, um sócio, o agente numa sessão nova) lê isto primeiro.

Regra: "pronto" aqui só com prova (query, ataque ou print). Sem prova, escreva "feito, não provado".

---

## DD/MM/AAAA · PREENCHA (ex.: Fase 2, fundação do banco, concluída)

| Parte | Situação |
|---|---|
| Banco | PREENCHA (ex.: 4 migrations aplicadas e reaplicadas sem erro; 9 tabelas com RLS e as 4 políticas; nada para `anon`) |
| Prova de segurança | PREENCHA (ex.: 24 de 24 ataques OK, detalhe em `SEGURANCA.md`) |
| Telas | PREENCHA (ex.: nenhuma ainda; o app mostra só o aviso de configuração encontrada) |
| Dado real | PREENCHA (ex.: não importado; depende do arquivo X) |
| Pendências | PREENCHA, cada uma com dono |

## DD/MM/AAAA · antes do código

- Spec aprovada: `docs/specs/AAAA-MM-DD-visao-geral-design.md`.
- Decisões de arquitetura registradas em `DECISOES.md`.
