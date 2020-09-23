#namespace("user")
    #sql("getByCond")
        select * from v_user
        #@getCond(cond)
    #end
    #sql("batchDelete")
        delete from user
        where id
        #@getIn(idList)
    #end
#end
#namespace("userRole")
    #sql("batchDelete")
        delete from user_role
        where userId=#para(userId)
        and roleId
        #@getIn(idList)
    #end
#end
#namespace("role")
    #sql("batchDelete")
        delete from role
        where id
        #@getIn(idList)
    #end
#end
#namespace("roleMenu")
    #sql("batchDelete")
        delete from role_menu
        where roleId=#para(roleId)
        and menuId
        #@getIn(idList)
    #end
#end
#namespace("org")
    #sql("getTree")
        select * from organization
        #if(parentId!=null)
            where parentId=#para(parentId)
        #else
            where parentId is null
        #end
    #end
    #sql("batchDelete")
        delete from organization
        where id
        #@getIn(idList)
    #end
#end
#namespace("menu")
    #sql("getTreeByUserId")
        select distinct m.id,m.name,orderNum
        from role_menu rm
        inner join user_role ur on rm.roleId=ur.roleId
        inner join menu m on m.id=rm.menuId
        inner join role r on rm.roleId=r.id
        where m.status=1 and r.status=1 and ur.userId=#para(userId) and m.type=#para(type)
        #if(parentId!=null)
            and parentId=#para(parentId)
        #else
            and parentId is null
        #end
        order by m.orderNum asc
    #end
    #sql("getTree")
        select * from menu where
        #if(parentId!=null)
            parentId=#para(parentId)
        #else
            parentId is null
        #end
    #end
#end

#define getCond(cond)
    #set(f=true)
    #for(x : cond)
        #if(x.value!=null)
            #if(f)
                where
                #set(f=false)
            #else
                and
            #end
            #(x.key) #para(x.value)
        #end
    #end
#end

#define getIn(idList)
    in(
        #for (x : idList)
            #(for.first ? "" : ",") #para(x)
        #end
    )
#end