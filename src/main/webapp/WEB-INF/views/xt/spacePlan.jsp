<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>ç©ºé´è®¡å</title>
		<link rel="stylesheet" type="text/css" href="./css/main.css"/>
	</head>
	<body>
		<div id="wrapper" class="index-bg">
			<header id="header" class="header" data-url='./layout/header.html'></header>
			<div class="content">
				<div class="story">
					<div class="title-box4">
						<h2 class="title" v-text="blockTitle"></h2>
					</div>
					<ul class="clearfix">
						<li class="planblock" v-for="item in planList">
							<div class="p-hd">
								<img :src="item.imgurl">
							</div>
							<div class="p-bd">
								<div class="title" v-text="item.title"></div>
								<div class="price">ï¿¥{{item.price}}/{{item.unit}}/æèµ·</div>
								<span class="gang"></span>
								<p v-text="item.desc"></p>
							</div>
							<div class="p-ft">
								<label>æéåï¼</label>
								<ul class="clearfix">
									<li v-for="point in item.point">{{point}}</li>
								</ul>
							</div>
						</li>
					</ul>
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
					blockTitle:"å¥é©»åç«æ¹",
					planList:[
						{
							imgurl:'./imgs/plan-01.png',
							title:'èååå¬',
							price:'600',
							unit:'æ¡',
							desc:'å¨ä¼åç©ºé´çèååå¬ç¯å¢ä¸­æ¨èªå·±çåå¬æ¡ã',
							point:[
							'åä¸å¬å¸åå°åæºæ','åä½ä¸åå±','æ¯æ¥ä½¿ç¨']
						},
						{
							imgurl:'./imgs/plan-02.jpg',
							title:'ä¸å±åå¬å®¤',
							price:'',
							unit:'',
							desc:'åå¬å®¤è®¾æ½é½å¨ï¼å°é­çå¯éå®åå¬å®¤å¯å®¹çº³ä»»ä½è§æ¨¡çå¢éã',
							point:[
							'1-100 äººä»¥ä¸è§æ¨¡çå¬å¸','éå±åå·²å»ºç«çå¢é','é¢å¤èªä¸»æ§åå®å¨æ§']
						},
						{
							imgurl:'./imgs/plan-03.png',
							title:'èªä¸»å®å¶ç©ºé´',
							price:'600',
							unit:'æ¡',
							desc:'å°é­çå¯éå®åå¬å®¤å¯å®¹çº³ä»»ä½è§æ¨¡çå¢éãå¯æ ¹æ®ä¼ä¸éæ±ï¼èªä¸»ååãçµæ´»å®å¶',
							point:['ä»»ä½è§æ¨¡çå¬å¸']
						}
					]
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
