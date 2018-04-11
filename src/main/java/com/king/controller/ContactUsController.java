package com.king.controller;

import com.king.code.Result;
import com.king.model.CreateCubicContactUs;
import com.king.model.CreateCubicTalentIdea;
import com.king.service.ContactUsService;
import com.king.service.TalentIdeaService;
import com.king.vo.ContactUsVo;
import com.king.vo.TalentIdeaVo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

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
    @ResponseBody
    public Result save(@RequestBody ContactUsVo contactUsVo) {
        Result result = new Result();
        try {
            contactUsService.save(contactUsVo);
            result.setSuccess(true);
            result.setMsg(String.format("%s成功",contactUsVo.getId() == 0 ? "添加":"修改"));
            return result;
        } catch (RuntimeException e) {
            LOGGER.error("编辑失败：{}", e);
            result.setMsg(e.getMessage());
            return result;
        }
    }

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    @ResponseBody
    public List<CreateCubicContactUs> list(Integer type) {
        return contactUsService.list(type);
    }

}
