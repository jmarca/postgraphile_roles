-- Verify postgraphql_roles:server_role on pg

BEGIN;

select 1/count(*) from pg_roles where rolname='postgraphql_server';

ROLLBACK;
