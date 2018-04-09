package com.king.controller;

import com.king.code.Result;
import com.king.model.CreateCubicRecruit;
import com.king.service.RecruitService;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

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
    @ResponseBody
    public Result save(@RequestBody CreateCubicRecruit createCubicRecruit) {
        Result result = new Result();
        try {
            checkParam(createCubicRecruit);
            recruitService.save(createCubicRecruit);
            result.setSuccess(true);
            result.setMsg(String.format("%s成功",createCubicRecruit.getRecruitid() == 0 ? "添加":"修改"));
            return result;
        } catch (RuntimeException e) {
            LOGGER.error("编辑失败：{}", e);
            result.setMsg(e.getMessage());
            return result;
        }
    }

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    @ResponseBody
    public List<CreateCubicRecruit> list() {
        return recruitService.list();
    }

    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    @ResponseBody
    public Result list(@RequestParam(value = "recruitid",required = true) Integer recruitid) {
        return recruitService.delete(recruitid);
    }

    private void checkParam(CreateCubicRecruit param){
        if (StringUtils.isEmpty(param.getJob())){
            throw new RuntimeException("招聘岗位不能为空");
        }
        if (StringUtils.isEmpty(param.getImgurl())){
            throw new RuntimeException("岗位图片不能为空");
        }
        if (StringUtils.isEmpty(param.getJobrequire())){
            throw new RuntimeException("职位要求不能为空");
        }
        if (StringUtils.isEmpty(param.getContentdesc())){
            throw new RuntimeException("工作内容不能为空");
        }
    }
}
