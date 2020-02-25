package cn.sm1234.controller;

import cn.sm1234.domain.Log;
import cn.sm1234.domain.Permission;
import cn.sm1234.domain.User;
import cn.sm1234.service.LogService;
import cn.sm1234.service.UserService;
import cn.sm1234.util.AjaxResult;
import cn.sm1234.util.Const;
import cn.sm1234.util.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("dispatcher")
public class DispatcherController {
    static String uname = null;
    private Map<String,Integer> nameMap = new HashMap<>();
    private Map<String,Integer> onlineMap = new HashMap<>();
    int i = 0;
    static List messege = new ArrayList<>();
    static List messege2 = new ArrayList<>();
    private Map halfHour = new HashMap();
    private int maxTalk = 0;
    private List onlineList = new ArrayList();
//    static {
//        messege.add("欢迎光临");
//        messege.add("随便说两句吧"+uname);
//    }


    @Autowired
    private UserService userService;
    @Autowired
    private LogService logService;
    @RequestMapping("toother")
    public String toother(Map<String,String> map){

        return "index";
    }
//    @RequestMapping("toqq")
//    public String toqq(Map<String,Object> map,String myText,String myName,HttpSession session){
//        User user = (User)session.getAttribute(Const.LOGIN_USER);
////        if(myText.equals(user.getUsername())){
//        if(messege.get(messege.size()-1).contains(uname)){
//            Date date = new Date();
//            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd :hh:mm:ss");
//            String str = dateFormat.format(date) + uname + ":" + myText;
//            messege.add(str);
//            map.put("qqtext", messege);
//            return "qq";
//        }else {
//            return "redirect:/dispatcher/login.action";
//        }
//    }


    //异步请求

//    @RequestMapping("doqq")
//    public void doqq() {
//        System.out.println("ffffffffffffffffff");
//    }
    @ResponseBody
    @RequestMapping("doqq")
    public Object doqq(){
        System.out.println("ffffffffffffffffff");
        AjaxResult result = new AjaxResult();
        try {
            result.setUserList(messege);
            List lsList = new ArrayList();
            //=======================================
            Date date = new Date();
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            for (Object object:messege){
//            int i = 0;
                String string = (String)object;
                String ago = string.substring(0,20);
                String nowStr = dateFormat.format(date);

                Calendar c=Calendar.getInstance();
                c.add(Calendar.MINUTE, -30);//1分钟前
                String halfHourtime = dateFormat.format(c.getTime());


                // 生效时间
                Date effectivetime = strToDate(halfHourtime);
                // 失效时间
                Date invalidtime = strToDate(nowStr);
                Date agoTime = strToDate(ago);
                boolean flag = belongCalendar(agoTime, effectivetime, invalidtime);
//             boolean flag = (agoTime.after(effectivetime)&&agoTime.before(invalidtime));

                if (string.contains(uname)&&flag){
                    i++;
//                onlineList.add(uname);

                }
            }nameMap.put(uname,i);
//        onlineList.add(uname);
            //---------
//    for (Object object:messege){
////            int i = 0;
//        String string = (String)object;
//        String ago = string.substring(0,19);
//        String nowStr = dateFormat.format(date);
//
//        Calendar c=Calendar.getInstance();
//        c.add(Calendar.SECOND, -300);//30秒前
//        String halfHour = dateFormat.format(c.getTime());
//
//
//        // 生效时间
//        Date effectivetime = strToDate(halfHour);
//        // 失效时间
//        Date invalidtime = strToDate(nowStr);
//        Date agoTime = strToDate(ago);
//        boolean flag = belongCalendar(agoTime, effectivetime, invalidtime);
//        if (string.contains(uname)&&flag){
////            if (!onlineList.contains(uname)){
//                onlineList.add(uname);
////            }
//        }
//    }
            //--------
            if (i>maxTalk){
                maxTalk=i;
            }
            i=0;

            halfHour = sortMap(nameMap);
            //=======================================
            for (Object obj:halfHour.keySet()){
                String lsStr = obj.toString()+" 发言次数: "+halfHour.get(obj);
                lsList.add(lsStr);
            }
            result.setHourList(lsList);
            //------------------
//            Date date = new Date();
//            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            for (Object object:messege){
                onlineList.clear();
                String string = (String)object;
                String ago = string.substring(0,19);
                String nowStr = dateFormat.format(date);

                Calendar c=Calendar.getInstance();
                c.add(Calendar.SECOND, -30);//100秒前
                String halfHour = dateFormat.format(c.getTime());

                // 生效时间
                Date effectivetime = strToDate(halfHour);
                // 失效时间
                Date invalidtime = strToDate(nowStr);
                Date agoTime = strToDate(ago);
                boolean flag = belongCalendar(agoTime, effectivetime, invalidtime);
                if (flag){
//                    if (!onlineList.contains(uname)){
//                            onlineList.add(uname);
//                    }
                }else{

                    messege2.remove(string);

//                    for (int i = 0;i<onlineList.size();i++){
//                        if (string.contains(onlineList.get(i).toString())){
//                            onlineList.remove(i);
//                        }
//                    }
                }
            }
            for (int jj = 0;jj<messege2.size();jj++){
                String string = (String)messege2.get(jj);


                if (!onlineList.contains(string.substring(19,22))){
                    onlineList.add(string.substring(19,22));
                }



            }
            //----------------
            result.setOnlineList(onlineList);
//            session.setAttribute(Const.LOGIN_USER,user);
            result.setSuccess(true);
//            logService.insert(user.getUsername(),"刷新");


        } catch (Exception e) {
            e.printStackTrace();
            result.setMessage("刷新失败!");
            result.setSuccess(false);
        }

        return result;
    }

    private String myText1 = null;
@RequestMapping("toqq")
public String toqq(Map<String,Object> map,String myText,String myName,HttpSession session){
//    if(messege.get(messege.size()-1).contains(uname)){
//        uname = myName;
        Date date = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    String str = null;
        if (myName==null){
            if (myText==null){
                str = dateFormat.format(date) + uname + " : <br/>&nbsp" + myText1;

            }else {
                str = dateFormat.format(date) + uname + " : <br/>&nbsp" + myText;

            }

        }
        else {
            uname = myName;
            if (myText==null){
                str = dateFormat.format(date) + myName + " : <br/>&nbsp" + myText1;

            }
            else {
                str = dateFormat.format(date) + myName + " : <br/>&nbsp" + myText;

            }
        }
        if(!str.contains("null")){
            messege.add(str);
            messege2.add(str);
        }
        map.put("qqtext", messege);
        map.put("mapName",uname);
        for (Object object:messege){
//            int i = 0;
            String string = (String)object;
            String ago = string.substring(0,20);
            String nowStr = dateFormat.format(date);

            Calendar c=Calendar.getInstance();
//            c.add(Calendar.MINUTE, -1);//1分钟前
            c.add(Calendar.SECOND, -30);//300秒前

            String halfHourtime = dateFormat.format(c.getTime());


            // 生效时间
             Date effectivetime = strToDate(halfHourtime);
            // 失效时间
             Date invalidtime = strToDate(nowStr);
             Date agoTime = strToDate(ago);
             boolean flag = belongCalendar(agoTime, effectivetime, invalidtime);
//             boolean flag = (agoTime.after(effectivetime)&&agoTime.before(invalidtime));

            if (string.contains(uname)&&flag){
                i++;
//                onlineList.add(uname);

            }
        }nameMap.put(uname,i);
//        onlineList.add(uname);
    //---------
//    for (Object object:messege){
////            int i = 0;
//        String string = (String)object;
//        String ago = string.substring(0,19);
//        String nowStr = dateFormat.format(date);
//
//        Calendar c=Calendar.getInstance();
//        c.add(Calendar.SECOND, -300);//30秒前
//        String halfHour = dateFormat.format(c.getTime());
//
//
//        // 生效时间
//        Date effectivetime = strToDate(halfHour);
//        // 失效时间
//        Date invalidtime = strToDate(nowStr);
//        Date agoTime = strToDate(ago);
//        boolean flag = belongCalendar(agoTime, effectivetime, invalidtime);
//        if (string.contains(uname)&&flag){
////            if (!onlineList.contains(uname)){
//                onlineList.add(uname);
////            }
//        }
//    }
    //--------
        if (i>maxTalk){
            maxTalk=i;
        }
        i=0;

        halfHour = sortMap(nameMap);
        map.put("halfHour",halfHour);



        return "qq";

}
    public static boolean belongCalendar(Date nowTime, Date beginTime, Date endTime) {
        Calendar date = Calendar.getInstance();
        date.setTime(nowTime);
        Calendar begin = Calendar.getInstance();
        begin.setTime(beginTime);
        Calendar end = Calendar.getInstance();
        end.setTime(endTime);
        if (date.after(begin) && date.before(end)) {
            return true;
        }
            else if (nowTime.compareTo(beginTime) == 0 || nowTime.compareTo(endTime) == 0) {
            return true;
        } else {
            return false;
        }
    }


    public static Date strToDate(String str) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = null;
        try {
            date = sdf.parse(str);
        } catch (ParseException e)
        {

        }
        return date;
    }

    public static LinkedHashMap<String, Integer> sortMap(Map<String, Integer> map){
        class MapClass{															//自定义类保存键值对
            private String key;
            private int value;

            public MapClass(String key, int value) {
                super();
                this.key = key;
                this.value = value;
            }

            public String getKey() {
                return key;
            }

            public int getValue() {
                return value;
            }


        }
        class MapSortMethod implements Comparator<MapClass>{					//为自定义类实现排序方法
            @Override
            public int compare(MapClass o1, MapClass o2) {
//                int result = Integer.compare(o1.getValue(), o2.getValue());		//按值大小升序排列
                int result = Integer.compare(o2.getValue(), o1.getValue());	//按值大小降序排列
                if(result != 0)
                    return result;
                return o1.getKey().compareTo(o2.getKey());						//值相同时按键字典顺序排列
            }
        }

        ArrayList<MapClass> mapclass = new ArrayList<MapClass>();				//以ArrayList保存自定义类
        for(String k: map.keySet())
            mapclass.add(new MapClass(k, map.get(k)));
        Collections.sort(mapclass, new MapSortMethod());						//使用Collections.sort()方法，第二个参数为自定义排序方法，需要实现Comparator接口

        LinkedHashMap<String, Integer> sortedMap = new LinkedHashMap<String, Integer>();
        for(MapClass m: mapclass)
            sortedMap.put(m.getKey(), m.getValue());
        return sortedMap;														//用LinkedHashMap返回排好序的Map
    }

//@RequestMapping("toqq")
//public String toqq(Map<String,Object> map,String myText,HttpSession session){
//    User user = (User)session.getAttribute(Const.LOGIN_USER);
//        Date date = new Date();
//        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd :hh:mm:ss");
//        String str = dateFormat.format(date) + user.getUsername() + ":" + myText;
//        messege.add(str);
//        map.put("qqtext", messege);
//        return "qq";
//
//}
    @RequestMapping("login")
    public String login(){
        return "login";
    }

    //异步请求
    @ResponseBody
    @RequestMapping("doLogin")
    public Object doLogin(String loginacct,String userpswd,String type,HttpSession session){

        AjaxResult result = new AjaxResult();
        try {
            Map<String,Object> paramMap = new HashMap<String, Object>();
            paramMap.put("loginacct",loginacct);
            paramMap.put("userpswd", MD5Util.digest(userpswd));
            paramMap.put("type",type);
            User user = userService.queryUserlogin(paramMap);
            session.setAttribute(Const.LOGIN_USER,user);
            result.setSuccess(true);
            logService.insert(user.getUsername(),"登录");

        } catch (Exception e) {
            e.printStackTrace();
            result.setMessage("登录失败!");
            result.setSuccess(false);
        }

        return result;
    }


    //同步请求
//    @RequestMapping("doLogin")
//    public String doLogin(String loginacct,String userpswd,String type,HttpSession session){
//        Map<String,Object> paramMap = new HashMap<String, Object>();
//        paramMap.put("loginacct",loginacct);
//        paramMap.put("userpswd",userpswd);
//        paramMap.put("type",type);
//        User user = userService.queryUserlogin(paramMap);
//        session.setAttribute(Const.LOGIN_USER,user);
//
//        return "";
//    }
    @RequestMapping("logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "redirect:/dispatcher/toother.action";
    }
    @RequestMapping("qq")
    public String qq(HttpSession session,String myText,String un){
        myText1 = myText;
        uname = un;
//        session.invalidate();
        return "redirect:/dispatcher/toqq.action";
    }

    @RequestMapping("main")
    public String main(HttpSession session,Map mapLog){

        Permission permissionRoot = null;
        User user = (User)session.getAttribute(Const.LOGIN_USER);
        List<Permission> myPermissions = userService.queryPermissionByUserid(user.getId());//当前用户拥有的许可权限
        Map<Integer,Object> map = new HashMap<Integer, Object>();

        Set<String> myUris = new HashSet<String>();//用于拦截器存放当前许可

        for(Permission innerpermission:myPermissions){
            map.put(innerpermission.getId(), innerpermission);
            myUris.add("/"+innerpermission.getUrl());
        }
        for(Permission permission:myPermissions){
            if(permission.getPid()==0){
                permissionRoot = permission;
            }else{
                Permission parent = (Permission) map.get(permission.getPid());
                parent.getChildren().add(permission);
            }
        }
        session.setAttribute(Const.MY_URIS,myUris);
        session.setAttribute("permissionRoot",permissionRoot);

        List<Log> allLog = logService.queryAll();

        mapLog.put("allLog",allLog);
        return "main";
    }
    @RequestMapping("reg")
    public String reg(){
        return "reg";
    }
    @ResponseBody
    @RequestMapping("doReg")
    public Object doReg(String loginacct,String userpswd,String email,String type ){
        AjaxResult result1 = new AjaxResult();

        try {
            User user = new User();
            user.setLoginacct(loginacct);
            user.setUserpswd(MD5Util.digest(userpswd));
            user.setEmail(email);
            user.setType(type);

            Date date=new Date();
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String result=formatter.format(date);

            user.setCreatetime(result);

            System.out.println(user);
            userService.insert(user);
            result1.setSuccess(true);
        } catch (Exception e) {
            e.printStackTrace();
            result1.setMessage("登录失败!");
            result1.setSuccess(false);
        }
        return result1;
    }




//    @RequestMapping("insert")
//    public String insert(){
//        userService.insert();
//        return "succ";
//    }
}
