<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<!DOCTYPE html>
<html>
	<head>
	<%@ include file="/commons/basejs.jsp" %>
		<meta charset="utf-8" />
		<title>空间计划</title>
		<link rel="stylesheet" type="text/css" href="${path }/static/yq/css/main.css"/>
	</head>
	<body>
		<div id="wrapper" class="index-bg">
		<%@ include file="/WEB-INF/views/xt/layout/header.jsp" %>
			<div class="content">
				<div class="story">
					<div class="title-box4">
						<h2 class="title" v-text="blockTitle"></h2>
					</div>
					<ul class="clearfix">
						<c:forEach items="${list}" var="l" varStatus="vs"> 
						<li class="planblock" v-for="item in planList">
							<div class="p-hd">
								<img src="/${l.imgurl }">
							</div>
							<div class="p-bd">
								<div class="title" v-text="item.title"></div>
								<div class="price">${l.unitprice}</div>
								<span class="gang"></span>
								<p >${l.desc }</p>
							</div>
							<div class="p-ft">
								<label>最适合</label>
								<ul class="clearfix">
									<c:forEach items="${l.mostfits}" var="m" varStatus="vs">
										<li v-for="point in item.point">${m}</li>
									</c:forEach>
								</ul>
							</div>
						</li>
						</c:forEach>
					</ul>
				</div>	
			</div>
			<%@ include file="/WEB-INF/views/xt/layout/footer.jsp" %>
			
		</div>
		<script src="${path }/static/yq/js/lib/jquery.min.js"></script>
		<script src="${path }/static/yq/js/lib/vue.min.js"></script>
		<script src="${path }/static/yq/js/common/public.js"></script>
		<script>
		
		</script>
	</body>
</html>
