<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<%@ include file="/commons/common.jsp" %>
		<meta charset="utf-8">
		<title>人才理念</title>
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	</head>
	<body>
	<div class="layui-form" style="border: 1px solid #e6e6e6;margin: 20px 50px 50px 50px;">
		<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
			<legend>
				<c:if test="${info.id > 0}">修改</c:if>
				<c:if test="${info.id == null}">添加</c:if>人才理念 </legend>
		</fieldset>

		<form class="layui-form">

			<div class="layui-form-item" style="margin: 5px;width: 400px;">
				<div class="layui-form-item layui-form-text">
					<label class="layui-form-label">工作内容</label>
					<div class="layui-input-block">
						<textarea id="content" name="content" class="layui-textarea"  lay-verify="required" placeholder="请输入" autocomplete="off">${info.content}</textarea>
					</div>
				</div>
			</div>
			<div class="layui-form-item" style="margin: 5px;width: 400px;">
				<label class="layui-form-label">图片</label>
				<input type="file" name="logoFile" id="logoFile" onchange="setImg(this);">
				<input type="hidden" name="imgurl" id="imgurl" value="${info.imgurl}">
				<img src="${info.imgurl}" style="margin-top: 10px;" name="thumburlShow" id="thumburlShow"  alt="">
			</div>
			<div class="layui-form-item">
				<div class="layui-input-block">
					<button class="layui-btn" lay-submit lay-filter="*" id="submit">立即提交</button>
					<button type="reset" class="layui-btn layui-btn-primary" id="back">返回</button>
				</div>
			</div>
			<input type="hidden" id="id" name="id" value="${id}">
		</form>
	</div>
	</body>
<script>
    layui.use('form', function(){
        var form = layui.form;
        form.render();
        form.on('submit(*)', function(){
            var id = $("#id").val();
            var content = $("#content").val();
            var imgurl = $("#imgurl").val();
            $.ajax({
                url:"${staticPath}/talentIdea/save",
                data:{
                    id:id,
                    content:content,
                    imgurl:imgurl
                },
                dataType:"JSON",
                type:"POST",
                success: function (data) {
                    if(data.code == '0') {
                        layer.msg(data.msg,{time:2000});
                        window.location.href ="${staticPath}/talentIdea/list";
                    } else{
                        layer.msg(data.msg,{time:2000});
                        return false;
                    }
                }
            })
			return false;
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
        window.location.href ="${staticPath}/talentIdea/list";
    })
</script>
</html>
