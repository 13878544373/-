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
	<body>
		<div id="tt" class="easyui-tabs" fit=true 
			data-options="
				onSelect:function(title,index){
					if(index>0){
						activeMenu(title);
					}
				},
				border:false,
				tools:'#tool',
				tabHeight:38
			"  style="border-left:0px solid #d4d4d4;">   
		    <div title="首页" style="padding:20px;display:none;">   
		          
		    </div>   
		</div> 
		<div id="tool" style="padding-top: 5px;background-color: #d4d4d4;">
			<a onclick="gotoHome()" title="主页" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-tux'"></a>
			<a onclick="maxMin()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-max'"></a>
			<a onclick="closeAll()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-del'"></a>
		</div>
		<script type="text/javascript">
			//回到首页
			function gotoHome(){
				$('#tt').tabs('select',0);
			}
			//中间页面的最大与最小化
			function maxMin(){
				var p = $('#ey').layout('panel','north').panel('options');//获取一个面板的属性
				if(!p.collapsed){
					$('#ey').layout('collapse','north');//面板折叠
					$('#ey').layout('collapse','south');//面板折叠
					$('#ey').layout('collapse','west');//面板折叠
				}else{
					$('#ey').layout('expand','north')
					.layout('expand','south')
					.layout('expand','west');//面板展开
				}
			}
			//关闭除首页之外的所有选项卡
			function closeAll(){
				//获取所有打开的选项卡
				var tabs = $('#tt').tabs('tabs');
				$.each(tabs,function(i,tab){
					$('.menuson li.active').removeClass('active');
					setTimeout(function(){
						$('#tt').tabs('close',1);
					},10)
					
				});
			}
		</script>
		
	</body>
</html>

    