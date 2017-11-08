-- Revert postgraphql_roles:server_role from pg

BEGIN;

do $$
begin
    perform true from pg_roles where rolname='postgraphql_server';
    if found then
       drop role postgraphql_server;
    end if;
end;
$$;

COMMIT;
