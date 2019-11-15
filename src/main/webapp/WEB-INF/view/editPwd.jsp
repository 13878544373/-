<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />
<jsp:include page="inc.jsp" /> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<style type="text/css">
		    body{
		    	text-align: center;
		    }
			#formTb{
				border-collapse: collapse;
				width: 100%;
			}
			#formTb tr{
				padding: 5px;
				
			}
			#formTb td{
				padding: 5px;
				padding-top: 10px;
			}
			#formTb tr:first-child{
				border-bottom: 2px solid #d4d4d4;
			}
		</style>
	</head>
	<body>
		<script type="text/javascript">
			function timeSet(){
				var i = 10;
				var si = setInterval(function(){
					$("#time").html(i);
					i--;
					if(i==0){
						clearInterval(si);
						jumpNow();
					}
				},1000);
			}
			function jumpNow(){
				window.location.href="${ctx}/login.jsp";
			}
			function commitPwd(){
				var f = $('#formData');
				if(f.form('validate')){
					$.ajax({
						type:'post',
						url:'${ctx}/mc/editPwd.coc',
						data:f.serialize(),
						dataType:'json',
						success:function(r){
							$.messager.alert('系统提示',r.msg,'info');
							if(r.is){
								$("#timeSet").show();
								timeSet();
							}
						}
					});
				}
				
			}
		</script>
		<div style="text-align: center;margin: 50px 10px;">
			<form id="formData">
				<table id="formTb" align="center">
					<tr>
						
						<td width="33%">&nbsp;</td>
	    				<td align="left" valign="middle">
	    					<img src="${ctx }/img/logo-big.png" style="width: 80px;height: 80px;float: left;" />
	    					<font style="font-size: 28px;vertical-align: bottom;float: left;padding-top: 20px;font-weight: bold;">
	    						商会后台管理系统
	    						<font style="color: #afc5d2;font-size: 18px;">忘记密码</font>
	    					</font>
	    				</td> 
	    			</tr>
	    			<tr>
	    				<td colspan="2" align="center">
	    					<input type="hidden" name="loginName" value="${m.loginName }">
	    					新的密码&nbsp;:&nbsp;<input  type="password" id="pwd" name="password" class="easyui-textbox" data-options="
	    							required:true,
	    							iconCls:'icon-lock',
	    							width:250,
	    							height:30
	    						" />
	    				</td>
	    			</tr>
	    			<tr>
	    				<td colspan="2" align="center">
	    					确认密码&nbsp;:&nbsp;<input validType='eqPwd["#pwd"]' type="password" name="confirmPwd" class="easyui-textbox" data-options="
	    							required:true,
	    							iconCls:'icon-lock',
	    							width:250,
	    							height:30
	    						" />
	    				</td>
	    			</tr>
	    			<tr>
	    				<td align="center" colspan="2">
	    					<a class="easyui-linkbutton" onclick="commitPwd()"
	    						data-options="iconCls:'icon-ok',width:80,height:30">确定</a>
	    				</td>
	    			</tr>
	    		</table>
    		</form>
		</div>
		
		<div  style="text-align: center;margin-top: 20px;display: none;" id="timeSet">
			<span>
				此窗口将在<font style="font-size:24px;color: red;" id="time">5</font>秒后自动跳转到登录页面，
				<a href="#" style="text-decoration: none;" onclick="jumpNow()">马上跳转</a>
			</span>
		</div>
	</body>
</html>
