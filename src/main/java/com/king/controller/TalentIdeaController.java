package com.king.controller;

import com.king.code.Result;
import com.king.model.CreateCubicTalentIdea;
import com.king.service.TalentIdeaService;
import com.king.vo.TalentIdeaVo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;


/**
 * @Author: zhanglei
 * @Description:人才理念模块
 * @Date: 13:42 2018/4/9
 */
@Controller
@RequestMapping("/talentIdea")
public class TalentIdeaController extends BaseController {

    private static Logger LOGGER = LoggerFactory.getLogger(TalentIdeaController.class);

    @Autowired
    private TalentIdeaService talentIdeaService;

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public Result save(@RequestBody TalentIdeaVo talentIdeaVo) {
        Result result = new Result();
        try {
            talentIdeaService.save(talentIdeaVo);
            result.setSuccess(true);
            result.setMsg(String.format("%s成功",talentIdeaVo.getId() == 0 ? "添加":"修改"));
            return result;
        } catch (RuntimeException e) {
            LOGGER.error("编辑失败：{}", e);
            result.setMsg(e.getMessage());
            return result;
        }
    }

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    @ResponseBody
    public List<CreateCubicTalentIdea> list() {
        return talentIdeaService.list();
    }

}
