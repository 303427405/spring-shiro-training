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
		<meta charset="utf-8" />
		<title>首页</title>
<!-- 		<link rel="stylesheet" type="text/css" href="./css/main.css"/> -->
		<link rel="stylesheet" type="text/css" href="${staticPath}/static/yq/css/main.css"/>
	</head>
	<body>
		<div id="indexWrapper" class="index-bg">
			<div class="index-banner">
				<header id="header" class="header index-header" data-url='${staticPath}/static/yq/layout/header.html'></header>
				<img class="banner-bg" :src="bannerImg">
				<div class="headContent">
					<div class="content">
						<h2 v-text="banSlogan"></h2>
						<p v-for='item in subSlogan' v-text='item'></p>
					</div>
				</div>
				<div class="headSearch">
					<div class="content">
						<p>寻找专属办公空间或共享工位</p>
						<div>
							<select class="banner-sel">
								<option>可选区域</option>
								<option v-for="area in areaList" v-text="area.text"></option>
							</select>
							<button type="button" class="btn btn-sel" @click="checkplace">查看地点</button>
						</div>
					</div>
				</div>
			</div>
			<div class="welcomeClf">
				<div class="content">
					<div class="welclfCont clearfix">
						<div class="welClfLeft">
							<img :src="welData.imgurl"/>
						</div>
						<div class="welClfRight">
							<div class="title-box">
								<p class="lead" v-text='welData.lead'></p>
								<h3 class="title">欢迎来到<span>创立方办公空间</span></h3>
								<span class="dec"></span>
							</div>
							<p class="desc" v-text='welData.desc'></p>
							<p class="end" v-text='welData.end'></p>
						</div>
					</div>
				</div>
			</div>
			<div class="welcomeContent">
				<div class="content">
					<div class="welList">
						<ul >
							<li class="clearfix" v-for="art,idx in welList">
								<div class="wblock">
									<div class="wlwenimg" v-if="idx<1">
										<div class="title-box">
											<p class="lead" v-text='block2.lead'></p>
											<h3 class="title" v-text='block2.title'></h3>
											<span class="dec"></span>
										</div>
										<div class="photo">
											<img :src="art.imgurl"/>
										</div>
									</div>
									<div v-else class="photoBox">
										<img :src="art.imgurl"/>
									</div>
								</div>
								<div class="wblock wblock-art">
									<div class="wlTitle" v-text="art.title"></div>
									<p class="wlText" v-cloak>{{art.desc}}<a :href="art.url">查看更多</a></p>
									<em></em>
								</div>
							</li>
						</ul>
					</div>
					<div class="welVideo">
						<div class="title-box2">
							<h2 class="title" v-text="block3.title"></h2>
							<p class="subtext" v-text="block3.desc"></p>
						</div>
						<!-- <embed :src="videoPath.mp4" height="450" width="1380"></embed> -->
						<video width="1380" height="450" controls>
						    <source :src="videoPath.mp4" type="video/mp4">
						    <source :src="videoPath.ogg" type="video/ogg">
						    <source :src="videoPath.webm" type="video/webm">
						    您的浏览器不支持video标签，请使用最新版本
						    <object :data="videoPath.mp4" width="1380" height="450">
						        <embed src="videoPath.mp4" width="1380" height="450">
						    </object> 
						</video>
					</div>
					<div class="welHonor">
						<div class="title-box2">
							<h2 class="title">荣誉见证</h2>
						</div>
						<ul class="honorMenu">
							<li class="honorlist" v-for="honor in honorList">
								<p class="honor-year"><i class="icon icon-circle"></i>{{honor.year}}</p>
								<ul class="clearfix">
									<li v-for="hitem in honor.list">
										<p><i class="icon icon-cup"></i>{{hitem.title}}</p>
										<span><i>------</i>{{hitem.dept}}</span>
									</li>
								</ul>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<footer id="footer" data-url='${staticPath}/static/yq/layout/footer.html'></footer>
		</div>
		<script src="${staticPath}/static/yq/js/lib/jquery.min.js"></script>
<!-- 		<script src="./js/lib/vue.min.js"></script> -->
<!-- 		<script src="./js/common/public.js"></script> -->
    	<script type="text/javascript" src="${staticPath}/static/yq/js/lib/vue.min.js"></script>
    	<script type="text/javascript" src="${staticPath}/static/yq/js/common/public.js"></script>
		<script>
			var app=new Vue({
				el:'#indexWrapper',
				data:{
					bannerImg:'${staticPath}/static/yq/imgs/index-banner.jpg',
					banSlogan:'${list[0].title}',
					subSlogan:['${list[0].text1}'],
					areaList:[
						{
							text:'区域一'
						}
					],
					welData:{
						lead:'${list[1].text1}',
						desc:'${list[1].text2}',
						end:'${list[1].text3}',
						imgurl:'${staticPath}/static/yq/imgs/index-01.jpg'
					},
					block2:{
						lead:'转为深度思考而设计',
						title:'公司动态'
					},
					block3:{
						title:'宣传视频',
						desc:'视频简短介绍文字'
					},
					welList:[
						{
							title:'${list[2].title}',
							desc:'${list[2].text1}',
							url:'#',
							imgurl:'${staticPath}/static/yq/imgs/index-02.jpg'
						},
						{
							title:'${list[3].title}',
							desc:'${list[3].text1}',
							url:'#',
							imgurl:'${staticPath}/static/yq/imgs/index-03.jpg'
						},
						{
							title:'${list[4].title}',
							desc:'${list[4].text1}',
							url:'#',
							imgurl:'${staticPath}/static/yq/imgs/index-04.jpg'
						},
						{
							title:'${list[5].title}',
							desc:'${list[5].text1}',
							url:'#',
							imgurl:'${staticPath}/static/yq/imgs/index-05.jpg'
						},
						{
							title:'${list[6].title}',
							desc:'${list[6].text1}',
							url:'#',
							imgurl:'${staticPath}/static/yq/imgs/index-06.jpg'
						}
					],
					videoPath:{
						mp4:'${staticPath}/static/yq/video/1.mp4',
						ogg:'${staticPath}/static/yq/video/1.ogg',
						webm:'${staticPath}/static/yq/video/1.webm'
					},
					honorList:[
						{
							year:'2017',
							list:[
							{
								title:'杭州市"市级众创空间"',
								dept:'杭州科学技术委员会'
							},
							{
								title:'浙江省“省级众创空间”',
								dept:'浙江省科学技术厅'
							},
							{
								title:'杭州市“两创”示范活动券认定机构',
								dept:'杭州市科技创新企业服务中心'
							},
							{
								title:'杭州市“现代服务业先进企业”',
								dept:'中共杭州市委、杭州市人民政府'
							},
							{
								title:'省级优秀众创空间',
								dept:'浙江省科学技术厅'
							},
							]
						},
						{
							year:'2016',
							list:[
							{
								title:'学会协同创新服务基地',
								dept:'杭州市人才工作领导小组、市科委、市财政、市科协联合授牌'
							},
							{
								title:'十佳创业服务机构',
								dept:'杭州市人力资源和社会保障局'
							},
							{
								title:'十佳创业服务机构金芒奖',
								dept:'杭州市科学技术委员会 杭州文化广播电视集团'
							},
							{
								title:'易启计划共同行动伙伴',
								dept:'网易公司'
							},
							{
								title:'西溪街道创新创业服务基地',
								dept:'西溪街道党工委、西溪街道办事处'
							},
							{
								title:'房地产资产管理生态链综合服务商',
								dept:'第一财经 中国房地产金融'
							},
							]
						},
						{
							year:'2015',
							list:[
							{
								title:'杭州市众创空间联盟副理事长单位',
								dept:'杭州众创空间联盟'
							},
							{
								title:'现代服务业先进企业',
								dept:'中共杭州市委、杭州市人民政府'
							},
							{
								title:'杭州市十佳公益创业活动场地',
								dept:'杭州市人力资源和社会保障局'
							},
							{
								title:'杭州十大孵化器',
								dept:'浙商大会组委会、浙商杂志社'
							}
							]
						},
						{
							year:'2014',
							list:[
							{
								title:'浙江省首批“国家级众创空间”',
								dept:'中华人民共和国科学技术部'
							},
							{
								title:'浙江省首批“省级众创空间”',
								dept:'浙江省科学技术厅'
							},
							{
								title:'杭州市首批“市级众创空间”',
								dept:'杭州市科学技术委员会'
							}
							]
						}
					]
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
					},
					checkplace(){
						console.log('a')
						//do something
					}
				}
			})
		</script>
	</body>
</html>
