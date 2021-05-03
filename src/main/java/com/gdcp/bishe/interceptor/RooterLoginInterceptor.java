package com.gdcp.bishe.interceptor;

import com.gdcp.bishe.bean.Rooter;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class RooterLoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws ServletException, IOException {
        // 获取请求的URL
        String url = request.getRequestURI();
        // URL：除了请求登录外，其他的URL都进行拦截控制
        if(url.indexOf("/Rlogin") >= 0){
            return true;
        }
        // 用户Session
        HttpSession session = request.getSession();
        Rooter rooter = (Rooter) session.getAttribute("ROOTER_SESSION");
        // 判断 Session中是否有用户数据，有true。

        if(rooter != null){
            return true;
        }

        // 调回登录页面
        request.setAttribute("msg","您还没有登录");
        request.getRequestDispatcher("/pages/login.jsp")
                .forward(request,response);
        return false;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) {

    }
}
