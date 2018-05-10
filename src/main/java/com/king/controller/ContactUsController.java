package com.king.controller;

import com.king.code.Result;
import com.king.common.Constant;
import com.king.enums.RespCode;
import com.king.model.CreateCubicContactUs;
import com.king.model.CreateCubicTalentIdea;
import com.king.service.ContactUsService;
import com.king.service.TalentIdeaService;
import com.king.vo.ContactUsVo;
import com.king.vo.TalentIdeaVo;
import org.apache.commons.codec.digest.DigestUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;


/**
 * @Author: zhanglei
 * @Description:联系我们
 * @Date: 2018年4月11日10:04:14
 */
@Controller
@RequestMapping("/contactUs")
public class ContactUsController extends BaseController {

    private static Logger LOGGER = LoggerFactory.getLogger(ContactUsController.class);

    @Autowired
    private ContactUsService contactUsService;

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public ModelAndView save(@RequestBody ContactUsVo contactUsVo) {
        ModelMap model = new ModelMap();
        try {
            contactUsService.save(contactUsVo);
            model.addAttribute(Constant.ResponseVO.CODE, RespCode.RESP_CODE_SUCCESS.getCode());
            model.addAttribute(Constant.ResponseVO.MSG,  String.format("%s成功",contactUsVo.getId() == 0 ? "添加":"修改"));
            return new ModelAndView("jsonView", model);
        } catch (RuntimeException e) {
            model.addAttribute(Constant.ResponseVO.CODE, RespCode.RESP_CODE_FAILER.getCode());
            model.addAttribute(Constant.ResponseVO.MSG,  e.getMessage());
            return new ModelAndView("jsonView", model);
        }
    }

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public ModelAndView list(Integer type) {
        ModelMap model = new ModelMap();
        model.addAttribute("list",contactUsService.list(type));
        return new ModelAndView("xt/contactUs",model);
    }

    @RequestMapping(value = "/toAdd", method = RequestMethod.GET)
    public ModelAndView toAdd(Integer id) {
        ModelMap model = new ModelMap();
        model.addAttribute("info",id > 0 ? contactUsService.findById(id) : new CreateCubicContactUs());
        return new ModelAndView("xt/contactAdd",model);
    }
}
