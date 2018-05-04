<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>ä¼ä¸æå¡</title>
		<link rel="stylesheet" type="text/css" href="./css/main.css"/>
	</head>
	<body>
		<div id="wrapper" class="index-bg">
			<header id="header" class="header" data-url='./layout/header.html'></header>
			<div class="content">
				<div class="officeService service">
					<div class="title-box3">
						<h2 class="title" v-text="block1.title"></h2>
						<div class="subtext" v-text="block1.subtext"></div>
					</div>
					<div class="basicService">
						<div class="centerblock">
							<div class="title" v-text="block1.subtitle1"></div>
						</div>
						<div class="service-box">
							<div class="service-item" v-for="item in basicList">
								<i class="icon" :class="item.iconClass"></i>
								<p class="text-center" v-text="item.text"></p>
							</div>
						</div>
					</div>
					<div class="advService">
						<div class="title-box3">
							<h3 class="subtitle" v-text="block1.subtitle2"></h3>
						</div>
						<div class="clearfix">
							<div class="contPhoto">
								<img :src="block1.subPic">
							</div>
							<div class="contAdv">
								<ul>
									<li v-for="item in deviceList">
										<div class="advLeft"><strong v-text="item.title"></strong></div>
										<div class="advRight"><p v-text="item.desc"></p></div>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="creService service">
					<div class="title-box3">
						<h2 class="title" v-text="block2.title"></h2>
					</div>
					<div class="basicService">
						<div class="centerblock">
							<div class="title" v-text="block2.subtitle1"></div>
						</div>
						<div class="service-box">
							<div class="service-item" v-for="item in increList">
								<i class="icon" :class="item.iconClass"></i>
								<p class="text-center" v-text="item.text"></p>
							</div>
						</div>
					</div>
					<div class="advService">
						<div class="title-box3">
							<h3 class="subtitle" v-text="block2.subtitle2"></h3>
						</div>
						<div class="clearfix">
							<div class="contPhoto">
								<img :src="block2.subPic">
							</div>
							<div class="contAdv">
								<ul>
									<li v-for="item in otherIncreList">
										<div class="advLeft"><strong v-text="item.title"></strong></div>
										<div class="advRight"><p v-html="item.desc"></p></div>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="proExhibit story odd-bg">
				<div class="proConst content clearfix">
					<div class="coreContent">
						<p class="storyTitle" v-text='block3.title'></p>
						<p class="storysubTitle" v-text='block3.subtitle'></p>
						<p class="serCont" v-html="block3.desc"></p>
					</div>
					<div class="contAdv">
						<ul>
							<li v-for="item in proList">
								<div class="advLeft"><strong v-text="item.title"></strong></div>
								<div class="advRight"><p v-text="item.desc"></p></div>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="content">
				<div class="service">
					<div class="title-box3">
						<h2 class="title" v-text="block4.title"></h2>
						<div class="subtext" v-text="block4.subtext"></div>
					</div>
					<div class="basicService">
						<div class="centerblock" v-if="docList.length<1">
							<p>ææ å¯ä¾ä¸è½½çæä»¶</p>
						</div>
						<div class="service-box">
							<div class="docbox" v-for="item in docList">
								<span>{{item.title}}</span><a :href="item.uri">ä¸è½½</a>
							</div>
						</div>
					</div>
				</div>
				<div class="service">
					<div class="title-box3">
						<h2 class="title" v-text="block5.title"></h2>
					</div>
					<div class="problems clearfix">
						<div class="problem" v-for="item in problemList">
							<div class="title">{{item.title}}</div>
							<p class="desc">{{item.desc}}</p>
						</div>
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
					block1:{
						title:'åå¬æå¡',
						subtext:'æ¨åªéä¸æ³¨äºåå±èªå·±çä¸å¡ï¼å¶ä»çäº¤ç»åç«æ¹',
						subtitle1:'8å¤§åºç¡æå¡',
						subtitle2:'ä¼è´¨è®¾æ½',
						subPic:'./imgs/ser-01.jpg'
					},
					basicList:[
						{
							text:'ä¸ªæ§ç©ºé´å®å¶',
							iconClass:'icon-cube',
						},
						{
							text:'ä¼ä¸æ³¨åå¯¹æ¥',
							iconClass:'icon-qi',
						},
						{
							text:'åºç¡è¡æ¿ä»£ç®¡',
							iconClass:'icon-squ',
						},
						{
							text:'å¬å±åºå°é¢å®',
							iconClass:'icon-loc',
						},
						{
							text:'æå°åè®¾å¤ç§èµ',
							iconClass:'icon-printer',
						},
						{
							text:'åå¬éè´­',
							iconClass:'icon-cart',
						},
						{
							text:'ç©ä¸æå¡',
							iconClass:'icon-world',
						},
						{
							text:'ç¬¬ä¸æ¹åºç¡æå¡æ¥å¥',
							iconClass:'icon-bind',
						}
					],
					deviceList:[
						{
							title:'é«éç½ç»',
							desc:'ææåå¬åºååéç¨ç½çº¿åWi-Fiè¿æ¥ã'
						},
						{
							title:'å¬å±åºå',
							desc:'ä¸ä¸è®¾è®¡å¢éç²¾å¿æé ï¼ä¾æ®å¥é©»ä¼ä¸åºç¨åºæ¯ä¸äº§ä¸å®ä½ï¼ç»ç­¹å¸å±ååè½åºåï¼å®å¶å­åºå¬å±åºåéå¥ï¼æé å±äº«æå¡å¹³å°ï¼ä¸ºä¼ä¸æä¾å®ç¾çç¤¾äº¤åºæã'
						},
						{
							title:'æå°è®¾å¤',
							desc:'åå­åºåéæè³å°ä¸å°é«éç½®æå°æºãå¤å°æºãæ«æä»ªç­æå°è®¾å¤ã'
						},
						{
							title:'åå¡é¥®å',
							desc:'åå­åºéå¤åä¸åå¡åï¼æ¿æ¥ä¸¾ååç±»åä¸äº¤æµæ´»å¨ï¼ä¸ºä¼ä¸æä¾äº¤æµçå¹³å°ï¼ä¸ºéå¹´åä¸èæå¼ç²¾ç¥åæ ã'
						},
						{
							title:'å·¥ä½å¢é',
							desc:'ä¸ä¸çè¿è¥å¢éä¸ºä¼ä¸æä¾å¨æ¹ä½çå¸®å©ï¼ç»´æ¤æ¯æ¥å·¥ä½çé«æè¿è½¬ï¼å»ºç«ä¸åå¢éçèµæºäºæ¢ï¼è®©åæ°ä¸åæå±éã'
						}
					],
					block2:{
						title:'åä¸æå¡',
						subtitle1:'9å¤§å¢å¼æå¡',
						subtitle2:'ç¸å³æå¡',
						subPic:'./imgs/ser-01.jpg'
					},
					increList:[
						{
							text:'äººæç´éè½¦',
							iconClass:'icon-c05',
						},
						{
							text:'èèµç´éè½¦',
							iconClass:'icon-c06',
						},
						{
							text:'æ¿åºç´éè½¦',
							iconClass:'icon-c09',
						},
						{
							text:'åè¾ç´éè½¦',
							iconClass:'icon-c02',
						},
						{
							text:'ç åç´éè½¦',
							iconClass:'icon-c07',
						},
						{
							text:'å±å®ç´éè½¦',
							iconClass:'icon-c08',
						},
						{
							text:'åªä½ç´éè½¦',
							iconClass:'icon-c04',
						},
						{
							text:'æ³å¡ç´éè½¦',
							iconClass:'icon-c03',
						},
						{
							text:'è´¢å¡ç´éè½¦',
							iconClass:'icon-c01',
						},
					],
					otherIncreList:[
						{
							title:'æ¿åºæ¶ææ¿ç­å¨è¯¢ä¸ç³æ¥',
							desc:'<p>è¿è¥ä¸­å¿ä¸ºå­åºä¼ä¸æä¾åè´¹æ¿åºæ¶ææ¿ç­å¨è¯¢ä¸ç³æ¥æå¡ãåé¡¹å·ä½åå®¹ä»¥è¿è¥ä¸­å¿å¬åä¸ºåã</p>'
						},
						{
							title:'å¬å±åºå',
							desc:'<p>è¿è¥ä¸­å¿ä¸ºå­åºä¼ä¸æä¾åè´¹åæå¿ä¸¤ç§æ³å¾å¨è¯¢æå¡ãå¶ä¸­åè´¹æå¡ä¸ºåç«æ¹èªæçæ³å¾é¡¾é®ï¼æå¿æå¡ä¸ºè¿è¥ä¸­å¿éè¿ä¸ä¸ä¸å¾å¸äºå¡æåä½ãåæ¶ï¼éè¿å®æä¸¾åç°åºå¨è¯¢æ´»å¨çæ¹å¼ä¸ºå­åºä¼ä¸æä¾æä¾åè´¹çæ³å¾å¨è¯¢æå¡ã</p>'
						},
						{
							title:'æèèµæå¡',
							desc:'<p>å­åºä¸ä¼å¤é£é©æèµæºæï¼é¶è¡éèæºæï¼å°é¢è´·æ¬¾å¬å¸ï¼æä¿å¬å¸ç­å»ºç«èµ·å¯åçåä½å³ç³»ï¼åè´¹å¸®å©å¥é©»ä¼ä¸åæèµæºææ¨èé¡¹ç®ï¼å¯¹æ¥é¶è¡ãå°é¢è´·æ¬¾å¬å¸ç­éèæºæï¼è§£å³å¶èµéé¾é¢ãæèèµéæ±çå­åºä¼ä¸å¯å¨è¿è¥ä¸­å¿ç»è®°ç¸å³éæ±ï¼æ­¤é¡¹æå¡ä¸ºåè´¹æå¡ã</p><p style="color:#e59800">æèèµéæ±çå­åºä¼ä¸å¯å¨è¿è¥ä¸­å¿ç»è®°ç¸å³éæ±ï¼æ­¤é¡¹æå¡ä¸ºåè´¹æå¡ã</p>'
						}
					],
					block3:{
						title:'äº§åå±å',
						subtitle:'äº¤æµãå­¦ä¹ ãä¸èµ·æé¿',
						desc:'æé æå½å±æçç¤¾ç¾¤ï¼ä¾æå­åºç¹è²ç¤¾ç¾¤ï¼ç»ç»ä¼ä¸å¼å±ä¸°å¯å¤å½©çä¸»é¢æ´»å¨ï¼å¦æ¯æåä¸å¹è®­ãè§å½±ä¼ãå¡çæ¡æ¸¸ãè¯»ä¹¦ä¼ãè¶£å³è¿å¨ä¼ç­ï¼ä¸°å¯ä¼ä¸çæ´»ï¼å¢å¼ºä¼ä¸åèåã'
					},
					proList:[
						{
							title:'åä¸å æ²¹ç«',
							desc:'ç±âåç«æ¹åå¬ç©ºé´âç»ç»åèµ·çå¬çæ´»å¨ãåä¸ºåä¸è¯¾ç¨ä¸åä¸åäº«ä¸¤ä¸ªç¯èç»æï¼æå¨ä¸ºåä¸èâå æ²¹åçµâï¼ä¸ºåä¸èâå æ²¹ææ°âã'
						},
						{
							title:'CEOåæ¡ä¼',
							desc:'è¿æ¯ä¸é¨ä¸ºCEOè§£å³ä¼ä¸é®é¢èççæ´»å¨å¤´èåæç»´é´è¹¦è·³çç«è±å¸¦ç»å¥é©»ä¼ä¸ä¸ä¸æ ·çæå'
						},
						{
							title:'ç¼äººæäºé¸èµ',
							desc:'å¨è¿ä¸ªéåç¤¾äº¤é»è¾æ¨çæ²éè¡¨è¾¾ç­åç§åè½æ¸¸æä¸­ï¼æ²¡æç¹æçå§æï¼æ²¡æå®å¤§çä¸çè§ï¼åªæç¼äººãå¹³æ°ãç¥æ°ä¹é´çãç±æ¨çº èãï¼åªè¦ä½ æ¥ç©ï¼ä¿è¯å¤ç§èï¼å¤è¿ç¾ï¼'
						},
						{
							title:'ä¸»é¢æ´»å¨',
							desc:'æ ¹æ®ä¸åå­£èãä¸åèæ¥ä¸å®æ¶åèµ·åç±»ç²¾å½©ä¸»é¢æ´»å¨ã'
						}
					],
					block4:{
						title:"ä¸è½½ä¸­å¿",
						subtext:'æ¨åªéä¸æ³¨äºåå±èªå·±çä¸å¡ï¼å¶ä»çäº¤ç»åç«æ¹'
					},
					docList:[
						{
							uri:'./video/çé®.docx',
							title:'çé®.docx'
						},
						{
							uri:'./video/çé®.docx',
							title:'çé®.docx'
						},
						{
							uri:'./video/çé®.docx',
							title:'çé®.docx'
						},
						{
							uri:'./video/çé®.docx',
							title:'çé®.docx'
						},
						{
							uri:'./video/çé®.docx',
							title:'çé®.docx'
						},
						{
							uri:'./video/çé®.docx',
							title:'çé®.docx'
						},
						{
							uri:'./video/çé®.docx',
							title:'çé®.docx'
						},
						{
							uri:'./video/çé®.docx',
							title:'çé®.docx'
						},
						{
							uri:'./video/çé®.docx',
							title:'çé®.docx'
						},
					],
					block5:{
						title:"å¸¸è§é®é¢"
					},
					problemList:[
						{
							title:'ä¼ä¸è½äº«ååªäºæ¿ç­åæ¬åä¸æ¯ææ¹é¢ãè¡¥å©æ¹é¢ä»¥åå¶ä»ä¸äºæ¶ææ¿ç­ï¼',
							desc:'é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹'
						},
						{
							title:'å­åºæ¯å¦è½å¤æ¥ååç»ç»å³ç³»æé ï¼',
							desc:'é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹'
						},
						{
							title:'å­åºæåªäºç¬¬ä¸æ¹æä¾æå¡å¦ä½æ¶è´¹ï¼',
							desc:'é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹'
						},
						{
							title:'å­åºæ¯å¦ä¼ç»ç»ä¸äºå¥é©»ä¼ä¸ä¹é´çäº¤æµæ´»å¨æèé«ç®¡ä¹é´çä¸å¡äº¤æµæ´»å¨ï¼',
							desc:'é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹'
						},
						{
							title:'å­åºæ¯å¦ä¼ä¸¾åä¸äºå¯¹ä¼ä¸æ¯è¾ææä¹çå¹è®­ãåäº«ãäº¤æµä¼ç­ï¼',
							desc:'é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹'
						},
						{
							title:'å­åºè½å¦æä¾æ³¨åå°åæèä»£çä»£åå·¥åæ³¨åï¼',
							desc:'é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹é®é¢åå®¹'
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
