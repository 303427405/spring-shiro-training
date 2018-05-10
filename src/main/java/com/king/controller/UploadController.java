package com.king.controller;

import com.king.code.Result;
import com.king.common.Constant;
import com.king.enums.RespCode;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;


/**
 * @Author: zhanglei
 * @Description:上传
 * @Date:2018年5月8日15:44:21
 */
@Controller
@RequestMapping("/img")
public class UploadController extends BaseController {

    @RequestMapping(value = "/upload", method = RequestMethod.POST)
    public ModelAndView uploadPicture(@RequestParam(value="file",required=false)MultipartFile file,
                                      HttpServletRequest request){
        File targetFile=null;
        String msg="";//返回存储路径
        int code=1;
        String fileName=file.getOriginalFilename();//获取文件名加后缀
        if(fileName!=null&&fileName!=""){
            String returnUrl = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() +"/upload/";//存储路径
            System.out.println(request.getSession().getServletContext());
            String path = request.getSession().getServletContext().getRealPath("/").replace("\\park",""); //文件存储位置
            String fileF = fileName.substring(fileName.lastIndexOf("."), fileName.length());//文件后缀
            fileName=new Date().getTime()+"_"+new Random().nextInt(1000)+fileF;//新的文件名

            //先判断文件是否存在
            String fileAdd = formatToString(new Date(),"yyyyMMdd");
            File file1 =new File(path+"/upload/"+fileAdd);
            //如果文件夹不存在则创建
            if(!file1.exists()  && !file1.isDirectory()){
                file1.mkdir();
            }
            targetFile = new File(file1, fileName);
            if (!targetFile.exists()){
                targetFile.mkdirs();
            }
            try {
                file.transferTo(targetFile);
//              msg=returnUrl+fileName;
                msg=returnUrl+fileAdd+"/"+fileName;
                code=0;
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        ModelMap model = new ModelMap();
        model.addAttribute(Constant.ResponseVO.CODE, RespCode.RESP_CODE_SUCCESS.getCode());
        model.addAttribute(Constant.ResponseVO.MSG,  "上传成功");
        model.addAttribute("url",msg);
        return new ModelAndView("jsonView", model);
    }

    private String formatToString(Date time,String format){
        SimpleDateFormat dateFormat = new SimpleDateFormat(format);
        return dateFormat.format(time);
    }
}
