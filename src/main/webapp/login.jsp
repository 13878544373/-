<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" /> 

		
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>登录界面</title>	<!--基础样式-->
		<script type="text/javascript" src="js/jquery.min.js" ></script>
		<script type="text/javascript" src="${ctx }/js/jquery.min.js" ></script>
		<script type="text/javascript" src="${ctx }/js/jquery.easyui.min.js" ></script>
		<script type="text/javascript" src="${ctx }/js/easyui-lang-zh_CN.js" ></script>
		<script type="text/javascript" src="${ctx }/js/extJquery.js" ></script>
		<script type="text/javascript" src="${ctx }/js/extEasyUI.js" ></script>
		<script type="text/javascript" src="${ctx }/js/jquery-form.js"></script>
		
		<link rel="stylesheet" href="${ctx }/css/themes/bootstrap/easyui.css" />
		<link rel="stylesheet" href="${ctx }/css/themes/icon.css" />
		<link rel="stylesheet" href="css/style.css" />
	</head>
	<body style="background-color: #1c77ac;">
		<script type="text/javascript">
			$(function(){
					$('.loginbox').css({
						'position':'absolute',
						'left':($(window).width()-692)/2
					});
			});
			
			function login(){
				//加载进度条
				progressLoad();
				var f = $('#loginForm');
				$.ajax({
					type:'post',
					url:'${ctx}/sc/toLogin.coc',
					data:f.serialize(),
					dataType:'json',
					success:function(data){
						//判断是否登录成功
						if(data.is){
							//progressClose();
							//窗口重定向
							window.location.href = '${ctx}/sc/index.coc';
						}else{
							//关闭进度条
							progressClose();
							alert(data.msg);
							reloadImg();
						}
					}
				});
				
			}
			//刷新验证码
			function reloadImage(){
				$('#imgCode')[0].src = "${ctx}/ImgCode.jsp?"+new Date().getTime().toString();
			}
			
			//忘记密码
			function forgetPwd(){
				parent.$.modalDialog({
					fit:true,
					title:'忘记密码',
					href:'${ctx}/sc/forgetPwd.coc',
					modal:true
				});
			}
			
		</script>
		<div class="loginbody">
			<div style="width:100%; height:51px; margin-top:65px;text-align: center;">
			</div>
			<form id="loginForm">
				<div class="loginbox">
					<ul>
						<li>
							<input type="text" 
								class="loginuser" name="loginName" value="admin"/>
						</li>
						<li>
							<input type="password" 
								class="loginpwd" name="password" value="123"/>
						</li>
						<li>
							<input type="text" maxlength="4" 
								class="logincode" name="code"/>
							<a href="javascript:void(0)">
								<img id="imgCode" alt="验证码，点击更换" onclick="reloadImage()"
								style="vertical-align: bottom;margin-left: 20px"
								src="ImgCode.jsp" height="43" width="95">
							</a>
						</li>
						<li>
							<input type="button" value="登录"
								class="loginbtn" onclick="login()"/>
						
							<label><a href="#" onclick="forgetPwd()">忘记密码?</a></label>
						
						</li>
						
					</ul>
				</div>
			</form>
		</div>
		
	</body>
</html>
