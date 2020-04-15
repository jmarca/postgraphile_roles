-- Revert postgraphile_roles:anonymous_role from pg

BEGIN;

do $$
begin
    perform true from pg_roles where rolname='forum_anonymous';
    if found then
       drop role forum_anonymous;
    end if;
end;
$$;

COMMIT;
