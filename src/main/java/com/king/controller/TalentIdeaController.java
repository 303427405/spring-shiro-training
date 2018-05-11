package com.king.controller;

import com.king.common.Constant;
import com.king.enums.RespCode;
import com.king.exception.ServiceException;
import com.king.model.CreateCubicTalentIdea;
import com.king.service.TalentIdeaService;
import com.king.vo.TalentIdeaVo;
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
 * @Description:人才理念模块
 * @Date: 13:42 2018/4/9
 */
@Controller
@RequestMapping("/talentIdea")
public class TalentIdeaController{

    private static Logger LOGGER = LoggerFactory.getLogger(TalentIdeaController.class);

    @Autowired
    private TalentIdeaService talentIdeaService;

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public ModelAndView save(TalentIdeaVo talentIdeaVo) {
        ModelMap model = new ModelMap();
        try {
            talentIdeaService.save(talentIdeaVo);
            model.addAttribute(Constant.ResponseVO.CODE, RespCode.RESP_CODE_SUCCESS.getCode());
            model.addAttribute(Constant.ResponseVO.MSG,  String.format("%s成功",talentIdeaVo.getId() == 0 ? "添加":"修改"));
            return new ModelAndView("jsonView", model);
        } catch (ServiceException e) {
            LOGGER.error("编辑失败：{}", e);
            model.addAttribute(Constant.ResponseVO.CODE, e.getErrorCode().getCode());
            model.addAttribute(Constant.ResponseVO.MSG,  e.getErrorCode().getDesc());
            return new ModelAndView("jsonView", model);
        }catch (Exception e) {
            LOGGER.error("编辑失败：{}", e);
            throw  new ServiceException(RespCode.RESP_CODE_FAILER,"添加员工异常");
        }
    }

    @RequestMapping(value = "/toAdd", method = RequestMethod.GET)
    public ModelAndView toAdd(Integer id) {
        ModelMap model = new ModelMap();
        model.addAttribute("info",id > 0 ? talentIdeaService.findById(id) : new CreateCubicTalentIdea());
        model.addAttribute("id",id);
        return new ModelAndView("xt/talentIdeaAdd",model);
    }

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public ModelAndView list() {
        ModelMap model = new ModelMap();
        model.addAttribute("list",talentIdeaService.list());
        return new ModelAndView("xt/talentIdeaList",model);
    }

    @RequestMapping(value = "/jsonData", method = RequestMethod.GET)
    public ModelAndView jsonData() {
        ModelMap model = new ModelMap();
        model.addAttribute("list",talentIdeaService.list());
        return new ModelAndView("jsonView",model);
    }

}
