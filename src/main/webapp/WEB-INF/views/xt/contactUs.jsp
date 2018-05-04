<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>联系我们</title>
		<link rel="stylesheet" type="text/css" href="./css/main.css"/>
	</head>
	<body>
		<div id="wrapper" class="index-bg">
			<header id="header" class="header" data-url='./layout/header.html'></header>
			<div class="banner us">
				<img class="banner-bg" :src="bannerImg">
				<div class="bannerDiv">
					<div class="lgText" v-text="banSlogan"></div>
				</div>
			</div>
			<div class="content story us clearfix">
				<div class="left">
					<div class="title-box3">
						<h2 class="title" v-text="block1.title"></h2>
						<div class="subtitle" v-text="block1.subtitle"></div>
					</div>
					<div class="us-content" v-html="block1.c_html"></div>
				</div>
				<div class="right">
					<img :src="block1.imgurl">
				</div>
			</div>
			<div class="odd-bg">
				<div class="content story us clearfix">
					<div class="left">
						<div class="title-box2">
							<h2 class="title" v-text="block2.title"></h2>
						</div>
						<div class="us-content c2">
							<p>在运营的道路上，创立方始终以开放的心态引入更多专业的第三方服务机构，为更好地服务每一家企业，创立方希望充分整合外部第三方资源实现共享，引导中小创业团队、企业顺利启动和快速成长。</p>
							<p style="font-size:26px;">创立方愿与技术、管理、金融、财务、法学等各类服务资源建立合作。</p>
						</div>
					</div>
					<div class="right">
						<img :src="block2.imgurl">
					</div>
				</div>
			</div>
			<footer id="footer" data-url='./layout/footer.html'></footer>
		</div>
		<script src="./js/lib/jquery.min.js"></script>
		<script src="./js/lib/vue.min.js"></script>
		<script src="./js/common/public.js"></script>
		<script>
			var app=new Vue({
				el:'#wrapper',
				data:{
					bannerImg:'./imgs/us-banner.jpg',
					banSlogan:'资源共享 优势互补 合作共赢',
					block1:{
						title:'产业资源',
						subtitle:'资源共享 优势互补 合作共赢',
						c_html:'<p>一是以新兴产业为代表的互联网、物联网、人工智能、大数据、智能制造、基因工程等高端产业；</p><p>二是以文旅、教育、服务咨询为代表的高端软实力产业。</p>',
						imgurl:'./imgs/500002558.jpg',
					},
					block2:{
						title:'合作业务',
						imgurl:'./imgs/500060201.jpg',
					}
				},
				created(){
					this.initPageData();
				},
				methods:{
					initPageData(){//请求页面资源
						let self=this;
						// $.ajax({
						// 	type: "GET",
						// 	url: "",
						// 	data:{},
						// 	dataType: "json",
						// 	success: function(data){
						// 	      self.bannerImg=data.xxx;
						// 	}
						// })
					}
				}
			})
		</script>
	</body>
</html>