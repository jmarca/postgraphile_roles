-- Revert postgraphile_roles:owner_role from pg

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

SELECT pg_temp.foo(:'DATABASE_OWNER');

COMMIT;


-- do $$
-- begin
--     perform true from pg_roles where rolname='DATABASE_OWNER';
--     if found then
--        drop role 'DATABASE_OWNER';
--     end if;
-- end;
-- $$;
