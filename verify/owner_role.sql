-- Verify postgraphile_roles:owner_role on pg

BEGIN;

select 1/count(*) from pg_roles where rolname=:'DATABASE_OWNER';

ROLLBACK;
