package com.king.filter;

import com.king.model.User;
import com.king.utils.SessionUtil;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class UserLoginFilter implements Filter {

    //不需要拦截的地址 例如:返回给html的数据
    private String[] allUri = {"/contactUs/jsonData","/recruit/jsonData","/talentIdea/jsonData"};

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest)servletRequest;
        HttpServletResponse response = (HttpServletResponse)servletResponse;

        String uri = request.getRequestURI();
        String basePath = request.getContextPath();
        for(String path : allUri) {
            if(uri.matches(basePath+path)) {
                filterChain.doFilter(request, servletResponse);
                return ;
            }
        }
        User user  = SessionUtil.getSessionUser(request);
        if(user == null ) {
            PrintWriter out = response.getWriter();
            out.println("<html>");  
            out.println("<script>");  
            out.println(" window.open ('"  +request.getContextPath()+"/login"+" ','_top') ");
            out.println("</script>");  
            out.println("</html>");
        } else {
            filterChain.doFilter(request, servletResponse);
        }
    }

    @Override
    public void destroy() {

    }

}
