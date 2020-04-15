-- Revert postgraphile_roles:forum_user_role from pg

BEGIN;

do $$
begin
    perform true from pg_roles where rolname='forum_user';
    if found then
       drop role forum_user;
    end if;
end;
$$;

COMMIT;
