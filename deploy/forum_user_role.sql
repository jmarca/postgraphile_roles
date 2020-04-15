-- Deploy postgraphile_roles:forum_user_role to pg

BEGIN;

set search_path to public;

do $$
begin
    perform true from pg_roles where rolname='forum_user';
    if not found then
       create role forum_user with nologin;
       grant forum_user to postgraphile_server;
    end if;
end;
$$;

COMMIT;
