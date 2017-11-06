-- Deploy postgraphql_roles:server_role to pg

BEGIN;

set search_path to public;

do $$
begin
    perform true from pg_roles where rolname='postgraphql_server';
    if not found then
       create role postgraphql_server with nologin;
    end if;
end;
$$;

COMMIT;
