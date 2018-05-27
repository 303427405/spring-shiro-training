<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<%@ include file="/commons/basejs.jsp" %>
		<meta charset="utf-8">
		<title>企业服务子属性</title>
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
				<th>内容</th>
				<th>操作</th>
			</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${list}" varStatus="ind">
					<tr>
						<td>${item.key}</td>
						<td>${item.value}</td>
				
						<td>
							<a class="layui-btn layui-btn-xs" href="${staticPath}/enterprise/toAdd1?id=${item.id}">编辑</a>
							<a class="layui-btn layui-btn-xs" onclick="del(${item.id})">删除</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<input type="hidden" id="eid" name="eid" value="${eid}">
	</div>
	</body>
<script>
	$('#add').click(function () {
		var eid = $("#eid").val();
		window.location.href = "${staticPath}/enterprise/toAdd1?id=0&eid="+eid;
    });


	function del(id) {
        //询问框
        layer.confirm('确定删除吗？', {
            btn: ['确定','取消'],
            shade:0
        }, function(){
            $.ajax({
                type: "POST",
                url: "${staticPath}/enterprise/delete1",
                data: {
                    id:id
                },
                dataType:"JSON",
                type:"GET",
                success: function (data) {
                    layer.msg(data.msg,{time:2000});
                    layer.close();
                    window.location.href = "${staticPath}/enterprise/list";
                }
            });

        }, function(){
            layer.close();
        });
    }

</script>
</html>
