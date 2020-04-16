-- Verify postgraphile_roles:forum_user_role on pg

BEGIN;

select 1/count(*) from pg_roles where rolname=:'DATABASE_AUTHENTICATOR';

with visitorid (oid) as (
    select oid from pg_roles where rolname= :'DATABASE_AUTHENTICATOR'
),
assigned_role(rolname,oid,member) as (
    select a.rolname,a.oid,b.roleid as member
    from pg_roles a
    join pg_auth_members b on (a.oid=b.member)
    join visitorid c on (b.roleid=c.oid)
    where a.rolname = :'DATABASE_OWNER'
)
select 1/count(*) from assigned_role;

ROLLBACK;
