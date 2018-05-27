package com.king.controller;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.king.common.Constant;
import com.king.enums.RespCode;
import com.king.exception.ServiceException;
import com.king.model.CreateCubicRecruit;
import com.king.model.CreateCubicSpacePlan;
import com.king.service.SpacePlanService;

/**
 * @Author: zhanglei
 * @Description:空间计划
 */
@RequestMapping("/spacePlan")
@Controller
public class SpacePlanController {
	private static Logger LOGGER = LoggerFactory.getLogger(RecruitController.class);
	@Autowired
	private SpacePlanService spacePlanService;

	@RequestMapping(value = "/find", method = RequestMethod.GET)
	public ModelAndView find(CreateCubicSpacePlan SpacePlan, HttpServletRequest request, HttpServletResponse response) {
		List<CreateCubicSpacePlan> spacePlanList = spacePlanService.find(SpacePlan);
		for (int i = 0; i < spacePlanList.size(); i++) {
			String mostfit = spacePlanList.get(i).getMostfit();
			String[] s = mostfit.split(",");

			spacePlanList.get(i).setMostfits(Arrays.asList(s));
			System.out.println(spacePlanList.get(i));
		}
		ModelAndView mav = new ModelAndView("/xt/spacePlan");
		mav.addObject("list", spacePlanList);
		return mav;
	}

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list(CreateCubicSpacePlan SpacePlan) {
		ModelMap model = new ModelMap();
		model.addAttribute("list", spacePlanService.find(SpacePlan));
		return new ModelAndView("xt/spacePlanList", model);
	}

	@RequestMapping(value = "/toAdd", method = RequestMethod.GET)
	public ModelAndView toAdd(Integer id) {
		ModelMap model = new ModelMap();
		model.addAttribute("info", id > 0 ? spacePlanService.findById(id) : new CreateCubicSpacePlan());
		model.addAttribute("id", id);
		return new ModelAndView("xt/spacePlanAdd", model);
	}

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public ModelAndView delete(Integer id) {
		spacePlanService.deleteByPrimaryKey(id);
		ModelMap model = new ModelMap();
		model.addAttribute(Constant.ResponseVO.CODE, RespCode.RESP_CODE_SUCCESS.getCode());
		model.addAttribute(Constant.ResponseVO.MSG, "删除成功");
		return new ModelAndView("jsonView", model);
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public ModelAndView save(CreateCubicSpacePlan sp) {
		ModelMap model = new ModelMap();
		try {
			
			spacePlanService.save(sp);
			model.addAttribute(Constant.ResponseVO.CODE, RespCode.RESP_CODE_SUCCESS.getCode());
			model.addAttribute(Constant.ResponseVO.MSG, String.format("%s成功", sp.getId() == 0 ? "添加" : "修改"));
			return new ModelAndView("jsonView", model);
		} catch (ServiceException e) {
			model.addAttribute(Constant.ResponseVO.CODE, e.getErrorCode().getCode());
			model.addAttribute(Constant.ResponseVO.MSG, e.getErrorCode().getDesc());
			return new ModelAndView("jsonView", model);
		} catch (Exception e) {
			LOGGER.error("编辑失败：{}", e);
			throw new ServiceException(RespCode.RESP_CODE_FAILER, "编辑异常");
		}
	}

}
