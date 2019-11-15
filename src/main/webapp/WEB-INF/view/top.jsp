<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="inc.jsp" />   
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
	</head>
	<body style="background: url(${ctx }/img/topbg.png) repeat-x;">
		<style type="text/css">
			img#trimg{
				margin-top: -5px;
				margin-right: 5px;
				border:2px solid #fff;
				border-radius: 30px;
				width: 30px;height: 30px;
				cursor: pointer;
			}
			img#trimg:hover{
				border: 2px solid red;
			}
		</style>
		<script type="text/javascript">
			function loginOut(){
				$.messager.confirm('系统警告','是否真的要退出系统?',function(r){
					if(r){
						$.ajax({
							type:'get',
							url:'${ctx}/sc/loginOut.coc',
							success:function(){
								//页面重定向
								window.location.href = "${ctx}/login.jsp";
							}
						});
					}
				});
			}
		</script>
		<div class="topleft">
			<a href="#">
				<span style="float: letf;margin-top: -5px;">
					<img src="${ctx }/img/logo-big.png" style="width: 50px;height: 50px;" />
				</span>
				<span style="float:right;font-size: 18px;
					color: #fff;margin-top: -42px;margin-right:28px ;">
					商会管理系统
				</span>
			</a>
		</div>
		<ul class="nav">
			<li>
				<a href="#" class="selected01">
					<img src="${ctx }/img/ico01.png" />
					<h2>系统首页</h2>
				</a>
			</li>
			<li>
				<a href="#">
					<img src="${ctx }/img/ico02.png" />
					<h2>工作台</h2>
				</a>
			</li>
			<li>
				<a href="#">
					<img src="${ctx }/img/ico03.png" />
					<h2>数据报表</h2>
				</a>
			</li>
		</ul>	
		<div class="topright">
			<ul>
				<li>
					<span><a href="#">帮助</a></span>
				</li>
				<li>
					<span><a href="#" onclick="loginOut()">退出系统</a></span>
				</li>
				<li>
					<span>
						<img src="${ctx }/img/i07.png" 
							id="trimg"/>
						<a href="#">${loginMem.name }</a>
					</span>
				</li>
			</ul>
		</div>
	</body>
</html>

    