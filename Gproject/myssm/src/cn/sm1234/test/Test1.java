package cn.sm1234.test;

import cn.sm1234.domain.User;
import cn.sm1234.service.UserService;
import cn.sm1234.util.MD5Util;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Test1 {
    public static void main(String[] args) throws Exception {
        ApplicationContext ioc = new ClassPathXmlApplicationContext("application*.xml");

        UserService userService = ioc.getBean(UserService.class);


        for (int i = 1; i <= 100; i++) {
            User user = new User();
            user.setLoginacct("test"+i);
            user.setUserpswd(MD5Util.digest("123"));
            user.setUsername("test"+i);
            user.setEmail("test"+i+"@atguigu.com");
            user.setCreatetime("2222-09-23 14:17:00");
            userService.saveUser(user);
        }

    }
}
