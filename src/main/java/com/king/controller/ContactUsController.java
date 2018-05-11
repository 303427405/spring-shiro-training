package com.king.controller;

import com.king.common.Constant;
import com.king.enums.RespCode;
import com.king.exception.ServiceException;
import com.king.model.CreateCubicContactUs;
import com.king.service.ContactUsService;
import com.king.vo.ContactUsVo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


/**
 * @Author: zhanglei
 * @Description:联系我们
 * @Date: 2018年4月11日10:04:14
 */
@Controller
@RequestMapping("/contactUs")
public class ContactUsController {

    private static Logger LOGGER = LoggerFactory.getLogger(ContactUsController.class);

    @Autowired
    private ContactUsService contactUsService;

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public ModelAndView save(ContactUsVo contactUsVo) {
        ModelMap model = new ModelMap();
        try {
            contactUsService.save(contactUsVo);
            model.addAttribute(Constant.ResponseVO.CODE, RespCode.RESP_CODE_SUCCESS.getCode());
            model.addAttribute(Constant.ResponseVO.MSG,  String.format("%s成功",contactUsVo.getId() == 0 ? "添加":"修改"));
            return new ModelAndView("jsonView", model);
        } catch (ServiceException e) {
            model.addAttribute(Constant.ResponseVO.CODE, e.getErrorCode().getCode());
            model.addAttribute(Constant.ResponseVO.MSG,  e.getErrorCode().getDesc());
            return new ModelAndView("jsonView", model);
        } catch (Exception e) {
            LOGGER.error("编辑失败：{}", e);
            throw  new ServiceException(RespCode.RESP_CODE_FAILER,"编辑异常");
        }
    }

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public ModelAndView list() {
        ModelMap model = new ModelMap();
        model.addAttribute("list",contactUsService.list());
        return new ModelAndView("xt/contactUs",model);
    }

    @RequestMapping(value = "/toAdd", method = RequestMethod.GET)
    public ModelAndView toAdd(Integer id) {
        ModelMap model = new ModelMap();
        model.addAttribute("info",id > 0 ? contactUsService.findById(id) : new CreateCubicContactUs());
        model.addAttribute("id",id);
        return new ModelAndView("xt/contactAdd",model);
    }

    @RequestMapping(value = "/jsonData", method = RequestMethod.GET)
    public ModelAndView jsonData() {
        ModelMap model = new ModelMap();
        model.addAttribute("list",contactUsService.list());
        return new ModelAndView("jsonView", model);
    }
}
