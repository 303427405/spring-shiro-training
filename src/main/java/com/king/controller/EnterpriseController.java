package com.king.controller;

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
import com.king.model.CreateCubicEnterpriseService;
import com.king.model.Enterprise;
import com.king.model.EnterpriseDownload;
import com.king.service.EnterpriseService;

@Controller
@RequestMapping("enterprise")
public class EnterpriseController {
	private static Logger LOGGER = LoggerFactory.getLogger(RecruitController.class);
	@Autowired
	private EnterpriseService es;

	@RequestMapping(value = "/find", method = RequestMethod.GET)
	private ModelAndView list(CreateCubicEnterpriseService cces, HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("/xt/service");
		List<CreateCubicEnterpriseService> ylist = es.findbyname("优质设施");
		mav.addObject("yelist", ylist.get(0).getEnterprise());
		List<CreateCubicEnterpriseService> xlist = es.findbyname("相关服务");
		mav.addObject("xelist", xlist.get(0).getEnterprise());
		List<CreateCubicEnterpriseService> clist = es.findbyname("产品展厅");
		mav.addObject("celist", clist.get(0).getEnterprise());
		List<CreateCubicEnterpriseService> cjlist = es.findbyname("常见问题");
		mav.addObject("cjelist", cjlist.get(0).getEnterprise());
		List<EnterpriseDownload> dlist = es.findd(null);
		mav.addObject("ylist", ylist);
		mav.addObject("xlist", xlist);
		mav.addObject("clist", clist);
		mav.addObject("dlist", dlist);
		mav.addObject("cjlist", cjlist);
		return mav;
	}

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list(CreateCubicEnterpriseService cces) {
		ModelMap model = new ModelMap();
		model.addAttribute("list", es.findbyname(null));
		return new ModelAndView("xt/serviceList", model);
	}

	@RequestMapping(value = "/toAdd", method = RequestMethod.GET)
	public ModelAndView toAdd(Integer id) {
		ModelMap model = new ModelMap();
		model.addAttribute("info", id > 0 ? es.selectByPrimaryKey(id) : new CreateCubicEnterpriseService());
		model.addAttribute("id", id);
		return new ModelAndView("xt/serviceAdd", model);
	}

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public ModelAndView delete(Integer id) {
		es.deleteByPrimaryKey(id);
		ModelMap model = new ModelMap();
		model.addAttribute(Constant.ResponseVO.CODE, RespCode.RESP_CODE_SUCCESS.getCode());
		model.addAttribute(Constant.ResponseVO.MSG, "删除成功");
		return new ModelAndView("jsonView", model);
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public ModelAndView save(CreateCubicEnterpriseService cces) {
		ModelMap model = new ModelMap();
		try {
			cces.setCreatetime(new Date());
			cces.setUpdatetime(new Date());
			es.save(cces);
			model.addAttribute(Constant.ResponseVO.CODE, RespCode.RESP_CODE_SUCCESS.getCode());
			model.addAttribute(Constant.ResponseVO.MSG, String.format("%s成功", cces.getId() == 0 ? "添加" : "修改"));
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

	// 子表属性
	@RequestMapping(value = "/find1", method = RequestMethod.GET)
	public ModelAndView find1(Integer id) {
		ModelMap model = new ModelMap();
		model.addAttribute("list", es.finde(id));
		System.out.println("===============");
		model.addAttribute("eid", id);
		return new ModelAndView("xt/serviceList1", model);
	}

	@RequestMapping(value = "/toAdd1", method = RequestMethod.GET)
	public ModelAndView toAdd1(Integer id, Integer eid) {

		ModelMap model = new ModelMap();
		model.addAttribute("info", id > 0 ? es.getbyid(id) : new Enterprise());
		model.addAttribute("id", id);
		model.addAttribute("eid", eid);
		return new ModelAndView("xt/serviceAdd1", model);
	}

	@RequestMapping(value = "/delete1", method = RequestMethod.GET)
	public ModelAndView delete1(Integer id) {
		es.del(id);
		ModelMap model = new ModelMap();
		model.addAttribute(Constant.ResponseVO.CODE, RespCode.RESP_CODE_SUCCESS.getCode());
		model.addAttribute(Constant.ResponseVO.MSG, "删除成功");
		return new ModelAndView("jsonView", model);
	}

	@RequestMapping(value = "/save1", method = RequestMethod.POST)
	public ModelAndView save1(Enterprise es1) {
		ModelMap model = new ModelMap();
		try {

			es.save(es1);
			model.addAttribute(Constant.ResponseVO.CODE, RespCode.RESP_CODE_SUCCESS.getCode());
			model.addAttribute(Constant.ResponseVO.MSG, String.format("%s成功", es1.getId() == 0 ? "添加" : "修改"));
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

	//
	@RequestMapping(value = "/toAdd2", method = RequestMethod.GET)
	public ModelAndView toAdd2(Integer id) {

		ModelMap model = new ModelMap();
		model.addAttribute("info", id > 0 ? es.findd(id) : new EnterpriseDownload());
		model.addAttribute("id", id);
		return new ModelAndView("xt/serviceAdd2", model);
	}

	@RequestMapping(value = "/list1", method = RequestMethod.GET)
	public ModelAndView list1() {
		ModelMap model = new ModelMap();
		model.addAttribute("list", es.findd(null));
		return new ModelAndView("xt/serviceList2", model);
	}

	@RequestMapping(value = "/delete2", method = RequestMethod.GET)
	public ModelAndView delete2(Integer id) {
		es.del2(id);
		ModelMap model = new ModelMap();
		model.addAttribute(Constant.ResponseVO.CODE, RespCode.RESP_CODE_SUCCESS.getCode());
		model.addAttribute(Constant.ResponseVO.MSG, "删除成功");
		return new ModelAndView("jsonView", model);
	}

	@RequestMapping(value = "/save2", method = RequestMethod.POST)
	public ModelAndView save2(EnterpriseDownload es1) {
		ModelMap model = new ModelMap();
		try {
			System.out.println(es1.getUrl());
			es.save(es1);
			System.out.println("=================" + es1.getId());
			model.addAttribute(Constant.ResponseVO.CODE, RespCode.RESP_CODE_SUCCESS.getCode());
			model.addAttribute(Constant.ResponseVO.MSG, String.format("%s成功", es1.getId() == 0 ? "添加" : "修改"));
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
