<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>    
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
	<table class="easyui-datagrid" data-options="
		fit:true,
		fitColumns:true
	">   
	    <thead>   
	        <tr>   
	            <th data-options="field:'name',width:200,fixed:false">商会/协会名称</th>   
	            <th data-options="field:'properties',fixed:true">会员性质</th>   
	            <th data-options="field:'work',fixed:true">企业职务</th>   
	            <th data-options="field:'time',fixed:true">加入时间</th>   
	        </tr>   
	    </thead>   
	    
	    <tbody>   
		    <c:forEach items="${list }" var="mp">
		        <tr>   
		            <td>${mp.cocName }</td>
		            <td>${mp.properties }</td>
		            <td>${mp.workName }</td>
		            <td><fmt:formatDate value="${mp.joinTime }" pattern="yyyy-MM-dd"/></td>    
		        </tr>  
		    </c:forEach>  
	    </tbody>   
	</table>
</body>
</html>