<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/commons/common.jsp"%>
<meta charset="utf-8">
<title>企业服务子属性</title>
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
				企业服务子属性
			</legend>
		</fieldset>

		<form class="layui-form">
			<div class="layui-form-item" style="margin: 5px; width: 400px;">
				<label class="layui-form-label">标题</label>
				<div class="layui-input-block">
					<input type="text" id="key" name="key" value="${info.key}"
						class="layui-input" lay-verify="required" placeholder="请输入"
						autocomplete="off">
				</div>
			</div>



			<div class="layui-form-item" style="margin: 5px; width: 400px;">
				<div class="layui-form-item layui-form-text">
					<label class="layui-form-label">内容</label>
					<div class="layui-input-block">
						<textarea id="value" name="value" class="layui-textarea"
							lay-verify="required" placeholder="请输入" autocomplete="off">${info.value}</textarea>
					</div>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-input-block">
					<button class="layui-btn" lay-submit lay-filter="*" id="submit">立即提交</button>
					<button type="reset" class="layui-btn layui-btn-primary" id="back">返回</button>
				</div>
			</div>
			<input type="hidden" id="eid" name="eid" value="${eid}"> <input
				type="hidden" id="id" name="id" value="${id}">
		</form>
	</div>
</body>
<script>
	layui.use('form', function() {
		var form = layui.form;
		form.render();
		form.on('submit(*)', function() {
			var id = $("#id").val();
			var key = $("#key").val();
			var value = $("#value").val();
			var eid = $("#eid").val();
			$.ajax({
				url : "${staticPath}/enterprise/save1",
				data : {
					id : id,
					key : key,
					eid : eid,
					value : value
				},
				dataType : "JSON",
				type : "POST",
				success : function(data) {
					if (data.code == '0') {
						layer.msg(data.msg, {
							time : 2000
						});
						window.location.href = "${staticPath}/enterprise/list";
					} else {
						layer.msg(data.msg, {
							time : 2000
						});
						return false;
					}
				}
			})
			return false;
		});
	});

	$("#back").click(function() {
		window.location.href = "${staticPath}/enterprise/list"
	})
</script>
</html>
