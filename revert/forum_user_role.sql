-- Revert postgraphql_roles:forum_user_role from pg

BEGIN;

drop role forum_user;

COMMIT;
