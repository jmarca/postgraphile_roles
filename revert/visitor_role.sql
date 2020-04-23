-- Revert postgraphile_roles:visitor_role from pg

BEGIN;

CREATE FUNCTION pg_temp.foo(_role text)
  RETURNS void AS
$func$
BEGIN
    perform true from pg_roles where rolname = _role;
    if found then
        EXECUTE 'DROP ROLE ' || quote_ident(_role) ;
    end if;

END
$func$  LANGUAGE plpgsql;

SELECT pg_temp.foo(:'DATABASE_VISITOR');

COMMIT;
