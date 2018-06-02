<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<%@ include file="/commons/common.jsp" %>
		<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
		<meta charset="utf-8">
		<title>首页</title>
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	</head>
	<body>
	<div class="layui-form" style="border: 1px solid #e6e6e6;margin: 20px 50px 50px 50px;">
		${list[0].title} 
		<table class="layui-table" style="margin-left: 10px;width: 98%">
			<thead align="center">
			<tr align="center">
				<th width="6%">位置</th>
				<th width="11%">標語</th>
				<th width="11%">副標語</th>
				<th width="11%">子標語</th>
				<th width="30%">内容</th>
				<th width="19%">图片url</th>
				<th width="12%">操作</th>
			</tr>
			</thead>
			<tbody >
<!-- 					<tr> -->
<!-- 						第一个  -->
<!-- 						<td align="center">頂部</td>  -->
<!-- 						<td align="center">標語</td> -->
<!-- 						<td align="center">副標語</td> -->
<!-- 						<td align="center">子標語</td> -->
<!-- 						<td align="center">图片url</td> -->
<!-- 						<td align="center"><a class="layui-btn layui-btn-xs" href="#" onclick = "edit()">编辑</a></td> -->
<!-- 					</tr> -->
<!-- 					<tr> -->
<!-- 						第二个  -->
<!-- 						<td align="center">第二行</td>  -->
<!-- 						<td align="center">標語</td> -->
<!-- 						<td align="center">副標語</td> -->
<!-- 						<td align="center">子標語</td> -->
<!-- 						<td align="center">图片url</td> -->
<!-- 						<td align="center"><a class="layui-btn layui-btn-xs" href="#" onclick = "edit()">编辑</a></td> -->
<!-- 					</tr> -->
<!-- 					<tr> -->
<!-- 					第三个  -->
<!-- 						<td align="center">第三行</td>  -->
<!-- 						<td align="center">標語</td> -->
<!-- 						<td align="center">副標語</td> -->
<!-- 						<td align="center">子標語</td> -->
<!-- 						<td align="center">图片url</td> -->
<!-- 						<td align="center"><a class="layui-btn layui-btn-xs" href="#" onclick = "edit()">编辑</a></td> -->
<!-- 					</tr> -->
<!-- 					<tr> -->
<!-- 					第四个  -->
<!-- 						<td align="center">第四行</td>  -->
<!-- 						<td align="center">標語</td> -->
<!-- 						<td align="center">副標語</td> -->
<!-- 						<td align="center">子標語</td> -->
<!-- 						<td align="center">图片url</td> -->
<!-- 						<td align="center"><a class="layui-btn layui-btn-xs" href="#" onclick = "edit()">编辑</a></td> -->
<!-- 					</tr> -->
<!-- 					<tr> -->
<!-- 					第五个  -->
<!-- 						<td align="center">第五行</td>  -->
<!-- 						<td align="center">標語</td> -->
<!-- 						<td align="center">副標語</td> -->
<!-- 						<td align="center">子標語</td> -->
<!-- 						<td align="center">图片url</td> -->
<!-- 						<td align="center"><a class="layui-btn layui-btn-xs" href="#" onclick = "edit()">编辑</a></td> -->
<!-- 					</tr> -->
<!-- 					<tr> -->
<!-- 					第六个  -->
<!-- 						<td align="center">第六行</td>  -->
<!-- 						<td align="center">標語</td> -->
<!-- 						<td align="center">副標語</td> -->
<!-- 						<td align="center">子標語</td> -->
<!-- 						<td align="center">图片url</td> -->
<!-- 						<td align="center"><a class="layui-btn layui-btn-xs" href="#" onclick = "edit()">编辑</a></td> -->
<!-- 					</tr> -->
					
					<c:forEach var="item" items="${list}" varStatus="ind">
					<tr>
						<td>${item.num}</td>
						<td>${item.title}</td>
						<td>${item.text1}</td>
						<td>${item.text2}</td>
						<td><textarea rows="2" cols="35">${item.text3}</textarea> </td>
						<td>${item.jpg}</td>
						<td>
							<a class="layui-btn layui-btn-xs" href="#" onclick = "edit('${item.id}')">编辑</a>
							<a class="layui-btn layui-btn-xs" >删除</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
			
			</table>
		
		
		
	</div>
	</body>
	
	<div id="view">
	
	</div>
<script>
	var edit = function(id){
		layer.open({
		    type: 2,
		    title: '編輯',
		    shadeClose: true,
		    shade: 0.8,
		    area: ['50%', '80%'],
		    content:  "${staticPath}/chuangLiFang/CLFEdit?id="+id,
// 		    content:  window.basePath+"/toEditPwd",
// 		    btn: ['确定','取消'] //按钮
// 		}, function(){
// 			alert(111);
//         }, function(){
		}); 
	}
</script>
</html>
