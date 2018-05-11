package com.king.controller;

import com.king.common.Constant;
import com.king.enums.RespCode;
import com.king.exception.ServiceException;
import com.king.model.CreateCubicRecruit;
import com.king.service.RecruitService;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 * @Author: zhanglei
 * @Description:招聘模块
 * @Date: 14:20 2018/4/9
 */
@Controller
@RequestMapping("/recruit")
public class RecruitController extends BaseController {

    private static Logger LOGGER = LoggerFactory.getLogger(RecruitController.class);

    @Autowired
    private RecruitService recruitService;

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public ModelAndView save(CreateCubicRecruit createCubicRecruit) {
        ModelMap model = new ModelMap();
        try {
            recruitService.save(createCubicRecruit);
            model.addAttribute(Constant.ResponseVO.CODE, RespCode.RESP_CODE_SUCCESS.getCode());
            model.addAttribute(Constant.ResponseVO.MSG,  String.format("%s成功",createCubicRecruit.getRecruitid() == 0 ? "添加":"修改"));
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

    @RequestMapping(value = "/toAdd", method = RequestMethod.GET)
    public ModelAndView toAdd(Integer id) {
        ModelMap model = new ModelMap();
        model.addAttribute("info",id > 0 ? recruitService.findById(id) : new CreateCubicRecruit());
        model.addAttribute("recruitId",id);
        return new ModelAndView("xt/recruitAdd",model);
    }

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public ModelAndView list() {
        ModelMap model = new ModelMap();
        model.addAttribute("list",recruitService.list());
        return new ModelAndView("xt/recruitList",model);
    }

    @RequestMapping(value = "/jsonData", method = RequestMethod.GET)
    public ModelAndView jsonData() {
        ModelMap model = new ModelMap();
        model.addAttribute("list",recruitService.list());
        return new ModelAndView("jsonView",model);
    }


    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public ModelAndView delete(Integer id) {
        recruitService.delete(id);
        ModelMap model = new ModelMap();
        model.addAttribute(Constant.ResponseVO.CODE, RespCode.RESP_CODE_SUCCESS.getCode());
        model.addAttribute(Constant.ResponseVO.MSG,  "删除成功");
        return new ModelAndView("jsonView", model);
    }
}
