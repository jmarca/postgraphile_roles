-- Revert postgraphile_roles:server_role from pg

BEGIN;

do $$
begin
    perform true from pg_roles where rolname='postgraphile_server';
    if found then
       drop role postgraphile_server;
    end if;
end;
$$;

COMMIT;
