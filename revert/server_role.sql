-- Revert postgraphql_roles:server_role from pg

BEGIN;

drop role postgraphql_server;

COMMIT;
