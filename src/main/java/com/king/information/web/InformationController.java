package com.king.information.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import com.king.controller.BaseController;
import com.king.information.service.InformationService;
import com.king.model.CreateCubicTalentIdea;
@Controller
@RequestMapping("/information")
public class InformationController extends BaseController {
	  private static Logger LOGGER = LoggerFactory.getLogger(InformationController.class);
		
	  @Autowired InformationService informationService;
		
		@RequestMapping("/list")
		@ResponseBody
		private ModelAndView getinformation(Model model, HttpServletRequest request,HttpServletResponse response){
			ModelAndView mav = new ModelAndView();
			mav.setViewName("xt/news");
			
			List<Map<String, Object>> gsdtMap = this.informationService.getGsdt();//公司动态
			List<Map<String, Object>>  pphdMap = this.informationService.getPphd();//品牌活动
			List<Map<String, Object>> hydtMap = this.informationService.getHydt();//行业动态
			List<Map<String, Object>>  xpkxtMap = this.informationService.getXpkx();//新品快讯
	
			mav.addObject("gsdtMap", gsdtMap);
			mav.addObject("pphdMap", pphdMap);
			mav.addObject("hydtMap", hydtMap);
			mav.addObject("xpkxtMap", xpkxtMap);
			return mav;
		}
		
		//后台页面
		@RequestMapping("/informationList")
		@ResponseBody
		private ModelAndView list(Model model, HttpServletRequest request,HttpServletResponse response){
			
			ModelAndView mav = new ModelAndView();
			mav.setViewName("xt/informationList");
			
			List<Map<String, Object>> findAll = this.informationService.findAll();//公司动态
	
			mav.addObject("findAll", findAll);
			return mav;
		
		
		
		}
		
		//跳转添加页面
		  @RequestMapping(value = "/toAdd", method = RequestMethod.GET)
		    public ModelAndView toAdd(Integer id) {
			  ModelAndView mv = new ModelAndView("information/informationAdd");
			  mv.addObject("id", id);
		        return mv;
		    }
		
		//添加和修改
		  @RequestMapping(value = "/save", method = RequestMethod.POST )
		  @ResponseBody
		    public String save(HttpServletRequest request,HttpServletResponse respne) {
			  String title = request.getParameter("title");
			  String content = request.getParameter("content");
			  String imgurl = request.getParameter("imgurl");
			  String href = request.getParameter("href");
			  String id = request.getParameter("id");
			  if(null != id) {
				  Map<String, Object> map = new HashMap<String, Object>();
				  map.put("id", id);
				  map.put("title", title);
				  map.put("content", content);
				  map.put("imageUrl", imgurl);
				  map.put("href", href);
				  this.informationService.edit(map);
				  
			  }else {
			  Map<String, Object> map = new HashMap<String, Object>();
			  map.put("title", title);
			  map.put("content", content);
			  map.put("imageUrl", imgurl);
			  map.put("href", href);
			  this.informationService.save(map);
			 
			  }
			  
			  
			  
		        return "0";
		    }
		  
		
		
		
		
		
}
