package com.king.controller;

import com.king.service.SlaveService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @description：测试Controller
 */
@Controller
@RequestMapping("/test")
public class TestController extends BaseController {

    private static Logger LOGGER = LoggerFactory.getLogger(TestController.class);

    @Autowired
    private SlaveService slaveService;

    /**
     * 主重库测试
     * @param model
     * @return
     */
    @RequestMapping(value = "/slave", method = RequestMethod.GET)
    public String slave(Model model) {
        Integer count = slaveService.count();
        model.addAttribute("count", count);
        return "admin/test";
    }

    /**
     * 图标测试
     * @param model
     * @return
     */
    @RequestMapping(value = "/dataGrid", method = RequestMethod.GET)
    public String dataGrid(Model model) {
        return "admin/test";
    }
    
    @RequestMapping(value = "/aaaaaaaa", method = RequestMethod.GET)
    public String aaa(Model model) {
        return "xt/index";
    }
    
 

}
