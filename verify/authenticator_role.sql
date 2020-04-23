-- Verify postgraphile_roles:anonymous_role on pg

BEGIN;

select 1/count(*) from pg_roles where rolname=:'DATABASE_AUTHENTICATOR';


ROLLBACK;
