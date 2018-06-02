<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/commons/basejs.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新闻页</title>
<script type="text/javascript">
    

</script>
</head>
<body>
<div>
<table hight="1000" width="5000">
<tr>
<td>标题</td>
<td>地址</td>
<td>标题</td>
<td>标题</td>
 </tr>

<tr>
<c:forEach items="${informationList}" var="list">
<td>
 <a href="${list.href}">${list.title}</a> 

</td>
<td>
 ${list.href}
</td>
 </c:forEach>
    </tr>
    
     </table>
    </div>
</body>
</html>