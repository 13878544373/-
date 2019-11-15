<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="inc.jsp" />   
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title></title>
	</head>
	<body>   
		<div class="easyui-layout" fit=true id="ey">
		    <div data-options="region:'north'" style="height:64px;background: url(${ctx}/img/topbg.png) repeat-x;" 
		    	href="${ctx }/sc/top.coc"></div>   
		    <div data-options="region:'south'" style="height:30px;"></div>   
		    <div data-options="region:'west',href:'${ctx }/sc/left.coc'" 
		    	style="width:202px;"></div>   
		    <div data-options="region:'center'" 
		    	style="padding:0px;background:#eee;border:false" href="${ctx }/sc/center.coc"></div>   
	    </div>
	</body>  
</html>
    