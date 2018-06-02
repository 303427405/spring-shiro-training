<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<!DOCTYPE html>
<%
String id = request.getParameter("id");


%>
<<script type="text/javascript">
	var id = <%=id %>;
	
	
</script>
<html>
	<head>
		<%@ include file="/commons/common.jsp" %>
		<meta charset="utf-8">
		<title>首页</title>
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	</head>
	<body>
		<form class="layui-form">
		<input type="hidden" id="id" name="id" value="${c.id}">
			<div class="layui-form-item" style="margin: 5px;width: 400px;">
				<label class="layui-form-label">位置</label>
				<div class="layui-input-block">
					<input type="text" id="num" name="num" value="${c.num}" autocomplete="off" disabled="disabled" class="layui-input">
				</div>
			</div>
			
			<div class="layui-form-item" style="margin: 5px;width: 400px;">
				<label class="layui-form-label">标语</label>
				<div class="layui-input-block">
					<input type="text" id="title" name="title" value="${c.title}" autocomplete="off" placeholder="请输入标题" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item" style="margin: 5px;width: 400px;">
				<label class="layui-form-label">副标语</label>
				<div class="layui-input-block">
					<input type="text" id="text1" name="text1" value="${c.text1}" autocomplete="off" placeholder="请输入标题" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item" style="margin: 5px;width: 400px;">
				<label class="layui-form-label">子标语</label>
				<div class="layui-input-block">
					<input type="text" id="text2" name="text2" value="${c.text2}" autocomplete="off" placeholder="请输入标题" class="layui-input">
				</div>
			</div>
			

			<div class="layui-form-item" style="margin: 5px;width: 400px;">
				<form action="${staticPath}/img/upload" enctype="multipart/form-data" method="post">
				<label class="layui-form-label">上传图片</label>
				<input type="file" name="logoFile" id="logoFile">
				<input type="hidden" name="imgurl" id="imgurl" value="">
				<img src="${c.jpg}" style="margin-top: 10px;" name="thumburlShow" id="thumburlShow"  alt="">
		 		</form>
			</div>

			<div class="layui-form-item" style="margin: 5px;width: 400px;">
				<div class="layui-form-item layui-form-text">
					<label class="layui-form-label">内容</label>
					<div class="layui-input-block">
						<textarea placeholder="请输入内容" id="text3" name="text3" class="layui-textarea">${c.text3}</textarea>
					</div>
				</div>
			</div>

			<div class="layui-form-item">
				<div class="layui-input-block">
					<button class="layui-btn" lay-submit lay-filter="*" onclick="edit();" id="submit" >确认</button>
					<button class="layui-btn layui-btn-primary"  onclick="qx()">取消</button>
				</div>
			</div>
		</form>
	</body>
	
<script type="text/javascript">

$(function(){
	
});

var edit = function(){
	var id = $("#id").val();
	var title = $("#title").val();
	var jpg = $("#jpg").val();
	var text1 = $("#text1").val();
	var text2 = $("#text2").val();
	var text3 = $("#text3").val();
	
	var chuangLiFangVo={'id':id,'title':title,'jpg':jpg,'text1':text1,'text2':text2,'text3':text3};
	$.ajaxSettings.async = false;
	$.post("${staticPath}/chuangLiFang/update",chuangLiFangVo,function(data){
		if(data == 'true'){
			alert('修改成功!');
			parent.window.location.reload();
			
		}else{
			alert('修改成功!');
		}
	});
}

function upd(id) {
	//var id;	
	var num;	//位置
	var jpg;	//
	var title;	
	var text1;
	var test2;
	var test3;
    //询问框
    layer.confirm('是否确认修改？', {
        btn: ['确定','取消'],
        shade:0
    }, function(){
        $.ajax({
            type: "POST",
            url: "${staticPath}/chuangLiFang/update",
            data: {
                id:id
            },
            dataType:"JSON",
            type:"GET",
            success: function (data) {
                layer.msg(data.msg,{time:2000});
                layer.close();
                window.location.href = "${staticPath}/recruit/list";
            }
        });

    }, function(){
        layer.close();
    });
}

var qx = function(){
	parent.window.location.reload();
// 	window.close();
}
</script>
</html>
