package cn.sm1234.impl;

import cn.sm1234.dao.UserMapper;
import cn.sm1234.domain.Permission;
import cn.sm1234.domain.Role;
import cn.sm1234.domain.User;
import cn.sm1234.domain.UserSelect;
import cn.sm1234.exception.LoginFailException;
import cn.sm1234.service.UserService;

import cn.sm1234.util.Const;
import cn.sm1234.util.Data;
import cn.sm1234.util.MD5Util;
import cn.sm1234.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
public class UserServiceImpl implements UserService{
    @Autowired
    private UserMapper userMapper;

    public  void  insert(){
        User user = new User();
        user.setCreatetime("");
        user.setEmail("");
        user.setLoginacct("");
        user.setUsername("lsj");
        user.setUserpswd("");
        userMapper.insert1(user);
    }

    @Override
    public void insert(User user) {
        userMapper.insert1(user);
    }

    @Override
    public User queryUserlogin(Map<String, Object> paramMap) {

        User user = userMapper.queryUserlogin(paramMap);
        if(user==null){
            throw new LoginFailException("用户名或密码不正确");
        }
        return user;
    }

    @Override
    public Page queryUserPage(Map<String,Object> paramMap) {
        Page page = new Page((Integer)paramMap.get("pageno"),(Integer)paramMap.get("pagesize"));
        Integer startIndex = page.getStartIndex();
        paramMap.put("startIndex",startIndex);
        List<User> datas = userMapper.queryList(paramMap);

        page.setDatas(datas);
        Integer totalsize = userMapper.queryCount(paramMap);
        page.setTotalsize(totalsize);

        return page;
    }

    @Override
    public void saveUser(User user) {
        userMapper.insert1(user);
    }

    @Override
    public List<UserSelect> queryUserSelect() {
//        Page page = new Page((Integer)paramMap.get("pageno"),(Integer)paramMap.get("pagesize"));
//        Integer startIndex = page.getStartIndex();
//        paramMap.put("startIndex",startIndex);
        List<UserSelect> userSelects =  userMapper.queryUserSelect();
//        page.setDatas(userSelects);
        return userSelects;
    }

    @Override
    public String queryUserSelected(String str) {
        return userMapper.queryUserSelected(str);
    }

    @Override
    public void saveUserSelected(Map map) {
        userMapper.saveUserSelected(map);
    }

    @Override
    public void insertUserSelected(Map map) {
        userMapper.insertUserSelected(map);
    }

    @Override
    public int saveUserAdd(User user) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date createDate = new Date();
        String createTime = simpleDateFormat.format(createDate);
        user.setCreatetime(createTime);
        user.setUserpswd(MD5Util.digest(Const.PASSWORD));
        return userMapper.insert1(user);
    }

    @Override
    public int saveUserAdd(Data data) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date createDate = new Date();
        String createTime = simpleDateFormat.format(createDate);
        for(User user:data.getDatas()){
            user.setUserpswd(MD5Util.digest(Const.PASSWORD));
            user.setCreatetime(createTime);
        }
        return userMapper.insert1(data.getDatas());
    }

    @Override
    public User getUserById(Integer id) {
        return userMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateUser(User user) {
        return userMapper.updateByPrimaryKey(user);
    }

    @Override
    public int deleteUser(Integer id) {
        return userMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int deleteBatchUser(Integer[] ids) {
        int totalCount = 0 ;
        for (Integer id : ids) {
            int count = userMapper.deleteByPrimaryKey(id);
            totalCount += count;
        }
        if(totalCount!=ids.length){
            throw new RuntimeException("批量删除失败");
        }
        return totalCount;
    }

    @Override
    public List<Role> querAllRole() {
        return userMapper.querAllRole();
    }

    @Override
    public List<Integer> queryRoleByUserid(Integer id) {
        return userMapper.queryRoleByUserid(id);
    }

    @Override
    public void saveUserRoleRelationship(Integer userid, Data data) {
        userMapper.saveUserRoleRelationship(userid,data);
    }

    @Override
    public void deleteUserRoleRelationship(Integer userid, Data data) {
        userMapper.deleteUserRoleRelationship(userid,data);
    }

    @Override
    public List<Permission> queryPermissionByUserid(Integer id) {
        return userMapper.queryPermissionByUserid(id);
    }


}
