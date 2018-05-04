<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>首页</title>
		<link rel="stylesheet" type="text/css" href="${path }/static/yq/css/main.css"/>
	</head>
	<body>
		<div id="indexWrapper" class="index-bg">
			<div class="index-banner">
			<%@include file="layout/header.jsp" %>
				
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
						    <source :src="videoPath.mp4" type="${path }/static/yq/video/mp4">
						    <source :src="videoPath.ogg" type="${path }/static/yq/video/ogg">
						    <source :src="videoPath.webm" type="${path }/static/yq/video/webm">
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
			<%@include file="layout/footer.jsp" %>
		</div>
		<script src="${path }/static/yq/js/lib/jquery.min.js"></script>
		<script src="${path }/static/yq/js/lib/vue.min.js"></script>
		<script src="${path }/static/yq/js/common/public.js"></script>
		<script>
			var app=new Vue({
				el:'#indexWrapper',
				data:{
					bannerImg:'${path }/static/yq/imgs/index-banner.jpg',
					banSlogan:'因情景而始，借时代之势而起',
					subSlogan:['唯 "创" 以致远','孵化梦想 为创业者连接一切资源'],
					areaList:[
						{
							text:'区域一'
						}
					],
					welData:{
						lead:'还记得你的创业初衷吗？',
						desc:'创立方是浙江省领先的办公空间及创业服务供应商，拥有杭州规模最大的众创空间群落。我们选择一系列城市存量项目合理利用，延续城市记忆情怀、提升建筑使用功能、优化商业办公环境，并导入产业资源并构建完善产业生态圈。我们为每一家入驻企业配备运营的团队提供服务，大到公司战略资源对接、金融投资。小到工商注册、办公文具购置的一切企业大小事务，都有运营团队为你解决，你只需专注你的工作即可。',
						end:'创立方，创未来！',
						imgurl:'${path }/static/yq/imgs/index-01.jpg'
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
							title:'共荣同享 共创未来 上虞号·创立方聚智会成功举办',
							desc:'10月14号，滨江（杭州）上虞号聚智会在浙江省团校内188创业茶楼成功举办，本次论坛以“虞商智力还乡”为主题，在上虞人民政府的高度重视与全方位的支持下，由浙江省团校（浙江青年创业学院）、杭州市上虞商会主办，上虞经济... ...',
							url:'#',
							imgurl:'${path }/static/yq/imgs/index-02.jpg'
						},
						{
							title:'入驻省级众创空间是一种怎样的体验？',
							desc:'创立方自成立以来，在政府相关部门及社会各界关怀和鼓励下一路高歌猛进，在继2017年杭州市级众创空间的成功获评后，此次再次获评省级众创空间是对于创立方以“助力创新企业，创造更大价值”为使命莫大的肯定... ...',
							url:'#',
							imgurl:'${path }/static/yq/imgs/index-03.jpg'
						},
						{
							title:'嬛嬛，你还记得白马湖畔的四郎吗？',
							desc:'今日，创立方与杭州白马湖生态创意城管委会在孔家里举行战略签约仪式，正式签订《白马湖孔家里“网络文化村”战略合作协议》。创立方董事长洪根强、董事总经理倪建水、杭州白马湖生态创意城管委会党工委委员、管委会副主任吴志清等相... ...',
							url:'#',
							imgurl:'${path }/static/yq/imgs/index-04.jpg'
						},
						{
							title:'创立方荣膺杭州市“现代服务业先进企业”称号',
							desc:'日前，杭州市委办公厅和杭州市政府办公厅联合下发了“关于表彰杭州市科技创新突出贡献企业(单位)及优秀经营者(个人)的通报”，对2016年度在推进经济转型升级、创新发展中作出突出贡献的先进单位和个人进行通报表... ...',
							url:'#',
							imgurl:'${path }/static/yq/imgs/index-05.jpg'
						},
						{
							title:'创立方与上虞经济开发区达成合作 旨在打造“双创”大发展新引擎',
							desc:'今天上午，上虞经济开发区与创立方办公空间正式签订合作协议。双方将依托创立方融资、人才、服务、管理、运营等方面的突出能力，以“服务上虞智力引入、促进上虞产业发展、振兴上虞实体经济”为目标，将“上虞号”打造成为... ...',
							url:'#',
							imgurl:'${path }/static/yq/imgs/index-06.jpg'
						}
					],
					videoPath:{
						mp4:'${path }/static/yq/video/1.mp4',
						ogg:'${path }/static/yq/video/1.ogg',
						webm:'${path }/static/yq/video/1.webm'
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