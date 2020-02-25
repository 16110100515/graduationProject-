package cn.sm1234.interceptor;

import cn.sm1234.domain.Permission;
import cn.sm1234.service.PermissionService;
import cn.sm1234.util.Const;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class AuthInterceptor extends HandlerInterceptorAdapter {

    @Autowired
    private PermissionService permissionService;
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        List<Permission> queryAllPermission = permissionService.queryAllPermission();
        Set<String> allURIs = new HashSet<String>();
        for(Permission permission:queryAllPermission){
            allURIs.add("/"+permission.getUrl());
        }

        String servletPath = request.getServletPath();
        if(allURIs.contains(servletPath)){

            Set<String > myURIs = (HashSet<String >)request.getSession().getAttribute(Const.MY_URIS);
            if(myURIs.contains(servletPath)){
                return true;
            }else{
                response.sendRedirect(request.getContextPath()+"/dispatcher/login.action");
                return false;
            }
        }else{
            return  true;
        }


    }
}
