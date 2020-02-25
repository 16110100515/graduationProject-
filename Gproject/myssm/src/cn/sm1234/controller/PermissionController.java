package cn.sm1234.controller;

import cn.sm1234.domain.Permission;
import cn.sm1234.domain.User;
import cn.sm1234.service.LogService;
import cn.sm1234.service.PermissionService;
import cn.sm1234.util.AjaxResult;
import cn.sm1234.util.Const;
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
@RequestMapping("/permission")
public class PermissionController extends BaseController {
    @Autowired
    private PermissionService permissionService;
    @Autowired
    private LogService logService;

    @RequestMapping("/toUpdate")
    public  String toUpdate(Integer id,Map map){
        Permission permission = permissionService.getPermissioById(id);
        map.put("permission",permission);
        return "permission/update";
    }
    @RequestMapping("/toAdd")
    public  String toAdd(){
        return "permission/add";
    }
    @RequestMapping("/index")
    public String index(){
        return "permission/index";
    }


    @ResponseBody
    @RequestMapping("/deletePermission")
    public Object deletePermission(Integer id, HttpSession session){
//        AjaxResult result = new AjaxResult();
        start();
        try {

            int count = permissionService.deletePermission(id);

            User user = (User)session.getAttribute(Const.LOGIN_USER);
            logService.insert(user.getUsername(),"删除许可");

            success(count==1);
        } catch (Exception e) {
            success(false);
            error("删除许可树数据失败!form-controller");
        }

        return end() ;
    }
//    @ResponseBody
//    @RequestMapping("/deletePermission")
//    public Object deletePermission(Integer id){
//        AjaxResult result = new AjaxResult();
//
//        try {
//
//            int count = permissionService.deletePermission(id);
//
//            result.setSuccess(count == 1);
//        } catch (Exception e) {
//            result.setSuccess(false);
//            result.setMessage("删除许可树数据失败!form-controller");
//        }
//
//        return result ;
//    }
    @ResponseBody
    @RequestMapping("/doUpdate")
    public Object doUpdate(Permission permission,HttpSession session){
        AjaxResult result = new AjaxResult();

        try {

            int count = permissionService.updatePermission(permission);

            result.setSuccess(count == 1);
            User user = (User)session.getAttribute(Const.LOGIN_USER);
            logService.insert(user.getUsername(),"更新许可");
        } catch (Exception e) {
            result.setSuccess(false);
            result.setMessage("修改许可树数据失败!");
        }

        return result ;
    }
    @ResponseBody
    @RequestMapping("/doAdd")
    public Object doAdd(Permission permission,HttpSession session){
        AjaxResult result = new AjaxResult();

        try {

            int count = permissionService.savePermission(permission);

            result.setSuccess(count == 1);
            User user = (User)session.getAttribute(Const.LOGIN_USER);
            logService.insert(user.getUsername(),"添加许可");
        } catch (Exception e) {
            result.setSuccess(false);
            result.setMessage("保存许可树数据失败!");
        }

        return result ;
    }
    @ResponseBody
    @RequestMapping("/loadData")
    public Object loadData(){
        AjaxResult result = new AjaxResult();
        try {
            //Demo 4 一次查询所有数据

            List<Permission> root = new  ArrayList<Permission>();

            List<Permission> childredPermissons =  permissionService.queryAllPermission();

            Map<Integer,Permission> map = new HashMap<Integer,Permission>();//100
            for(Permission innerpermission:childredPermissons){
                map.put(innerpermission.getId(),innerpermission);
            }

            for (Permission permission : childredPermissons) {
                //通过子查找父
                //子菜单//
//                Permission child = permission ; //假设为子菜单
                if(permission.getPid() == 0 ){
                    root.add(permission);
                }else{
                    Permission parent = map.get(permission.getPid());
                    parent.getChildren().add(permission);
                }
            }
            result.setSuccess(true);
            result.setData(root);
        }catch (Exception e){
            result.setSuccess(false);
            result.setMessage("加载许可树数据失败!");
        }
        return result;
    }
//    @ResponseBody
//    @RequestMapping("/loadData")
//    public Object loadData(){
//        AjaxResult result = new AjaxResult();
//        try {
//            //Demo 4 一次查询所有数据
//            List<Permission> root = new ArrayList<Permission>();
//
//
//            List<Permission> childredPermissons =  permissionService.queryAllPermission();
//            for (Permission permission : childredPermissons) {
//                //通过子查找父
//                //子菜单//
////                Permission child = permission ; //假设为子菜单
//                if(permission.getPid() == 0 ){
//                    root.add(permission);
//                }else{
//                    //父节点
//                    for (Permission innerpermission : childredPermissons) {
//                        if(permission.getPid() == innerpermission.getId()){
////                            Permission parent = innerpermission;
//                            innerpermission.getChildren().add(permission);
//                            break ; //跳出内层循环,如果跳出外层循环,需要使用标签跳出
//                        }
//                    }
//                }
//            }
//            result.setSuccess(true);
//            result.setData(root);
//        }catch (Exception e){
//            result.setSuccess(false);
//            result.setMessage("加载许可树数据失败!");
//        }
//        return result;
//    }

////递归
//    @ResponseBody
//    @RequestMapping("/loadData")
//    public Object loadData(){
//        AjaxResult result = new AjaxResult();
//        try {
//            List<Permission> root = new ArrayList<Permission>();
//
//            Permission permission = permissionService.getRootPermission();
//            root.add(permission);
//
//            queryChildPermissions(permission);
//
//            result.setSuccess(true);
//            result.setData(root);
//        }catch (Exception e){
//            result.setSuccess(false);
//            result.setMessage("加载许可树数据失败!");
//        }
//        return result;
//    }
    public void queryChildPermissions(Permission permission){
        List<Permission> children = permissionService.getChildrenPermissionByPid(permission.getId());
        permission.setChildren(children);
        for(Permission innerChildren:children){
            queryChildPermissions(innerChildren);
        }
    }
//    @ResponseBody
//    @RequestMapping("/loadData")
//    public Object loadData(){
//        AjaxResult result = new AjaxResult();
//        try {
//            List<Permission> root = new ArrayList<Permission>();
//
//            Permission permission = permissionService.getRootPermission();
//            root.add(permission);
//            List<Permission> children = permissionService.getChildrenPermissionByPid(permission.getId());
//            permission.setChildren(children);
//            for(Permission child:children){
//                List<Permission> innerChildren = permissionService.getChildrenPermissionByPid(child.getId());
//                child.setChildren(innerChildren);
//            }
//
//            result.setSuccess(true);
//            result.setData(root);
//        }catch (Exception e){
//            result.setSuccess(false);
//            result.setMessage("加载许可树数据失败!");
//        }
//        return result;
//    }
//    @ResponseBody
//    @RequestMapping("/loadData")
//    public Object loadData(){
//        AjaxResult result = new AjaxResult();
//        try {
//            Permission permission = new Permission();
//            permission.setName("11");
//            List<Permission> children = new ArrayList<Permission>();
//            Permission permission1 = new Permission();
//            permission1.setName("11-1");
//            children.add(permission1);
//
//            Permission permission2 = new Permission();
//            permission2.setName("11-2");
//            children.add(permission2);
//
//            permission.setChildren(children);
//            result.setSuccess(true);
//            result.setData(permission);
//        }catch (Exception e){
//            result.setSuccess(false);
//            result.setMessage("加载许可树数据失败!");
//        }
//        return result;
//    }
}
