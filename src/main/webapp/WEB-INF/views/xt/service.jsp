<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>企业服务</title>
<link rel="stylesheet" type="text/css"
	href="${path }/static/yq/css/main.css" />
</head>
<body>
	<div id="wrapper" class="index-bg">
		<%@ include file="/WEB-INF/views/xt/layout/header.jsp"%>
		<div class="content">
			<div class="officeService service">
				<div class="title-box3">
					<h2 class="title">办公服务</h2>
					<div class="subtext">您只需专注于发展自己的业务，其他的交给创立方</div>
				</div>
				<div class="basicService">
					<div class="centerblock">
						<div class="title">8大基础服务</div>
					</div>
					<div class="service-box">
						<div class="service-item">
							<i class="icon icon-cube"></i>
							<p class="text-center">个性空间定制</p>
						</div>
						<div class="service-item">
							<i class="icon icon-qi"></i>
							<p class="text-center">企业注册对接</p>
						</div>
						<div class="service-item">
							<i class="icon icon-squ"></i>
							<p class="text-center">基础行政代管</p>
						</div>
						<div class="service-item">
							<i class="icon icon-loc"></i>
							<p class="text-center">公共场地预定</p>
						</div>
						<div class="service-item">
							<i class="icon icon-printer"></i>
							<p class="text-center">文印及设备租赁</p>
						</div>
						<div class="service-item">
							<i class="icon icon-cart"></i>
							<p class="text-center">办公采购</p>
						</div>
						<div class="service-item">
							<i class="icon icon-c09">icon-world</i>
							<p class="text-center">物业服务</p>
						</div>
						<div class="service-item">
							<i class="icon icon-c09">icon-bind</i>
							<p class="text-center">第三方基础服务接入</p>
						</div>
					</div>
				</div>
				<div class="advService">

					<div class="title-box3">
						<h3 class="subtitle">优质设施</h3>
					</div>
					<div class="clearfix">

						<div class="contPhoto">
							<c:forEach items="${ylist}" var="y">
								<img src="${y.imgurl }">
							</c:forEach>
						</div>
						<div class="contAdv">
							<c:forEach items="${yelist}" var="ye">
								<ul>
									<li v-for="item in deviceList">
										<div class="advLeft">
											<strong>${ye.key }</strong>
										</div>
										<div class="advRight">
											<p>${ye.value }</p>
										</div>
									</li>
								</ul>
							</c:forEach>
						</div>
					</div>

				</div>
			</div>
			<div class="creService service">
				<div class="title-box3">
					<h2 class="title">创业服务</h2>
				</div>
				<div class="basicService">
					<div class="centerblock">
						<div class="title">9大增值服务</div>
					</div>
					<div class="service-box">

						<div class="service-item" v-for="item in increList">
							<i class="icon icon-c05"></i>
							<p class="text-center">人才直通车</p>
						</div>
						<div class="service-item" v-for="item in increList">
							<i class="icon icon-c06"></i>
							<p class="text-center">融资直通车</p>
						</div>
						<div class="service-item" v-for="item in increList">
							<i class="icon icon-c09"></i>
							<p class="text-center">政府直通车</p>
						</div>
						<div class="service-item" v-for="item in increList">
							<i class="icon icon-c02"></i>
							<p class="text-center">创辅直通车</p>
						</div>
						<div class="service-item" v-for="item in increList">
							<i class="icon icon-c07"></i>
							<p class="text-center">研发直通车</p>
						</div>
						<div class="service-item" v-for="item in increList">
							<i class="icon icon-c08"></i>
							<p class="text-center">展售直通车</p>
						</div>
						<div class="service-item" v-for="item in increList">
							<i class="icon icon-c04"></i>
							<p class="text-center">媒体直通车</p>
						</div>
						<div class="service-item" v-for="item in increList">
							<i class="icon icon-c03"></i>
							<p class="text-center">法务直通车</p>
						</div>
						<div class="service-item" v-for="item in increList">
							<i class="icon icon-c01"></i>
							<p class="text-center">财务直通车</p>
						</div>

					</div>
				</div>
				<!--  -->
				<div class="advService">

					<div class="title-box3">
						<h3 class="subtitle">相关服务</h3>
					</div>
					<div class="clearfix">
						<div class="contPhoto">
							<c:forEach items="${xlist}" var="xl">
								<img src="${xl.imgurl }">
							</c:forEach>
						</div>
						<div class="contAdv">
							<c:forEach items="${xelist}" var="xe">
								<ul>
									<li v-for="item in otherIncreList">
										<div class="advLeft">
											<strong>${xe.key }</strong>
										</div>
										<div class="advRight">
											<p >${xe.value }</p>
										</div>
									</li>
								</ul>
							</c:forEach>
						</div>
					</div>

				</div>
			</div>
		</div>
		<div class="proExhibit story odd-bg">
			<div class="proConst content clearfix">
				<div class="coreContent">
					<p class="storyTitle">产品展厅</p>
					<p class="storysubTitle">'交流、学习、一起成长</p>
					<p class="serCont">打造有归属感的社群：依托园区特色社群，组织企业开展丰富多彩的主题活动，如每月创业培训、观影会、卡牌桌游、读书会、趣味运动会等，丰富企业生活，增强企业凝聚力。</p>
				</div>
				<div class="contAdv">
					<c:forEach items="${celist}" var="e">
						<ul>
							<li v-for="item in proList">
								<div class="advLeft">
									<strong>${e.key }</strong>
								</div>
								<div class="advRight">
									<p >${e.value }</p>
								</div>
							</li>
						</ul>
					</c:forEach>
				</div>
			</div>
		</div>
		<div class="content">
			<div class="service">
				<div class="title-box3">
					<h2 class="title" >下载中心</h2>
					<div class="subtext">您只需专注于发展自己的业务，其他的交给创立方</div>
				</div>
				<div class="basicService">
					<div class="centerblock" v-if="docList.length<1">
						<p>暂无可供下载的文件</p>
					</div>
					<div class="service-box">
						<div class="docbox" v-for="item in docList">
							<c:forEach items="${dlist}" var="l">
								<span>${l.title}</span>
								<a href="${l.url }">下载</a>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
			<div class="service">
				<div class="title-box3">
					<h2 class="title">常见问题</h2>
				</div>
				<div class="problems clearfix">
					<c:forEach items="${cjelist}" var="e">
						<div class="problem">

							<div class="title">${e.key }</div>
							<p class="desc">${e.value }</p>

						</div>
					</c:forEach>
				</div>
			</div>
		</div>
		<%@ include file="/WEB-INF/views/xt/layout/footer.jsp"%>
	</div>
	<script src="${path }/static/yq/js/lib/jquery.min.js"></script>
	<script src="${path }/static/yq/js/lib/vue.min.js"></script>
	<script src="${path }/static/yq/js/common/public.js"></script>
	<script>
			
		</script>
</body>
</html>
