<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<%@ include file="/commons/basejs.jsp" %>
		<meta charset="utf-8">
		<title>联系我们</title>
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	</head>
	<body>
	<div class="layui-form" style="border: 1px solid #e6e6e6;margin: 20px 50px 50px 50px;">
		<button class="layui-btn" style="margin: 10px" id="add">添加</button>

		<table class="layui-table" style="margin-left: 10px;width: 98%">
			<colgroup>
				<col width="150">
				<col width="150">
				<col width="400">
				<col width="400">
				<col width="100">
			</colgroup>
			<thead>
			<tr>
				<th>位置</th>
				<th>副标题</th>
				<th>内容</th>
				<th>图片url</th>
				<th>操作</th>
			</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${list}" varStatus="ind">
					<tr>
						<td>
							<c:if test="${item.type=='1'}">顶部</c:if>
							<c:if test="${item.type=='2'}">产业资源</c:if>
							<c:if test="${item.type=='3'}">合作业务</c:if>
						</td>
						<td>${item.subtitle}</td>
						<td>${item.content}</td>
						<td><a target="_blank" href="${item.imgurl}">${item.imgurl}</a></td>
						<td> <a class="layui-btn layui-btn-xs" href="${staticPath}/contactUs/toAdd?id=${item.id}">编辑</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	</body>
<script>
	$('#add').click(function () {
		window.location.href = "${staticPath}/contactUs/toAdd?id=0";
    })
</script>
</html>
