package com.king.filter;

import com.king.model.User;
import com.king.utils.SessionUtil;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class UserLoginFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest)servletRequest;
        HttpServletResponse response = (HttpServletResponse)servletResponse;
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
