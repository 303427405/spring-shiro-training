package com.king.utils;

import com.king.model.User;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;

/**
 * @Author legie
 * @Date 2018年05月09日
 */
public class SessionUtil {

    private static final String Session_User = "sessionUser";

    /**
     * 取得当前登录用户
     * @return
     */
    public static User getSessionUser(HttpServletRequest request) {
        try {
            return (User) request.getSession().getAttribute(Session_User);
        } catch (Exception e) {
            throw new IllegalStateException("获取用户Session信息异常");
        }
    }

    public static void setSessionUser(User user) {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
                .getRequest();
        request.getSession().setAttribute(Session_User, user);
    }

    public static void clearSession() {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
                .getRequest();
        request.getSession().removeAttribute(Session_User);
    }

}
