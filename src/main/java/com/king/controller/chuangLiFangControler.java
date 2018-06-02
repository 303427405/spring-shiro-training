package com.king.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

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

import com.king.service.CreationofpartyService;
import com.king.service.chuangLiFangService;
import com.king.vo.chuangLiFangVo;

/**
 * @Author: tangwenjie
 * @Description:首页
 * 
 */
@Controller
@SuppressWarnings("all")
@RequestMapping("/chuangLiFang")
public class chuangLiFangControler extends BaseController {
	private static Logger LOGGER = LoggerFactory.getLogger(chuangLiFangControler.class);
	
	@Autowired
	private chuangLiFangService chuangLiFangService;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
    public ModelAndView list() {
        ModelMap model = new ModelMap();
      //  creationofpartyService.list();
        List<chuangLiFangVo> list = chuangLiFangService.list();
        model.addAttribute("list",list);
        return new ModelAndView("xt/CLFWelCome",model);
    }
	
	@RequestMapping(value = "/update")
	@ResponseBody
	public String getById(HttpServletRequest request, chuangLiFangVo chuangLiFangVo){
		int i = chuangLiFangService.updateChuangLiFang(chuangLiFangVo);
		String b ="false";
		if (i>0) {
			b="true";
		}
		return b;
	}
	
	@RequestMapping(value = "/CLFEdit", method = RequestMethod.GET )
	public ModelAndView CLFEdit(HttpServletRequest request){
		String id = request.getParameter("id");
		ModelMap model = new ModelMap();
		chuangLiFangVo c = chuangLiFangService.getById(id);
		model.addAttribute("c",c);
		return new ModelAndView("xt/CLFEdit",model);
	}
	
	
	@RequestMapping(value = "/Star", method = RequestMethod.GET)
    public ModelAndView Star() {
        ModelMap model = new ModelMap();
      //  creationofpartyService.list();
        List<chuangLiFangVo> list = chuangLiFangService.list();
        model.addAttribute("list",list);
        return new ModelAndView("xt/CLFSTAR",model);
    }
	 
	@RequestMapping(value = "/upload")
	public void upload(HttpServletRequest request){
		//得到上传文件的保存目录，将上传的文件存放于WEB-INF目录下，不允许外界直接访问，保证上传文件的安全
//		String savePath = reques.getServletContext().getRealPath("/WEB-INF/upload");
		
		
	}
	 
}
