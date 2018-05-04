<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" type="text/css" href="./css/main.css"/>
		<title>æ°é»å¨æ</title>
	</head>
	<body>
		<div id="wrapper">
			<header id="header" class="header" data-url='./layout/header.html'></header>
			<div class="newsList index-bg">
				<div v-if="company" class="company newsItem">
					<p class="storyTitle" v-text="company.title"></p>
					<div class="nitem-left">
						<a :href="company.artList[0].url" :title="company.artList[0].title">
							<img :src="company.artList[0].imgurl"/>
						</a>
					</div>
					<div class="nitem-right">
						<a class="first-title" :href="company.artList[0].url" v-text="company.artList[0].title"></a>
						<ul class="clearfix">
							<li v-for="art,idx in company.artList" v-if="idx>0">
								<a :href="art.url" v-text="art.title"></a>
							</li>
						</ul>
					</div>
				</div>
				<div v-if="brand" class="brand newsItem">
					<p class="storyTitle" v-text="brand.title"></p>
					<div class="nitem-left">
						<a :href="brand.artList[0].url" :title="brand.artList[0].title">
							<img :src="brand.artList[0].imgurl"/>
						</a>
					</div>
					<div class="nitem-right">
						<a class="first-title"  :href="brand.artList[0].url" v-text="brand.artList[0].title"></a>
						<ul class="clearfix">
							<li v-for="art,idx in brand.artList" v-if="idx>0">
								<a :href="art.url" v-text="art.title"></a>
							</li>
						</ul>
					</div>
				</div>
				<div v-if="industry" class="industry newsItem">
					<p class="storyTitle" v-text="industry.title"></p>
					<div class="nitem-left">
						<a :href="industry.artList[0].url" :title="industry.artList[0].title">
							<img :src="industry.artList[0].imgurl"/>
						</a>
					</div>
					<div class="nitem-right">
						<a class="first-title" :href="industry.artList[0].url" v-text="industry.artList[0].title"></a>
						<ul class="clearfix">
							<li v-for="art,idx in industry.artList" v-if="idx>0">
								<a :href="art.url" v-text="art.title"></a>
							</li>
						</ul>
					</div>
				</div>
				<div v-if="newProducts" class="newProducts newsItem">
					<p class="storyTitle" v-text="newProducts.title"></p>
					<div class="nitem-left">
						<a :href="newProducts.artList[0].url" :title="newProducts.artList[0].title">
							<img :src="newProducts.artList[0].imgurl"/>
						</a>
					</div>
					<div class="nitem-right">
						<a class="first-title" :href="newProducts.artList[0].url" v-text="newProducts.artList[0].title"></a>
						<ul class="clearfix">
							<li v-for="art,idx in newProducts.artList" v-if="idx>0">
								<a :href="art.url" v-text="art.title"></a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="newsBanner">
				<img class="banner-bg" :src="bannerImg"/>
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
					bannerImg:'./imgs/news-banner.jpg',
					company:{
						title:'å¬å¸å¨æ',
						artList:[
						{
							imgurl:'./imgs/clf-06.jpg',
							title:'å±èåäº« å±åæªæ¥ ä¸èå·Â·åç«æ¹èæºä¼æåä¸¾å',
							url:'#',
						},
						{
							imgurl:'./imgs/clf-06.jpg',
							title:'å¥é©»ççº§ä¼åç©ºé´æ¯ä¸ç§ææ ·çä½éªï¼',
							url:'#',
						},
						{
							imgurl:'./imgs/clf-06.jpg',
							title:'å¬å¬ï¼ä½ è¿è®°å¾ç½é©¬æ¹ççåéåï¼',
							url:'#',
						},
						{
							imgurl:'./imgs/clf-06.jpg',
							title:'åç«æ¹è£èºæ­å·å¸âç°ä»£æå¡ä¸åè¿ä¼ä¸âç§°å·',
							url:'#',
						},
						{
							imgurl:'./imgs/clf-06.jpg',
							title:'åç«æ¹ä¸ä¸èç»æµå¼ååºè¾¾æåä½ æ¨å¨æé âååâå¤§åå±æ°å¼æ',
							url:'#',
						},
						]
					},
					brand:{
						title:'åçæ´»å¨',
						artList:[
						{
							imgurl:'./imgs/news-01.jpg',
							title:'èµæ¬åæ¢¦æ³é«éç¢°æ!äºèç½è¡ä¸ææé¡¹ç®è·¯æ¼å®ç¾é­å¹',
							url:'#',
						},
						{
							imgurl:'./imgs/news-01.jpg',
							title:'æä¸ç©ãçèè£èãï¼ä½æ¯ææè¯è¦è¯´',
							url:'#',
						},
						{
							imgurl:'./imgs/news-01.jpg',
							title:'ãåªä¸æ­çè¿ä¹±çâåå·¥ç¦»èâæ³å¾é£é©ãç²¾å½©åé¡¾ï¼',
							url:'#',
						},
						{
							imgurl:'./imgs/news-01.jpg',
							title:'åç«æ¹ä¸ºä¼ä¸âç§äººè®¢å¶âçè´¢ç¨è®²åº§åæ»¡ç»æï¼',
							url:'#',
						},
						{
							imgurl:'./imgs/news-01.jpg',
							title:'ä½ çä¸å¤æä¹¦åç¤¼ç©å°äº,è¯·ç­¾æ¶ä¸ä¸~',
							url:'#',
						},
						{
							imgurl:'./imgs/news-01.jpg',
							title:'åå¤§é¡¹ç®äº®ç¸TMTä¸åºè·¯æ¼ ç°åºå¸âçâï¼',
							url:'#',
						},
						{
							imgurl:'./imgs/news-01.jpg',
							title:'è¿ä¸ªå¤å¤©ï¼åä¸çæ¢¦æ³å°ç¹ç188åä¸è¶æ¥¼ï¼',
							url:'#',
						},
						]
					},
					industry:{
						title:'è¡ä¸å¨æ',
						artList:[
						{
							imgurl:'./imgs/news-02.jpg',
							title:'å½éååå¤§èµä¸çâä¸­å½é¦å',
							url:'#',
						},
						{
							imgurl:'./imgs/news-02.jpg',
							title:'æµæ±ååä¸ºå¥è¿ä¹çï¼è¿ä¸¤ä¸ªåå ä¹è®¸ä½ æ³ä¸å°â¦â¦',
							url:'#',
						},
						{
							imgurl:'./imgs/news-02.jpg',
							title:'æµæ±æè²æ¥ï¼ååæè²ï¼ç»æµæ±ç¹èµ',
							url:'#',
						},
						{
							imgurl:'./imgs/news-02.jpg',
							title:'âæ¥åæ£å¼âçå­µåï¼ä¼åç©ºé´çâæ­å·æ¨¡å¼â',
							url:'#',
						},
						{
							imgurl:'./imgs/news-02.jpg',
							title:'141å®¶ççº§ä¼åç©ºé´ååå¬å¸ï¼å¿«æ¥å´è§è¿äºååâèå°â',
							url:''
						}
						]
					},
					newProducts:{
						title:'æ°åå¿«è®¯',
						artList:[
						{
							imgurl:'./imgs/news-03.jpg',
							title:'å¬å¬ï¼ä½ è¿è®°å¾ç½é©¬æ¹ççåéåï¼',
							url:'#',
						},
						{
							imgurl:'./imgs/news-03.jpg',
							title:'åç«æ¹ä¸ä¸èç»æµå¼ååºè¾¾æåä½ æ¨å¨æé âååâå¤§åå±æ°å¼æ',
							url:'#',
						}
						]
					}
				},
				created(){
					this.initPageData();
				},
				methods:{
					initPageData(){//è¯·æ±é¡µé¢èµæº
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
