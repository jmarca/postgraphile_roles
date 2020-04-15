-- Deploy postgraphile_roles:anonymous_role to pg

BEGIN;

set search_path to public;

do $$
begin
    perform true from pg_roles where rolname='forum_anonymous';
    if not found then
       create role forum_anonymous with nologin;
       grant forum_anonymous to postgraphile_server;
    end if;
end;
$$;

COMMIT;
