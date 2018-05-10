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
				<col width="200">
				<col width="200">
			</colgroup>
			<thead>
			<tr>
				<th>人物</th>
				<th>民族</th>
				<th>出场时间</th>
				<th>格言</th>
			</tr>
			</thead>
			<tbody>
			<tr>
				<td>贤心</td>
				<td>汉族</td>
				<td>1989-10-14</td>
				<td>人生似修行</td>
			</tr>
			<tr>
				<td>张爱玲</td>
				<td>汉族</td>
				<td>1920-09-30</td>
				<td>于千万人之中遇见你所遇见的人，于千万年之中，时间的无涯的荒野里…</td>
			</tr>
			<tr>
				<td>Helen Keller</td>
				<td>拉丁美裔</td>
				<td>1880-06-27</td>
				<td> Life is either a daring adventure or nothing.</td>
			</tr>
			<tr>
				<td>岳飞</td>
				<td>汉族</td>
				<td>1103-北宋崇宁二年</td>
				<td>教科书再滥改，也抹不去“民族英雄”的事实</td>
			</tr>
			<tr>
				<td>孟子</td>
				<td>华夏族（汉族）</td>
				<td>公元前-372年</td>
				<td>猿强，则国强。国强，则猿更强！ </td>
			</tr>
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
