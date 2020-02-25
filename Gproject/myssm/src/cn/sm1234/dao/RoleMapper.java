package cn.sm1234.dao;

import cn.sm1234.domain.Role;
import cn.sm1234.domain.RolePermission;
import cn.sm1234.util.Data;

import java.util.List;

public interface RoleMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Role record);

    Role selectByPrimaryKey(Integer id);

    List<Role> selectAll();

    int updateByPrimaryKey(Role record);

    int saveRolePermissionRelationship(Integer roleid, Data datas);

    void deleteRolePermissionRelationship(Integer roleid);

    int insertRolePermission(RolePermission rp);
}