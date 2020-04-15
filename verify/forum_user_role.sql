-- Verify postgraphile_roles:forum_user_role on pg

BEGIN;

select 1/count(*) from pg_roles where rolname='forum_user';

ROLLBACK;
