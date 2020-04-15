-- Deploy postgraphile_roles:server_role to pg

BEGIN;

set search_path to public;

do $$
begin
    perform true from pg_roles where rolname='postgraphile_server';
    if not found then
       create role postgraphile_server with nologin;
    end if;
end;
$$;

COMMIT;
