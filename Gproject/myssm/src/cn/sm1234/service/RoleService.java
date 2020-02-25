package cn.sm1234.service;

import cn.sm1234.domain.Role;
import cn.sm1234.util.Data;

import java.util.List;

public interface RoleService {
    List<Role> queryRole();

    int saveRolePermissionRelationship(Integer roleid, Data datas);
}
