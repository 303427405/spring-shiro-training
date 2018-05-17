<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<%@ include file="/commons/common.jsp" %>
		<meta charset="utf-8">
		<title>招聘模块</title>
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<script type="text/javascript" charset="utf-8" src="${staticPath}/static/ueditor/ueditor.config.js"></script>
		<script type="text/javascript" charset="utf-8" src="${staticPath}/static/ueditor/ueditor.all.min.js"> </script>
		<script type="text/javascript" charset="utf-8" src="${staticPath}/static/ueditor/lang/zh-cn/zh-cn.js"></script>
		<link rel="stylesheet" href="${staticPath}/static/ueditor/themes/default/css/ueditor.css">
	</head>
	<body>
	<div class="layui-form" style="border: 1px solid #e6e6e6;margin: 20px 50px 50px 50px;">
		<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
			<legend>
				<c:if test="${info.recruitid > 0}">修改</c:if>
				<c:if test="${info.recruitid == 0}">添加</c:if>招聘模块 </legend>
		</fieldset>

		<form class="layui-form">
			<div class="layui-form-item" style="margin: 5px;width: 400px;">
				<label class="layui-form-label">岗位</label>
				<div class="layui-input-block">
					<input type="text" id="job" name="job" value="${info.job}" class="layui-input" lay-verify="required" placeholder="请输入" autocomplete="off" >
				</div>
			</div>

			<div class="layui-form-item" style="margin: 5px;width: 400px;">
				<label class="layui-form-label">岗位图片</label>
				<input type="file" name="logoFile" id="logoFile" onchange="setImg(this);">
				<input type="hidden" name="imgurl" id="imgurl" value="${info.imgurl}">
				<img src="${info.imgurl}" style="margin-top: 10px;" name="thumburlShow" id="thumburlShow"  alt="">
			</div>

			<div class="layui-form-item" style="margin: 5px;width: 400px;">
				<div class="layui-form-item layui-form-text">
					<label class="layui-form-label">岗位要求</label>
					<div class="layui-input-block">
						<script type="text/plain" id="jobrequire" name="jobrequire" style="width:1000px;height:240px;float: left;">${info.jobrequire}</script>
					</div>
				</div>
			</div>

			<div class="layui-form-item" style="margin: 5px;width: 400px;">
				<div class="layui-form-item layui-form-text">
					<label class="layui-form-label">工作内容</label>
					<div class="layui-input-block">
						<script type="text/plain" id="contentdesc" name="contentdesc" style="width:1000px;height:240px;float: left;">${info.contentdesc}</script>
					</div>
				</div>
			</div>

			<div class="layui-form-item">
				<div class="layui-input-block">
					<button class="layui-btn" lay-submit lay-filter="*" id="submit">立即提交</button>
					<button type="reset" class="layui-btn layui-btn-primary" id="back">返回</button>
				</div>
			</div>
			<input type="hidden" id="recruitId" name="recruitId" value="${recruitId}">
		</form>
	</div>
	</body>
<script>
    $(function(){
        var ue = UE.getEditor('jobrequire');
        var ue1 = UE.getEditor('contentdesc');
        layui.use('form', function(){
            var form = layui.form;
            form.render();
            form.on('submit(*)', function(){
                var recruitId = $("#recruitId").val();
                var job = $("#job").val();
                var imgurl = $("#imgurl").val();
                var jobrequire = ue.getContent();
                var contentdesc = ue1.getContent();
                if(imgurl == ''){
                    layer.msg("请上传图片!",{time:2000});
                    return false;
                }
                if($.trim(jobrequire) == ''){
                    layer.msg("职位要求不能为空!",{time:2000});
                    return false;
                }
                if($.trim(contentdesc) == ''){
                    layer.msg("工作内容不能为空",{time:2000});
                    return false;
                }
                $.ajax({
                    url:"${staticPath}/recruit/save",
                    data:{
                        recruitid:recruitId,
                        job:job,
                        imgurl:imgurl,
                        jobrequire:jobrequire,
                        contentdesc:contentdesc
                    },
                    dataType:"JSON",
                    type:"POST",
                    success: function (data) {
                        if(data.code == '0') {
                            layer.msg(data.msg,{time:2000});
                            setTimeout(window.location.href ="${staticPath}/recruit/list", 3000 );
                        } else{
                            layer.msg(data.msg,{time:2000});
                            return false;
                        }
                    }
                });
                return false;
            });
        });
    });

    function setImg(obj){//用于进行图片上传，返回地址
        var f=$(obj).val();
        if(f == null || f ==undefined || f == ''){
            return false;
        }
        if(!/\.(?:png|jpg|bmp|gif|PNG|JPG|BMP|GIF)$/.test(f))
        {
            layer.msg("类型必须是图片(.png|jpg|bmp|gif|PNG|JPG|BMP|GIF)",{time:2000});
            $(obj).val('');
            return false;
        }
        var data = new FormData();
        $.each($(obj)[0].files,function(i,file){
            data.append('file', file);
        });
        $.ajax({
            type: "POST",
            url: "/img/upload",
            data: data,
            cache: false,
            contentType: false,    //不可缺
            processData: false,    //不可缺
            dataType:"json",
            success: function(data) {
                if(data.code==0){
                    layer.msg("上传成功",{time:2000});
                    $("#imgurl").val(data.url);//将地址存储好
                    $("#thumburlShow").attr("src",data.url);//显示图片
                }else{
                    layer.msg("上传失败",{time:2000});
                    $("#imgurl").val("");
                    $(obj).val('');
                }
            },
            error: function(XMLHttpRequest, textStatus, errorThrown) {
                layer.msg("上传失败，请检查网络后重试",{time:2000});
                $("#imgurl").val("");
                $(obj).val('');
            }
        });
    }
    $("#back").click(function () {
        window.location.href ="${staticPath}/recruit/list"
    })
</script>
</html>
