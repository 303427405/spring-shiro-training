<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/commons/common.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>主页</title>

</head>
<body>
    <div class="layui-layout layui-layout-admin">
        <div class="layui-header">
            <div class="layui-logo" style="font-size: 25px;width: 360px"><img alt="" style="height: 35px;width: 100px;"  src="${path}/static/image/1.jpg"/> 创立方后台管理系统</div>
            <ul class="layui-nav layui-layout-right">
                <li class="layui-nav-item">
                    <a href="javascript:;">
                        ${userName}
                    </a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" onclick="edit(${11111})">修改密码</a></dd>
                        <dd><a href="javascript:;" onclick="loginOut()">注销</a></dd>
                    </dl>
                </li>
                <%--<li class="layui-nav-item"><a href="">退了</a></li>--%>
            </ul>
        </div>



        <div class="layui-side layui-bg-black">
            <div class="layui-side-scroll">
                <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
                <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                    <li class="layui-nav-item layui-nav-itemed">
                        <a class="" href="javascript:;">创立方后台</a>
                        <dl class="layui-nav-child menu">
                            <dd><a href="javascript:;" data-href="${staticPath}/contactUs/list">联系我们</a></dd>
                            <dd><a href="javascript:;" data-href="${staticPath}/talentIdea/list">人才理念</a></dd>
                            <dd><a href="javascript:;" data-href="${staticPath}/recruit/list">招聘模块</a></dd>
<<<<<<< HEAD
                            <dd><a href="javascript:;" data-href="${staticPath}/information/informationList">新闻资讯</a></dd>
=======
                            <dd><a href="javascript:;" data-href="${staticPath}/spacePlan/list">空间计划</a></dd>
                            <dd><a href="javascript:;" data-href="${staticPath}/enterprise/list">企业服务</a></dd>
                            <dd><a href="javascript:;" data-href="${staticPath}/enterprise/list1">文件上传</a></dd>
>>>>>>> branch 'master' of https://github.com/303427405/spring-shiro-training.git
                        </dl>
                    </li>
                </ul>
            </div>
        </div>
        <div class="layui-body">
            <iframe width="100%" height="100%" src="" id="main_iframe"></iframe>
        </div>

        <div class="layui-footer">
            <!-- 底部固定区域 -->
            © layui.com - 底部固定区域
        </div>
    </div>

    <!--[if lte IE 7]>
    <div id="ie6-warning"><p>您正在使用 低版本浏览器，在本页面可能会导致部分功能无法使用。建议您升级到 <a href="http://www.microsoft.com/china/windows/internet-explorer/" target="_blank">Internet Explorer 8</a> 或以下浏览器：
    <a href="http://www.mozillaonline.com/" target="_blank">Firefox</a> / <a href="http://www.google.com/chrome/?hl=zh-CN" target="_blank">Chrome</a> / <a href="http://www.apple.com.cn/safari/" target="_blank">Safari</a> / <a href="http://www.operachina.com/" target="_blank">Opera</a></p></div>
    <![endif]-->
     <p>hello word</p>
    <style>
        /*ie6提示*/
        #ie6-warning{width:100%;position:absolute;top:0;left:0;background:#fae692;padding:5px 0;font-size:12px}
        #ie6-warning p{width:960px;margin:0 auto;}
    </style>
</body>
<script>
    layui.use('element', function(){
        var element = layui.element;
    });
    $(".menu dd a").bind("click",function () {
        window.document.getElementById("main_iframe").src=$(this).attr("data-href");
    });

    //修改密码
    function edit(id) {
        $(".popup").show();
        layer.open({
            shade:0,
            title:'修改密码',
            type: 2,
            area: ['500px', '330px'],
            content:  window.basePath+"/toEditPwd?id="+id,
            end: function () {
                $(".popup").hide();
            }
        });
    }
    //注销
    function loginOut() {
        $(".popup").show();
        layer.confirm('确认退出登录吗？', {
            shade: 0,
            area : ['auto','auto'],
            btn: ['确定','取消'] //按钮
        }, function(){
            $.ajax({
                url: window.basePath+"/loginOut",
                data:{},
                dataType:"JSON",
                type:"POST",
                success: function (d) {
                    if(d.code == '000000') {
                        layer.msg(d.msg, {time:2000});
                        setTimeout(function() {
                            window.location.href = window.basePath+"/login";
                        }, 500)
                    } else{
                        layer.msg(d.msg, {time:2000});
                    }
                }
            });
        }, function(){
            $(".popup").hide();
            layer.close();
        });
    }
</script>

</html>