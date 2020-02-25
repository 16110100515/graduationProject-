package cn.sm1234.interceptor;

import cn.sm1234.domain.User;
import cn.sm1234.util.Const;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashSet;
import java.util.Set;

public class LoginInterceptor extends HandlerInterceptorAdapter{

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //1。定义不需要拦截的   （白名单）
        Set<String> uri = new HashSet<String >();
        uri.add("/user/reg.action");
        uri.add("/dispatcher/logout.action");
        uri.add("/dispatcher/login.action");
        uri.add("/dispatcher/doLogin.action");
        uri.add("/dispatcher/toother.action");
        uri.add("/dispatcher/doReg.action");
        uri.add("/dispatcher/reg.action");
        uri.add("/dispatcher/toqq.action");
        uri.add("/dispatcher/doqq.action");

//        uri.add("/dispatcher/main.action");

        String servletPath = request.getServletPath();
        System.out.println("##servletPath="+servletPath);
        if(uri.contains(servletPath)){
            return true;
        }
        //2.判断用户是否登录 登录，放行
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute(Const.LOGIN_USER);
        if(user!=null){
            return true;
        }else{
            response.sendRedirect(request.getContextPath()+"/dispatcher/login.action");
            return false;
        }
//        return false;
    }
}
