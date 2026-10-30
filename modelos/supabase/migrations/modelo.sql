-- ============================================================================
-- AAAAMMDDHHMMSS_nome_curto.sql
--
-- POR QUE: PREENCHA. O problema que esta migration resolve, com o fato que o
-- revelou (ex.: "a exportação de pedidos perdia linhas porque ...").
--
-- ROLLBACK EM UMA FRASE: PREENCHA (ex.: "drop table app.pedidos; nada mais
-- depende dela").
--
-- PROVA: PREENCHA a query de invariante rodada antes e depois.
-- Re-executável: pode rodar o arquivo inteiro de novo sem erro.
-- ============================================================================

create table if not exists app.pedidos (
  id          bigint generated always as identity primary key,
  company_id  uuid not null references app.companies(id) on delete cascade,
  descricao   text not null,
  valor       numeric(14,2) not null check (valor >= 0),
  created_at  timestamptz not null default now(),
  created_by  uuid references auth.users(id) default auth.uid()
);

create index if not exists idx_pedidos_company on app.pedidos (company_id);

alter table app.pedidos enable row level security;

-- As quatro políticas. Sem uma delas, o verbo correspondente falha em silêncio.
drop policy if exists pedidos_select on app.pedidos;
create policy pedidos_select on app.pedidos for select
  using (app.belongs_to_company((select auth.uid()), company_id));

drop policy if exists pedidos_insert on app.pedidos;
create policy pedidos_insert on app.pedidos for insert
  with check (app.has_permission((select auth.uid()), company_id, 'pedidos.edit'));

drop policy if exists pedidos_update on app.pedidos;
create policy pedidos_update on app.pedidos for update
  using      (app.has_permission((select auth.uid()), company_id, 'pedidos.edit'))
  with check (app.has_permission((select auth.uid()), company_id, 'pedidos.edit'));

drop policy if exists pedidos_delete on app.pedidos;
create policy pedidos_delete on app.pedidos for delete
  using (app.is_company_admin((select auth.uid()), company_id));

-- Função de resumo: o agregado vem do banco, não de soma no navegador.
create or replace function app.pedidos_resumo(p_pedido_id bigint)
returns table (company_id uuid, total numeric)
language plpgsql security definer set search_path = '' as $fn$
declare
  v_company uuid;
begin
  -- Deriva a empresa da linha em vez de confiar num parâmetro.
  select p.company_id into v_company from app.pedidos p where p.id = p_pedido_id;
  if v_company is null
     or not app.belongs_to_company((select auth.uid()), v_company) then
    raise exception 'Sem permissão' using errcode = '42501';
  end if;
  return query
    select p.company_id, sum(p.valor) from app.pedidos p
     where p.company_id = v_company group by p.company_id;
end;
$fn$;

-- Revoke ANTES do grant: função nova nasce executável por PUBLIC.
revoke all on function app.pedidos_resumo(bigint) from public, anon;
grant execute on function app.pedidos_resumo(bigint) to authenticated;
