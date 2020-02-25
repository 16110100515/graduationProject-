package cn.sm1234.controller;

import cn.sm1234.domain.Permission;
import cn.sm1234.domain.Role;
import cn.sm1234.domain.User;
import cn.sm1234.service.LogService;
import cn.sm1234.service.PermissionService;
import cn.sm1234.service.RoleService;
import cn.sm1234.util.AjaxResult;
import cn.sm1234.util.Const;
import cn.sm1234.util.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/role")
public class RoleController extends BaseController{

    @Autowired
    private RoleService roleService;
    @Autowired
    private PermissionService permissionService;
    @Autowired
    private LogService logService;

    @RequestMapping("/index")
    public String index(Map map){
        List<Role> roleList = roleService.queryRole();
        map.put("roleList",roleList);
        return "role/index";
    }
    @RequestMapping("/assignPermission")
    public String assignPermission(){
        return "role/assignPermission";
    }

    @ResponseBody
    @RequestMapping("/doAssignPermission")
    public Object doAssignPermission(Integer roleid, Data datas, HttpSession session){
        AjaxResult result = new AjaxResult();
        try{
            int count = roleService.saveRolePermissionRelationship(roleid,datas);
            result.setSuccess(count==datas.getIds().size());
            User user = (User)session.getAttribute(Const.LOGIN_USER);
            logService.insert(user.getUsername(),"分配许可");
        }catch (Exception e){
            result.setSuccess(false);
            result.setMessage("error from controller");
        }

        return result;
    }
    @ResponseBody
    @RequestMapping("/loadDataAsync")
    public Object loadDataAsync(Integer roleid123){


        List<Permission> root = new ArrayList<Permission>();

        List<Permission> childredPermissons =  permissionService.queryAllPermission();

        List<Integer>  permissionIdsForRoleid = permissionService.queryPermissionidsByRoleid(roleid123);

        Map<Integer,Permission> map = new HashMap<Integer,Permission>();//100

        for (Permission innerpermission : childredPermissons) {
            map.put(innerpermission.getId(), innerpermission);
            if(permissionIdsForRoleid.contains(innerpermission.getId())){
                innerpermission.setChecked(true);
            }
        }


        for (Permission permission : childredPermissons) { //100
            //通过子查找父
            //子菜单
            Permission child = permission ; //假设为子菜单
            if(child.getPid() == 0 ){
                root.add(permission);
            }else{
                //父节点
                Permission parent = map.get(child.getPid());
                parent.getChildren().add(child);
            }
        }

        return root ;
    }
}
