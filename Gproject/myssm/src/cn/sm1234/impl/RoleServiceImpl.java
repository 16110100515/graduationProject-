package cn.sm1234.impl;

import cn.sm1234.dao.RoleMapper;
import cn.sm1234.domain.Role;
import cn.sm1234.domain.RolePermission;
import cn.sm1234.service.RoleService;
import cn.sm1234.util.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoleServiceImpl implements RoleService {
    @Autowired
    private RoleMapper roleMapper;

    @Override
    public List<Role> queryRole() {
        return roleMapper.selectAll();
    }

    @Override
    public int saveRolePermissionRelationship(Integer roleid, Data datas) {
        roleMapper.deleteRolePermissionRelationship(roleid);
        int count = 0;
        for(Integer peimissionid:datas.getIds()){
            RolePermission rp = new RolePermission();
            rp.setRoleid(roleid);
            rp.setPermissionid(peimissionid);
            count+=roleMapper.insertRolePermission(rp);
        }
        return count;
    }
}
