<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<%@ include file="/commons/common.jsp" %>
		<meta charset="utf-8">
		<title>联系我们</title>
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	</head>
	<body>
	<div class="layui-form" style="border: 1px solid #e6e6e6;margin: 20px 50px 50px 50px;">
		<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
			<legend>
				<c:if test="${info.id > 0}">修改</c:if>
				<c:if test="${info.id == null}">添加</c:if>
				${info.id}联系我们 </legend>
		</fieldset>

		<form class="layui-form" action="">
			<div class="layui-form-item" style="margin: 5px;width: 400px;">
				<label class="layui-form-label">副标题</label>
				<div class="layui-input-block">
					<input type="text" id="subTitle" name="subTitle" autocomplete="off" placeholder="请输入标题" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item" style="margin: 5px;width: 400px;">
				<label class="layui-form-label">位置</label>
				<div class="layui-input-block">
					<select name="type" id="type">
						<option value="0"></option>
						<option value="1">顶部</option>
						<option value="2">产业资源</option>
						<option value="3">合作业务</option>
					</select>
				</div>
			</div>

			<div class="layui-form-item" style="margin: 5px;width: 400px;">
				<label class="layui-form-label">上传图片</label>
				<input type="file" name="logoFile" id="logoFile" onchange="setImg(this);">
				<input type="hidden" id="thumbUrl">
				<img src="" style="margin-top: 10px;" id="thumburlShow" alt="">
			</div>

			<div class="layui-form-item" style="margin: 5px;width: 400px;">
				<div class="layui-form-item layui-form-text">
					<label class="layui-form-label">内容</label>
					<div class="layui-input-block">
						<textarea placeholder="请输入内容" id="content" class="layui-textarea"></textarea>
					</div>
				</div>
			</div>

			<div class="layui-form-item">
				<div class="layui-input-block">
					<button class="layui-btn" id="submit">立即提交</button>
					<button type="reset" class="layui-btn layui-btn-primary">返回</button>
				</div>
			</div>
			<input type="hidden" id="id" value="${info.id}">
		</form>
	</div>
	</body>
<script>
    layui.use('form', function(){
        //各种基于事件的操作，下面会有进一步介绍
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
                    $("#thumbUrl").val(data.url);//将地址存储好
                    $("#thumburlShow").attr("src",data.url);//显示图片
                }else{
                    layer.msg("上传失败",{time:2000});
                    $("#thumbUrl").val("");
                    $(obj).val('');
                }
            },
            error: function(XMLHttpRequest, textStatus, errorThrown) {
                layer.msg("上传失败，请检查网络后重试",{time:2000});
                $("#thumbUrl").val("");
                $(obj).val('');
            }
        });
    }

    $("#submit").click(function () {
        alert(11111);
        var id = $("#id").val();
		var subTitle = $("#subTitle").val();
        var type = $("#type").val();
        var thumbUrl = $("#thumbUrl").val();
        var content = $("#content").val();
		if (type == 0){
            layer.msg("请选择类型",{time:2000});
		}
		if(type==2 && content==''){  //产业资源
            layer.msg("副标题不能为空",{time:2000});
		}
        $.ajax({
            url:"${staticPath}/contactUs/save",
            data:{
                id:id == null ? 0:id,
                subTitle:subTitle,
                type:type,
                thumbUrl:thumbUrl,
                content:content
            },
            dataType:"JSON",
            type:"POST",
            success: function (result) {
                if(result.code == 0) {
                    layer.msg(result.msg,{time:2000});
                    setTimeout(function() {
                        window.location.href ="${staticPath}/contactUs/list?type=1";
                    }, 500)
                } else{
                    layer.msg(result.msg,{time:2000});
                }
            }
        })
    })

</script>
</html>
