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
	</head>
	<body>
		<style type="text/css">
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
		<script type="text/javascript">
			function confirmAcc(){
				var ln = $('#loginName');
				if(ln.textbox('isValid')){
					//获取输入框的内容
					var loginName = ln.textbox('getValue');
					//加载进度条
					progressLoad();
					$.ajax({
						type:'get',
						url:'${ctx}/sc/sendEmail.coc?loginName='+loginName,
						dataType:'json',
						success:function(r){
							$.messager.alert('系统提示',r.msg,'info');
							if(r.is){
								$("#tip").show();
								$("#timeSet").show();
								$("#email").html(r.obj.email);
								//定时器，多少秒关闭
								timeSet();
							}
							//关闭进度条
							progressClose();
						}
					});
				}
			}
			function timeSet(){
				var i = 10;
				var si = setInterval(function(){
					$("#time").html(i);
					i--;
					if(i==0){
						clearInterval(si);
						parent.$.modalDialog.handler.dialog('close');
					}
				},1000);
			}
			function closeNow(){
				parent.$.modalDialog.handler.dialog('close');
			}
		</script>
		<div style="text-align: center;margin: 50px 10px;">
			<table id="formTb">
				<tr>
					<td width="33%">&nbsp;</td>
    				<td align="left" valign="middle">
    					<img src="img/logo-big.png" style="width: 80px;height: 80px;float: left;" />
    					<font style="font-size: 28px;vertical-align: bottom;float: left;padding-top: 20px;font-weight: bold;">
    						商会后台管理系统
    						<font style="color: #afc5d2;font-size: 18px;">忘记密码</font>
    					</font>
    				</td> 
    			</tr>
    			<tr>
    				<td colspan="2">
    					登录名&nbsp;:&nbsp;<input class="easyui-textbox" id="loginName"
    						data-options="
    							required:true,
    							iconCls:'icon-man',
    							width:250,
    							height:30
    						" />
    				</td>
    			</tr>
    			<tr>
    				<td align="center" colspan="2">
    					<a class="easyui-linkbutton" onclick="confirmAcc()"
    					data-options="iconCls:'icon-ok',width:80,height:30">确定</a>
    				</td>
    			</tr>
    		</table>
		</div>
		<div style="text-align: center;margin-top: 20px;display: none;" id="tip">
			<span>
				修改密码的邮件已经发送到<span style="font-size:20px;font-weight: bold;" id="email">383391403@qq.com</span>中，注意查收。链接有效时间为
				<font style="font-size:24px;color: red;">20</font>
				分钟
			</span>
		</div>	
		<div  style="text-align: center;margin-top: 20px;display: none;" id="timeSet">
			<span>
				此窗口将在<font style="font-size:24px;color: red;" id="time">5</font>秒后自动关闭，
				<a href="#" style="text-decoration: none;" onclick="closeNow()">马上关闭</a>
			</span>
		</div>
	</body>
</html>
