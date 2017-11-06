-- Revert postgraphql_roles:anonymous_role from pg

BEGIN;

drop role forum_anonymous;

COMMIT;
