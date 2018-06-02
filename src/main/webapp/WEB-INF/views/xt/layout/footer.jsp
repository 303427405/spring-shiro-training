<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<div class="footer clearfix content">
	<div class="footLeft">
		<div class="flTit">全部创立方办公地点<i class="icon icon-tri"></i></div>
		<ul class="clearfix footUl1">
			<li><a href="./goInclf.html">走进创立方</a></li>
			<li><a href="./news.html">新闻动态</a></li>
			<li><a href="./proConstruct.html">产业构建</a></li>
			<li><a href="${path }/enterprise/find">企业服务</a></li>
			<li><a href="${path }/spacePlan/find">空间计划</a></li>
			<li><a href="./jobChance.html">事业机会</a></li>
			<li><a href="./contactUs.html">联系我们</a></li>
		</ul>
		<ul class="clearfix footUl2">
			<li><a href="#">友情链接</a></li>
			<li><a href="#">创头条</a></li>
			<li><a href="#">浙江青年创业学院</a></li>
			<li><a href="#">《接力浙商》杂志</a></li>
		</ul>
	</div>
	<div class="footRight">
		<p>留下你的电邮，获取创立方最新动态！</p>
		<div class="footInput">
			<input type="text" placeholder="电邮*" />
			<button class="btn btn-submit" onclick="sendEmail()">提交</button>
		</div>
	</div>
</div>
<div class="bottomBg">
	<!-- <p>&copy;2018XXX版权所有</p> --><!-- 版权信息 -->
	<!-- <a href="#">备案号</a> --><!-- 网站备案 -->
</div>
<script>
	function sendEmail(){
		console.log('a');
		console.log($('.footInput input').val())
	}
</script>