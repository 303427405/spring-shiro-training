package com.king.controller;

import com.king.code.Result;
import com.king.common.Constant;
import com.king.enums.RespCode;
import com.king.model.User;
import com.king.service.UserService;
import com.king.utils.SessionUtil;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 * @description：登录退出
 */
@Controller
public class LoginController {

    private static Logger LOGGER = LoggerFactory.getLogger(LoginController.class);

    @Autowired
    private UserService userService;

    /**
     * 首页
     *
     * @return
     */
    @RequestMapping(value = "/")
    public String index() {
        return "redirect:/login";
    }

    /**
     * 首页
     *
     *
     * @return
     */
    @RequestMapping(value = "/index")
    public ModelAndView index(HttpServletRequest request) {
        ModelMap model = new ModelMap();
        if(SessionUtil.getSessionUser(request) == null){
            return new ModelAndView("/login",model);
        }
        model.addAttribute("userName", SessionUtil.getSessionUser(request).getLoginname());
        return new ModelAndView("/index",model);
    }

    /**
     * GET 登录
     */
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView login() {
        return new ModelAndView("login",null);
    }

    /**
     * POST 登录 shiro 写法
     *
     * @param username 用户名
     * @param password 密码
     * @return
     */
    @RequestMapping(value = "/loginPost", method = RequestMethod.POST)
    public ModelAndView loginPost(String username, String password) {
        LOGGER.info("POST请求登录");
        ModelMap model = new ModelMap();
        if (StringUtils.isBlank(username)) {
            model.addAttribute(Constant.ResponseVO.CODE, RespCode.RESP_CODE_FAILER.getCode());
            model.addAttribute(Constant.ResponseVO.MSG,  "用户名不能为空");
            return new ModelAndView("jsonView", model);
        }
        if (StringUtils.isBlank(password)) {
            model.addAttribute(Constant.ResponseVO.CODE, RespCode.RESP_CODE_FAILER.getCode());
            model.addAttribute(Constant.ResponseVO.MSG,  "密码不能为空");
            return new ModelAndView("jsonView", model);
        }
        User user = userService.findUserByLoginNameAndPwd(username,DigestUtils.md5Hex(password));
        if (user == null){
            model.addAttribute(Constant.ResponseVO.CODE, RespCode.RESP_CODE_FAILER.getCode());
            model.addAttribute(Constant.ResponseVO.MSG,  "用户名或密码错误");
            return new ModelAndView("jsonView", model);
        }
        SessionUtil.setSessionUser(user);
        model.addAttribute(Constant.ResponseVO.CODE, RespCode.RESP_CODE_SUCCESS.getCode());
        model.addAttribute(Constant.ResponseVO.MSG,  "登陆成功");
        return new ModelAndView("jsonView", model);
    }

    /**
     * 退出
     *
     * @param request
     * @return
     */
    @RequestMapping(value = "/logout")
    @ResponseBody
    public Result logout(HttpServletRequest request) {
        LOGGER.info("登出");
        SessionUtil.clearSession();
        Result result = new Result();
        result.setSuccess(true);
        return result;
    }
}
