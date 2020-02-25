package cn.sm1234.controller;

import cn.sm1234.domain.Log;
import cn.sm1234.domain.Role;
import cn.sm1234.domain.User;
import cn.sm1234.domain.UserSelect;
import cn.sm1234.service.LogService;
import cn.sm1234.service.UserService;
import cn.sm1234.util.*;
import org.omg.Messaging.SYNC_WITH_TRANSPORT;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;
    @Autowired
    private LogService logService;
    //异步请求
    @RequestMapping("/toIndex")
    public String toIndex(){
        return "user/index";
    }
    @RequestMapping("/toAdd")
    public String toAdd(){
        return "user/add";
    }
    @RequestMapping("/toUpdate")
    public String toUpdate(Integer id,Map map){
        User user = userService.getUserById(id);
        map.put("user",user);
        logService.insert(user.getUsername(),"更新用户信息");
        return "user/update";
    }
    @RequestMapping("/assignRole")
    public String assignRole(Integer id,Map map){
        List<Role> allListRole = userService.querAllRole();
//        System.out.println("我查了alllistrole");
//        System.out.println(allListRole.size());
//
        List<Integer> roleIds = userService.queryRoleByUserid(id);
//        System.out.println("我查了roleids");

//        System.out.println(roleIds.size());
        List<Role> leftRoleList = new ArrayList<Role>(); //未分配角色
        List<Role> rightRoleList = new ArrayList<Role>(); //已分配角色
        for (Role role:allListRole){
            if(roleIds.contains(role.getId())){
                rightRoleList.add(role);
            }else {
                leftRoleList.add(role);
            }
        }
        map.put("leftRoleList", leftRoleList);
        map.put("rightRoleList", rightRoleList);


        return "user/assignrole";
    }

    @ResponseBody
    @RequestMapping("/doAssignRole")
    public Object doAssignRole(Integer userid,Data data,HttpSession session){
        AjaxResult result = new AjaxResult();
        try {
//
            userService.saveUserRoleRelationship(userid,data);
            result.setSuccess(true);
            result.setMessage("分配角色成功!from controller");
            User user = (User)session.getAttribute(Const.LOGIN_USER);
            logService.insert(user.getUsername(),"分配角色");
        } catch (Exception e) {
            result.setSuccess(false);
            e.printStackTrace();
            result.setMessage("分配角色数据失败fromcontroller!");
        }

        return result;
    }
    @ResponseBody
    @RequestMapping("/doUnAssignRole")
    public Object doUnAssignRole(Integer userid,Data data,HttpSession session){
        AjaxResult result = new AjaxResult();
        try {
//
            userService.deleteUserRoleRelationship(userid,data);
            result.setSuccess(true);
            result.setMessage("分配角色失败! from controller");
            User user = (User)session.getAttribute(Const.LOGIN_USER);
            logService.insert(user.getUsername(),"移除用户角色");
        } catch (Exception e) {
            result.setSuccess(false);
            e.printStackTrace();
            result.setMessage("分配角色数据失败fromcontroller!");
        }

        return result;
    }
    @ResponseBody
    @RequestMapping("/doAdd")
    public Object doAdd(Data data,HttpSession session){
        AjaxResult result = new AjaxResult();
        int count = 0;
        try {
//            for(User user:data.getDatas()){
                for(User user:data.getDatas()){
                    if(user.getLoginacct()==null){
                        System.out.println("null="+user);
                        data.getDatas().remove(user);
                    }
            }
                count = userService.saveUserAdd(data);
//                System.out.println("count=:"+count);
//            }

            result.setSuccess(count==data.getDatas().size());
//            result.setSuccess(true);
            result.setMessage("批量保存数据success!");
            User user = (User)session.getAttribute(Const.LOGIN_USER);
            logService.insert(user.getUsername(),"（批量）添加用户");
        } catch (Exception e) {
            result.setSuccess(false);
            e.printStackTrace();
            result.setMessage("保存数据失败123!");
        }

        return result;
    }
    @ResponseBody
    @RequestMapping("/doUpdate")
    public Object doUpdate(User user,HttpSession session){
        AjaxResult result = new AjaxResult();
        try {

            int count = userService.updateUser(user);
            result.setMessage("修改数据success!");
            result.setSuccess(count==1);
            User user2 = (User)session.getAttribute(Const.LOGIN_USER);
            logService.insert(user2.getUsername(),"更新某一用户");
            logService.insert(user.getUsername(),"被更新的用户");
        } catch (Exception e) {
            result.setSuccess(false);
            e.printStackTrace();
            result.setMessage("修改数据失败123!");
        }

        return result;
    }
    @ResponseBody
    @RequestMapping("/doDelete")
    public Object doDelete(Integer id,HttpSession session){
        AjaxResult result = new AjaxResult();
        try {
            int count = userService.deleteUser(id);
            result.setMessage("修改数据success!");
            result.setSuccess(count==1);
            User user = (User)session.getAttribute(Const.LOGIN_USER);
            logService.insert(user.getUsername(),"删除某一用户");
        } catch (Exception e) {
            result.setSuccess(false);
            e.printStackTrace();
            result.setMessage("修改数据失败123!");
        }

        return result;
    }
    //接收多条数据.
    @ResponseBody
    @RequestMapping("/doDeleteBatch")
    public Object doDeleteBatch(Data data,HttpSession session){
//        System.out.println(data.getDatas());
        AjaxResult result = new AjaxResult();
        int count=0;
        try {
            for(User user:data.getDatas()){

                 count += userService.deleteUser(user.getId());
            }

//            int count = userService.deleteBatchUser(intarray);
            result.setSuccess(count==data.getDatas().size());
            User user = (User)session.getAttribute(Const.LOGIN_USER);
            logService.insert(user.getUsername(),"删除了好多用户");
        } catch (Exception e) {
            result.setSuccess(false);
            e.printStackTrace();
            result.setMessage("删除数据失败!");
        }

        return result;
    }
//    @ResponseBody
//    @RequestMapping("/doDeleteBatch")
//    public Object doDeleteBatch(String idStr){
//        String[] strings = idStr.split(",");
//        System.out.println(strings.toString());
//        Integer[] intarray=new Integer[strings.length];
//        int i=0;
//        for(String str:strings){
//            intarray[i]=Integer.parseInt(str);//Exception in this line
//            i++;
//        }
//        AjaxResult result = new AjaxResult();
//        try {
//
//            int count = userService.deleteBatchUser(intarray);
//            result.setSuccess(count==intarray.length);
//        } catch (Exception e) {
//            result.setSuccess(false);
//            e.printStackTrace();
//            result.setMessage("删除数据失败!");
//        }
//
//        return result;
//    }

    //    //异步请求
    @ResponseBody
    @RequestMapping("/index")
    public Object index(@RequestParam(value="pageno",required=false,defaultValue="1") Integer pageno,
                        @RequestParam(value="pagesize",required=false,defaultValue="10") Integer pagesize,
                        String queryText,
                        String[] check_val,String check_val1,
                        HttpSession session){
//        System.out.println(check_val);
//        System.out.println(check_val1);
        String[] sss = check_val1.split(" ");
        String[] ss;
        AjaxResult result = new AjaxResult();
        try {

            Map paramMap = new HashMap();
            paramMap.put("pageno", pageno);
            paramMap.put("pagesize", pagesize);
            if (StringUtil.isNotEmpty(queryText)){
                paramMap.put("queryText", queryText); //   \%

            }
//            if (check_val==null||check_val.length==0){
//                paramMap.put("check_val", check_val);
//
//            }
            User user = (User) session.getAttribute(Const.LOGIN_USER);
            String loginacct = user.getLoginacct();
//            System.out.println(loginacct);
            Page page = userService.queryUserPage(paramMap);
            List<UserSelect> userSelect = userService.queryUserSelect();//用以获取下拉列表字段
            String str = userService.queryUserSelected(loginacct);//用以获取下拉列表用户已经选择的字段
//            System.out.println(str);
            if (loginacct!=null){
                if(StringUtil.isNotEmpty(str)){
                    ss = str.split(",");
                    System.out.println(ss+"1");
                    if(ss!=sss&&sss[0]!=""&&(!(sss.equals("")))){
                        ss=sss;
                        StringBuffer str2 = new StringBuffer();
                        for (String s : ss) {
                            str2.append(s+',');
                        }System.out.println(str2);
                        Map map = new HashMap();
                        map.put("userid",loginacct);
                        map.put("selected",str2.toString());
                        userService.saveUserSelected(map);
                    }
                }else{
                    String string = "0,1,2";
                    ss= string.split(",");
                    Map map = new HashMap();
                    map.put("userid",loginacct);
                    map.put("selected",string);
                    userService.insertUserSelected(map);
                }
            }else {
                ss = "".split(",");
            }
            result.setUserList(userSelect);
            result.setCheck_val(ss);
            result.setSuccess(true);
            result.setPage(page);
        }catch (Exception e){
            result.setSuccess(false);
            result.setMessage("查询数据失败");
            e.printStackTrace();
        }
        return result;//序列话json字符串
    }

//    //同步请求
//    @RequestMapping("/index")
//    public String index(@RequestParam(value = "pageno",required=false,defaultValue = "1") Integer pageno,
//                        @RequestParam(value = "pagesize",required=false,defaultValue = "10")Integer pagesize, Map map){
//
//        Page page = userService.queryUserPage(pageno,pagesize);
//
//        map.put("page",page);
//
//        return "user/index";
//    }
    @RequestMapping("/mtry")
    public String mtry(Map map){
        User muser = new User();
        muser.setLoginacct("666");
        map.put("one",muser);
        return "login";
    }
}
