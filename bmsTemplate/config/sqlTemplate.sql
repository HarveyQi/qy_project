#namespace("user")
    #sql("getByUserIdWithOrg")
        select u.*,o.organizationId,o.organizationName
        from user u
        left inner organization o
        on u.organizationId=o.organizationId
        where u.userId=#para(userId)
    #end
    #sql("getAllWithOrg")
        select u.*,o.organizationId,o.organizationName
        from user u
        left join organization o
        on u.organizationId=o.organizationId
        #if(condRoleId!=null)
            left join user_role ur
            on u.userId=ur.userId
            where ur.roleId=#para(condRoleId)
            #if(condOrgId!=null)
                and u.organizationId=#para(condOrgId)
            #end
        #else
            #if(condOrgId!=null)
                where u.organizationId=#para(condOrgId)
            #end
        #end
    #end
    #sql("getByUserName")
        select *
        from user
        where userName=#para(userName)
    #end
    #sql("getRoleIdsByUserId")
        select ur.roleId
        from user_role ur
        inner join role r
        on ur.roleId=r.roleId
        where r.status=1
        and ur.userId=#para(userId)
    #end
    #sql("getPermissionUrlsByUserId")
        select distinct p.url
        from role_permission rp
        inner join user_role ur
        on ur.roleId=rp.roleId
        inner join permission p
        on rp.permissionId=p.permissionId
        inner join role r
        on r.roleId=rp.roleId
        where r.status=1
        and p.status=1
        and p.url IS NOT NULL
        and ur.userId=#para(userId)
    #end
    #sql("getRoleByUserId")
        select
        r.roleId,r.roleName
        from user_role ur
        inner join role r
        on ur.roleId=r.roleId
        where ur.userId=#para(userId)
    #end
#end

#namespace("userRole")
    #sql("batchDelete")
        delete from user_role
        where userId=#para(userId)
        and roleId
        #@genIn(idList)
    #end
#end

#namespace("role")
    #sql("getPermissionIdsByRoleId")
        select p.permissionId
        from role_permission rp
        inner join permission p
        on rp.permissionId=p.permissionId
        where rp.roleId=#para(roleId)
    #end
#end

#namespace("rolePermission")
    #sql("getAllWithOrg")
        select r.*,o.organizationId,o.organizationName
        from role r
        left join organization
        on r.organizationId=o.organizationId
        #if(condOrgId!=null)
            where r.organizationId=#para(condOrgId)
        #end
    #end
    #sql("batchDelete")
        delete from role_permission
        where roleId=#para(roleId)
        and permissionId
        #@genIn(idList)
    #end
#end

#namespace("permission")
    #sql("getPermissionTree")
        select p.permissionId,p.permissionName
        from role_permission rp
        inner join user_role ur
        on ur.roleId=rp.roleId
        inner join permission p
        on rp.permissionId=p.permissionId
        inner join role r
        on rp.roleId=r.roleId
        where ur.userId=#para(userId)
        and p.type=#para(type)
        #if(null!=parentId)
            and
            p.parentId=#para(parentId)
        #end
        order by p.orderNum asc
    #end
    #sql("getMenuTree")
        select p.permissionId,p.permissionName,p.url
        from role_permission rp
        inner join user_role ur
        on ur.roleId=rp.roleId
        inner join permission p
        on rp.permissionId=p.permissionId
        inner join role r
        on rp.roleId=r.roleId
        where p.status=1
        and r.status=1
        and ur.userId=#para(userId)
        and p.type=#para(type)
        #if(null!=parentId)
            and
            p.parentId=#para(parentId)
        #end
        order by p.orderNum asc
    #end
#end

#namespace("org")
    #sql("getOrgIdsByParentId")
        select organizationId
        from organization
        where parentId=#para(parentId)
    #end
        #sql("getSubOrgTree")
        select *
        from organization
        where parentId=#para(parentId)
    #end
#end

#define genIn(idList)
    in(
        #for (x : idList)
            #(for.first ? "" : ",") #para(x)
        #end
    )
#end
