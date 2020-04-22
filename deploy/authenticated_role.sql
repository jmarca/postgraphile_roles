-- Deploy postgraphile_roles:authenticated_role to pg

BEGIN;

set search_path to public;

CREATE FUNCTION pg_temp.foo(_role text, _owner_role text)
  RETURNS void AS
$func$
BEGIN
    perform true from pg_roles where rolname = _role;
    if not found then
        EXECUTE 'CREATE ROLE ' ||
          quote_ident(_role) ||
          ' WITH  NOLOGIN';
        EXECUTE 'GRANT ' ||
          quote_ident(_role) ||
          ' TO ' ||
          quote_ident(_owner_role);
    end if;
END
$func$  LANGUAGE plpgsql;

SELECT pg_temp.foo(:'DATABASE_VISITOR', :'DATABASE_AUTHENTICATOR');

COMMIT;
