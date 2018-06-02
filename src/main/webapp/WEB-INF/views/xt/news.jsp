<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<!DOCTYPE html>

<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" type="text/css" href="${staticBase}/css/main.css"/>
		<title>新闻动态</title>
	</head>
	<body>
	
		<div id="wrapper">
			<%@ include file="/WEB-INF/views/xt/layout/header.jsp" %>
			<div class="newsList index-bg">
				<div v-if="company" class="company newsItem">
					<p class="storyTitle" v-text="公司动态">公司动态</p>
					<div class="nitem-left">
						<a href="" title="公司动态">
							<img src="${staticBase}/imgs/news-banner.jpg"/>
						</a>
					</div>
					<div class="nitem-right">
						<c:forEach var="list" items="${gsdtMap}">
						<a class="first-title" href="${list.href }" value="${list.title }"></a>
						<ul class="clearfix">
							<li v-for="art,idx in company.artList" v-if="idx>0">
								<a href="${list.href }">${list.title }</a>
							</li>
						</ul>
						</c:forEach>
					</div>
				</div>
				<div v-if="brand" class="brand newsItem">
					<p class="storyTitle" v-text="brand.title">品牌活动</p>
					<div class="nitem-left">
						<a :href="brand.artList[0].url" :title="brand.artList[0].title">
							<img src="${staticBase }/imgs/news-01.jpg"/>
						</a>
					</div>
					<div class="nitem-right">
											<c:forEach var="list" items="${pphdMap}">
						<a class="first-title" href="${list.href }" value="${list.title }"></a>
						<ul class="clearfix">
							<li v-for="art,idx in company.artList" v-if="idx>0">
								<a href="${list.href }">${list.title }</a>
							</li>
						</ul>
						</c:forEach>
					</div>
				</div>
				<div v-if="industry" class="industry newsItem">
					<p class="storyTitle" v-text="industry.title">行业动态</p>
					<div class="nitem-left">
						<a href="industry.artList[0].url" title="industry.artList[0].title">
							<img src="${staticBase }/imgs/news-02.jpg"/>
						</a>
					</div>
					<div class="nitem-right">
						<c:forEach var="list" items="${hydtMap}">
						<a class="first-title" href="${list.href }" value="${list.title }"></a>
						<ul class="clearfix">
							<li v-for="art,idx in company.artList" v-if="idx>0">
								<a href="${list.href }">${list.title }</a>
							</li>
						</ul>
						</c:forEach>
					</div>
				</div>
				<div v-if="newProducts" class="newProducts newsItem">
					<p class="storyTitle" v-text="newProducts.title">新品快讯</p>
					<div class="nitem-left">
						<a :href="newProducts.artList[0].url" :title="newProducts.artList[0].title">
							<img src="${staticBase }/imgs/news-03.jpg"/>
						</a>
					</div>
					<div class="nitem-right">
							<c:forEach var="list" items="${xpkxtMap}">
						<a class="first-title" href="${list.href }" value="${list.title }"></a>
						<ul class="clearfix">
							<li v-for="art,idx in company.artList" v-if="idx>0">
								<a href="${list.href }">${list.title }</a>
							</li>
						</ul>
						</c:forEach>
					</div>
				</div>
			</div>
			<div class="newsBanner">
				<img class="banner-bg" :src="bannerImg"/>
			</div>
			<footer id="footer" data-url='${staticBase }/layout/footer.html'></footer>
		</div>
		<script src="${staticBase }/js/lib/jquery.min.js"></script>
		<script src="${staticBase }/js/lib/vue.min.js"></script>
		<script src="${staticBase }/js/common/public.js"></script>
		<script>
// 			$(document).ready(function(){
// 				//公司动态
// 				var gsdt = "${gsdtMap}";
// 				var a =gsdt.replace('=',':');
// 					console.log(a);
// 				var gsdtData =eval ("(" + gsdt + ")");
// 				console.log(gsdtData);
					
					
// 				//品牌活动
// 				var pphd = "${pphdMap}";
// 				//行业动态
// 				var hydt= "${hydtMap}";
// 				//新品快讯
// 				var xpkx ="${xpkxtMap}";
				
// 			})
		
		
// 			var app=new Vue({
// 				el:'#wrapper',
// 				data:{
// 					bannerImg:'${staticBase }/imgs/news-banner.jpg',
// 					company:{
// 						title:'公司动态',
// 						artList:[
// 						{
// 							imgurl:'${staticBase }/imgs/clf-06.jpg',
// 							title:'共融同享 共创未来 上虞号·创立方聚智会成功举办',
// 							url:'#',
// 						},
// 						{
// 							imgurl:'${staticBase }/imgs/clf-06.jpg',
// 							title:'入驻省级众创空间是一种怎样的体验？',
// 							url:'#',
// 						},
// 						{
// 							imgurl:'${staticBase }/imgs/clf-06.jpg',
// 							title:'嬛嬛，你还记得白马湖畔的四郎吗？',
// 							url:'#',
// 						},
// 						{
// 							imgurl:'${staticBase }/imgs/clf-06.jpg',
// 							title:'创立方荣膺杭州市“现代服务业先进企业”称号',
// 							url:'#',
// 						},
// 						{
// 							imgurl:'${staticBase }/imgs/clf-06.jpg',
// 							title:'创立方与上虞经济开发区达成合作 旨在打造“双创”大发展新引擎',
// 							url:'#',
// 						},
// 						]
// 					},
// 					brand:{
// 						title:'品牌活动',
// 						artList:[
// 						{
// 							imgurl:'${staticBase }/imgs/news-01.jpg',
// 							title:'资本和梦想高速碰撞!互联网行业明星项目路演完美闭幕',
// 							url:'#',
// 						},
// 						{
// 							imgurl:'${staticBase }/imgs/news-01.jpg',
// 							title:'我不玩《王者荣耀》，但是我有话要说',
// 							url:'#',
// 						},
// 						{
// 							imgurl:'${staticBase }/imgs/news-01.jpg',
// 							title:'《剪不断理还乱的“员工离职”法律风险》精彩回顾！',
// 							url:'#',
// 						},
// 						{
// 							imgurl:'${staticBase }/imgs/news-01.jpg',
// 							title:'创立方为企业“私人订制”的财税讲座圆满结束！',
// 							url:'#',
// 						},
// 						{
// 							imgurl:'${staticBase }/imgs/news-01.jpg',
// 							title:'你的七夕情书和礼物到了,请签收一下~',
// 							url:'#',
// 						},
// 						{
// 							imgurl:'./imgs/news-01.jpg',
// 							title:'四大项目亮相TMT专场路演 现场吸“睛”！',
// 							url:'#',
// 						},
// 						{
// 							imgurl:'${staticBase }/imgs/news-01.jpg',
// 							title:'这个夏天，创业的梦想将点燃188创业茶楼！',
// 							url:'#',
// 						},
// 						]
// 					},
// 					industry:{
// 						title:'行业动态',
// 						artList:[
// 						{
// 							imgurl:'${staticBase }/imgs/news-02.jpg',
// 							title:'国际双创大赛上看“中国首创',
// 							url:'#',
// 						},
// 						{
// 							imgurl:'${staticBase }/imgs/news-02.jpg',
// 							title:'浙江双创为啥这么牛？这两个原因也许你想不到……',
// 							url:'#',
// 						},
// 						{
// 							imgurl:'${staticBase }/imgs/news-02.jpg',
// 							title:'浙江教育报：双创教育，给浙江点赞',
// 							url:'#',
// 						},
// 						{
// 							imgurl:'${staticBase }/imgs/news-02.jpg',
// 							title:'“接力棒式”的孵化，众创空间的“杭州模式”',
// 							url:'#',
// 						},
// 						{
// 							imgurl:'${staticBase }/imgs/news-02.jpg',
// 							title:'141家省级众创空间名单公布！快来围观这些双创“胜地”',
// 							url:''
// 						}
// 						]
// 					},
// 					newProducts:{
// 						title:'新品快讯',
// 						artList:[
// 						{
// 							imgurl:'${staticBase }/imgs/news-03.jpg',
// 							title:'嬛嬛，你还记得白马湖畔的四郎吗？',
// 							url:'#',
// 						},
// 						{
// 							imgurl:'${staticBase }/imgs/news-03.jpg',
// 							title:'创立方与上虞经济开发区达成合作 旨在打造“双创”大发展新引擎',
// 							url:'#',
// 						}
// 						]
// 					}
// 				},
// 				created(){
// 					this.initPageData();
// 				},
// 				methods:{
// 					initPageData(){//请求页面资源
// 						let self=this;
// 						// $.ajax({
// 						// 	type: "GET",
// 						// 	url: "",
// 						// 	data:{},
// 						// 	dataType: "json",
// 						// 	success: function(data){
// 						// 	      self.bannerImg=data.xxx;
// 						// 	}
// 						// })
// 					}
// 				}
// 			})
		</script>
	</body>
</html>
