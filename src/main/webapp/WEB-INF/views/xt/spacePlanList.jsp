<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<%@ include file="/commons/basejs.jsp" %>
		<meta charset="utf-8">
		<title>人才理念</title>
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
				<col width="200">
			</colgroup>
			<thead>
			<tr>
				<th>标题</th>
				<th>图片地址</th>
				<th>描述</th>
				<th>价格</th>
				<th>操作</th>
			</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${list}" varStatus="ind">
					<tr>
						<td>${item.title}</td>
						<td><a target="_blank" href="${item.imgurl}">${item.imgurl}</a></td>
						<td>${item.desc}</td>
						<td>${item.unitprice}</td>
						<td>
							<a class="layui-btn layui-btn-xs" href="${staticPath}/spacePlan/toAdd?id=${item.id}">编辑</a>
							<a class="layui-btn layui-btn-xs" onclick="del(${item.id})">删除</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	</body>
<script>
	$('#add').click(function () {
		window.location.href = "${staticPath}/spacePlan/toAdd?id=0";
    });


	function del(id) {
        //询问框
        layer.confirm('确定删除吗？', {
            btn: ['确定','取消'],
            shade:0
        }, function(){
            $.ajax({
                type: "POST",
                url: "${staticPath}/spacePlan/delete",
                data: {
                    id:id
                },
                dataType:"JSON",
                type:"GET",
                success: function (data) {
                    layer.msg(data.msg,{time:2000});
                    layer.close();
                    window.location.href = "${staticPath}/spacePlan/list";
                }
            });

        }, function(){
            layer.close();
        });
    }

</script>
</html>
