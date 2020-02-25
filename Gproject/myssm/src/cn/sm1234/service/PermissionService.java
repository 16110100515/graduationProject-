package cn.sm1234.service;

import cn.sm1234.domain.Permission;

import java.util.List;

public interface PermissionService {
    Permission getRootPermission();

    List<Permission> getChildrenPermissionByPid(Integer id);

    List<Permission> queryAllPermission();

    int savePermission(Permission permission);

    Permission getPermissioById(Integer id);

    int updatePermission(Permission permission);

    int deletePermission(Integer id);

    List<Integer> queryPermissionidsByRoleid(Integer roleid);
}
