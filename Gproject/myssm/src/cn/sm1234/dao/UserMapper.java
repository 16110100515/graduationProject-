package cn.sm1234.dao;



import cn.sm1234.domain.Permission;
import cn.sm1234.domain.Role;
import cn.sm1234.domain.User;
import cn.sm1234.domain.UserSelect;
import cn.sm1234.util.Data;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface UserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert1(User record);
    int insert1(@Param("list")List<User> list);

    User selectByPrimaryKey(Integer id);

    List<User> selectAll();

    int updateByPrimaryKey(User record);

	User queryUserlogin(Map<String, Object> paramMap);


    Integer queryCount(Map<String,Object> paramMap);

    List<User> queryList(Map<String,Object> paramMap);

    UserSelect queryUserSelect(Map paramMap);

    List<UserSelect> queryUserSelect();

    String queryUserSelected(String str);

    void saveUserSelected(Map map);

    void insertUserSelected(Map map);

    List<Integer> queryRoleByUserid(Integer id);

    List<Role> querAllRole();

    void saveUserRoleRelationship(@Param("userid")Integer userid, @Param("data") Data data);

    void deleteUserRoleRelationship(@Param("userid")Integer userid, @Param("data") Data data);

    List<Permission> queryPermissionByUserid(Integer id);
}