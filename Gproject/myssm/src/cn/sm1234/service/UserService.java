package cn.sm1234.service;

import cn.sm1234.domain.Permission;
import cn.sm1234.domain.Role;
import cn.sm1234.domain.User;
import cn.sm1234.domain.UserSelect;
import cn.sm1234.util.Data;
import cn.sm1234.util.Page;

import java.util.List;
import java.util.Map;

public interface UserService {

    void insert(User user);

    User queryUserlogin(Map<String, Object> paramMap);

    Page queryUserPage(Map<String,Object> paramMap);

    void saveUser(User user);

    List<UserSelect> queryUserSelect();

    String queryUserSelected(String str);

//    void saveUserSelected(StringBuffer str2);

    void saveUserSelected(Map map);

    void insertUserSelected(Map map);

    int saveUserAdd(User user);
    int saveUserAdd(Data data);

    User getUserById(Integer id);

    int updateUser(User user);

    int deleteUser(Integer id);

    int deleteBatchUser(Integer[] id);

    List<Role> querAllRole();

    List<Integer> queryRoleByUserid(Integer id);

    void saveUserRoleRelationship(Integer userid, Data data);

    void deleteUserRoleRelationship(Integer userid, Data data);

    List<Permission> queryPermissionByUserid(Integer id);
}
