-- Deploy postgraphile_roles:authenticator_role to pg

BEGIN;

set search_path to public;

CREATE FUNCTION pg_temp.foo(_role text, _pass text)
  RETURNS void AS
$func$
BEGIN
    perform true from pg_roles where rolname = _role;
    if not found then
        EXECUTE 'CREATE ROLE ' ||
          quote_ident(_role) ||
        ' WITH LOGIN PASSWORD ' ||
        quote_literal(_pass) ||
        ' NOINHERIT';

    end if;
END
$func$  LANGUAGE plpgsql;

SELECT pg_temp.foo(:'DATABASE_AUTHENTICATOR', :'DATABASE_AUTHENTICATOR_PASSWORD');

COMMIT;
