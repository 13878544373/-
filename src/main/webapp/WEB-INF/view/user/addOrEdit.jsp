<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />
<jsp:include page="../inc.jsp" /> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
   <style type="text/css">
		#formTb{
			border-collapse: collapse;
			width: 100%;
		}
		#formTb tr{
			border-bottom: 1px solid #d4d4d4;
			padding: 5px;
		}
		#formTb td{
			padding: 5px;
		}
		#formTb tr:last-child{
			border:none;
		}
	</style>
	<form id="formData">
   		<table id="formTb">
   			<tr>
   				<td width="100px" align="right">名称:</td>
   				<td>
   					<input name="userName" value="${u.userName }" class="easyui-textbox" data-options="
   						" />
   					<input type="hidden" name="id" value="${u.id }">
   				</td>
   			</tr>
   			<tr>
   				<td width="100px" align="right">登录名:</td>
   				<td>
   					<input name="loginName" value="${u.loginName }" class="easyui-textbox" data-options="
   						
   						" />
   				</td>
   			</tr>
   			<tr>
   				<td width="100px" align="right">密码:</td>
   				<td>
   					<input name="password" value="" class="easyui-textbox" data-options="
   						
   						" />
   				</td>
   			</tr>
   			<tr>
   				<td width="100px" align="right">所属角色:</td>
   				<td>
   					<input id="cc" class="easyui-combobox" name="roleId" value="${u.roleId }"  
						data-options="valueField:'id',textField:'text',url:''" />  
   				</td>
   			</tr>
   			
   		</table>
   	</form>
</body>
</html>