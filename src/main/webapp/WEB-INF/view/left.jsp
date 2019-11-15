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
		<script type="text/javascript">
			$(function(){
				$('.menuson li').click(function(){
					var a = $(this).find('a');
					var title = a.html();
					var src = a.attr('src');
					var icon = a.attr('icon');
					addTab(title,src,icon);
				});
			});
			
			function addTab(title,src,icon){
				//获取选项卡对象
				var t = $('#tt');
				if(t.tabs('exists',title)){
					t.tabs('select',title);
				}else{	
					//新增一个选项卡
					t.tabs('add',{
						title:title,
						closable:true,
						selected:true,
						iconCls:icon,
						content:'<iframe src="'+src+'" scrolling="no" frameborder="0" style="width: 100%;height: 99%;"></iframe>'
					});
				}
			}
			
			function activeMenu(title){
				//移除选中的样式				
				$('.menuson li.active').removeClass('active');
				//获取所有的li
				$('.menuson').each(function(i,ul){
					var lis = $(this).find('li');
					$.each(lis, function(j,li) {
						var html = $(this).find('a').html();
						if(html==title){
							//获取分类的面板
							$('#ea').accordion('select',i);
							//添加样式
							$(this).addClass('active');
							return false;
						}
					});
				})
				
			}
			
		</script>
		
		<div class="lefttop">
			<span></span>系统菜单
		</div>
		<div id="ea" class="easyui-accordion" data-options="
			fit:false,
			border:false
			">
			<div title="系统模块" data-options="
				 iconCls:'icon-save'
				" style="overflow: auto;padding: 0px;background: #f0f9fd;">
				<ul class="menuson">
					<li>
						<cite></cite>
						<a href="#" src="${ctx }/uc/index.coc" icon="icon-save">用户管理</a>
					</li>
					<li>
						<cite></cite>
						<a href="#" src="${ctx }/mc/index.coc" icon="icon-save">会员信息管理</a>
					</li>
					<li>
						<cite></cite>
						<a href="#">测试功能03</a>
					</li>
				</ul>
			</div>
			<div title="测试菜单2" data-options="
				 iconCls:'icon-man'
				" style="overflow: auto;padding: 0px;background: #f0f9fd;">
				<ul class="menuson">
					<li class="">
						<cite></cite>
						<a href="#">测试功能04</a>
					</li>
					<li>
						<cite></cite>
						<a href="#">测试功能05</a>
					</li>
					<li>
						<cite></cite>
						<a href="#">测试功能06</a>
					</li>
				</ul>
			</div>
		</div>
	</body>
</html>

    