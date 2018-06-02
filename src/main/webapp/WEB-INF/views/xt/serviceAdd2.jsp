<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/commons/common.jsp"%>
<meta charset="utf-8">
<title>文件上传</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
</head>
<body>
	<div class="layui-form"
		style="border: 1px solid #e6e6e6; margin: 20px 50px 50px 50px;">
		<fieldset class="layui-elem-field layui-field-title"
			style="margin-top: 20px;">
			<legend>
				<c:if test="${info.id > 0}">修改</c:if>
				<c:if test="${info.id == 0}">添加</c:if>
				文件上传
			</legend>
		</fieldset>

		<form class="layui-form">
			<div class="layui-form-item" style="margin: 5px; width: 400px;">
				<label class="layui-form-label">标题</label>
				<div class="layui-input-block">
					<input type="text" id="title" name="title" value="${info.title}"
						class="layui-input" lay-verify="required" placeholder="请输入"
						autocomplete="off">
				</div>
			</div>

			<div class="layui-form-item" style="margin: 5px; width: 400px;">
				<label class="layui-form-label">地址</label>
				<div class="layui-input-block">
					<input type="text" id="title" name="title" value="${info.url}"
						class="layui-input" lay-verify="required" placeholder="请输入完整地址"
						autocomplete="off">
				</div>
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
	layui
			.use(
					'form',
					function() {
						var form = layui.form;
						form.render();
						form
								.on(
										'submit(*)',
										function() {
											var id = $("#id").val();
											var title = $("#title").val();
											var url = $("#url").val();
											$
													.ajax({
														url : "${staticPath}/enterprise/save2",
														data : {
															id : id,
															url : url,
															title : title
														},
														dataType : "JSON",
														type : "POST",
														success : function(data) {
															if (data.code == '0') {
																layer
																		.msg(
																				data.msg,
																				{
																					time : 2000
																				});
																setTimeout(
																		window.location.href = "${staticPath}/enterprise/list1",
																		3000);
															} else {
																layer
																		.msg(
																				data.msg,
																				{
																					time : 2000
																				});
																return false;
															}
														}
													});
											return false;
										});
					});

	$("#back").click(function() {
		window.location.href = "${staticPath}/enterprise/list1"
	})
</script>
</html>
