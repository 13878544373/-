<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />
<jsp:include page="../inc.jsp"></jsp:include>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<style type="text/css">
			div#tb ul{
				list-style: none;
				margin-top: 5px;
				margin-left: 0px;
			}
			div#tb ul li{
				list-style: none;
				float: left;
				width: 60px;
			}
		</style>
		<!-- 450706199912139016 -->
		
	</head>
	<body class="easyui-layout" onkeydown="keydown()" onkeyup="keyup()">   
		<script type="text/javascript">
		    var dg;
		    function keydown(event){
				var e = event||window.event;
				var code = e.keyCode;
				if(code==17){
					dg.datagrid('options').singleSelect=false;
				}else if(code==13){
					//queryData();
				}
			}
			function keyup(event){
				var e = event||window.event;
				var code = e.keyCode;
				if(code==17){
					dg.datagrid('options').singleSelect=true;
				}
			}
			
		    var json = "";
			$(function(){
				
				dg = $('#table').datagrid({
					url:'${ctx}/mc/find.coc',
					fit:true,
					singleSelect:true,
					rownumbers:true,
					pagination:true,
					frozenColumns:[[
						{field:'ck',checkbox:true,width:50},
						{field:'id',title:'编号',width:100,hidden:true},
						{field:'name',title:'名称',width:100,sortable:false},
						{field:'idcard',title:'身份证号码',width:150},
						{field:'xz',title:'会员性质',width:80,align:'center',
							formatter:function(v,r,i){
								var mps = r.mps;
								if(mps!=''&&mps.length>0){
									return '<a href="#" onclick="showPro('+i+')" style="text-decoration:none;color:#fff">已入商会</a>';
								}
								return '未入会';
							},
							styler:function(v,r,i){
								var mps = r.mps;
								if(mps!=''&&mps.length>0){
									return 'background-color:green';
								}
								return 'background-color:#d4d4d4';
							}
						},
						{field:'qyxx',title:'企业信息',width:80,align:'center',
						   formatter:function(v,r,i){
							   var str = '';
							   var mps = r.emps;
							   if(mps!=''&&mps.length>0){
							      str = '<a onclick="addEnterpise('+i+')" href="#" style="text-decoration:none;color:#fff">添加/查看</a>'
							   }else{
								   str = '<a onclick="addEnterpise('+i+')" href="#">添加/查看</a>'
							   }
							   return str;
						   },
						   styler:function(v,r,i){
							   var emps = r.emps;
								if(emps!=''&&emps.length>0){
									return 'background-color:blue';
								}
								return 'background-color:#d4d4d4';
							}	
						
						},
						{field:'grry',title:'个人荣誉',width:80},
						{field:'jl',title:'简历',width:80}
					]],
					columns:[[
						
						{field:'sex',title:'性别',width:50},
						{field:'birthday',title:'出生日期',width:120,
							formatter:function(v,r,i){
								if(v!=undefined){
									v = v.substring(0,10);
								}
								return v;
							}	
						},
						{field:'mobile',title:'手机号码',width:100},
						{field:'address',title:'地址',width:300},
						{field:'at',title:'操作',width:100,align:'center',
							formatter:function(v,r,i){
								v = '';
								v += '<a onclick="editData('+i+')" href="#" style="color:blue;text-decoration:none">编辑<a/>';
								v += '&nbsp;|&nbsp;';
								v += '<a onclick="delData('+i+')" href="#" style="color:red;text-decoration:none">删除<a/>';
								return v;
							},
							styler:function(v,r,i){
								return 'background-color:#d4d4d4'
							}
						}
					]]
				});
				//刷新分页
				setTimeout(function(){dg.datagrid({loadFilter:pagerFilter}).datagrid('loadData')},10);
				
				//取消选择行
				$('#cancelRow').click(function(){
					dg.datagrid('clearSelections');
				});
				
				
				
			});
			function addData(){
				openDiglog('新增的窗口','');
			}
			function editData(index){
				dg.datagrid('selectRow',index);
				var row = dg.datagrid('getSelected');
				openDiglog('编辑的窗口',row);
			}
			function openDiglog(title,row){
				//$('body').append('<div id="d1"></div>');
				//$('#d1').dialog({
				var vals = '';
				var url = '${ctx}/mc/addMember.coc';
				if(row!=''){
					var vals = '?vals='+JSON.stringify(row);
					var url = '${ctx}/mc/edit.coc';
				}
				parent.$.modalDialog({
					title:title,
					href:'${ctx}/mc/aoe.coc'+vals,
					modal:true,
					width:400,
					height:500,
					buttons:[{
						text:'保存',
						iconCls:'icon-save',
						plain:true,
						handler:function(){
							//var f = $('#dataForm');
							var f = parent.$.modalDialog.handler.find('#dataForm');
							if(f.form('validate')){
								var option = {
									type:'post',
									url:url,
									dataType:'json',
									success:function(r){
										alert(r.msg);
										if(r.is){
											//$('#d1').dialog('destroy');//销毁
											parent.$.modalDialog.handler.dialog('close');
											dg.datagrid('reload');//重新加载数据
										}
									}
									
								};
								f.ajaxSubmit(option);//数据提交
							}
						}
					},{
						text:'取消',
						iconCls:'icon-cancel',
						plain:true,
						handler:function(){
							parent.$.modalDialog.handler.dialog('close');
							//$('#d1').dialog('destroy');//销毁
						}
					}]
				});
			}
		    function delData(index){
		    	dg.datagrid('selectRow',index);
				var row = dg.datagrid('getSelected');
				var msg = '<p style="font-weight:bold">是否真的删除该记录？<p>'
				+'<p style="font-size:12px;color:#d4d4d4">数据只做物理删除</p>';
				$.messager.confirm('系统警告',msg,function(r){
					if(r){
						$.ajax({
							type:'get',
							url:'${ctx}/mc/remove/'+row.id+'.coc',
							dataType:'json',
							success:function(r){
								$.messager.alert('系统提示',r.msg,'info');
								if(r.is){
									dg.datagrid('reload');
								}
							}
						});
					}
				})
		    }
		    function batchDel(){
		    	var rows = dg.datagrid('getChecked');
		    	if(rows.length>0){
		    		$.each(rows, function(i,row) {
		    			var ids = new Array();
		    			ids.push(row.id);
		    		});
		    		
		    	}else{
		    		$.messager.alert('系统提示','选择要删除的记录!','info');
		    	}
		    }
		    function showPro(index){
		    	dg.datagrid('selectRow',index);
		    	var row = dg.datagrid('getSelected');
		    	var mps = JSON.stringify(row.mps);
		    	$('#dd').dialog({
		    		title:'<a href="#" style="color:red">'+row.name+'</a>加入的商会/协会',
		    		width:400,
		    		height:300,
		    		href:'${ctx}/mc/showPro.coc?mps='+mps,
		    		modal:true
		    	});
		    	
		    	
		    }
		    
		    function addEnterpise(index){
		    	dg.datagrid('selectRow',index);
		    	var row = dg.datagrid('getSelected');
		    	$('#dd').dialog({
		    		width:400,
		    		height:500,
		    		title:'企业信息',
		    		href:'${ctx}/mc/enterprise.coc?memId='+row.id,
		    		modal:true,
		    		onClose:function(){
		    			dg.datagrid('reload');
		    		}
		    	});
		    }
		</script>
		<div id="dd"></div>
	    <div data-options="region:'north',border:false" style="height:90px;">
	    	<div style="height: 30px;padding:10px;min-width: 600px;">
	    		<form id="searchForm">
	    			<table class="searchTb">
	    				<tr>
	    					<td>
	    						条件1:
	    						<input class="easyui-textbox" name="" 
	    							style="border-radius: 0px;width:150px" />
	    						条件2:
	    						<input class="easyui-textbox" name="" 
	    							style="border-radius: 0px; width:150px"/>
	    					</td>
	    					<td>
	    						<a class="easyui-linkbutton" iconCls="icon-search" 
	    							style="border-radius: 3px;">查询一下</a>
	    					</td>
	    				</tr>
	    			</table>
	    		</form>
	    	</div>
	    	
	    	<div id="tb" style="height: 36px;
	    		border:1px solid #d4d4d4;margin: 0px 10px;
	    		background: url(img/tbg.png) repeat-x;">
	    		<ul>
	    			<li>
	    				<a onclick="addData()" class="easyui-linkbutton" plain=true iconCls="icon-eadd">新增</a>
	    			</li>
	    			<li style="width: 150px;">
	    				<a onclick="batchDel()"  class="easyui-linkbutton" plain=true iconCls="icon-delete">批量删除(ctrl多选)</a>
	    			</li>
	    			<li>
	    				<a onclick="sunData()" class="easyui-linkbutton" plain=true iconCls="icon-pie">统计</a>
	    			</li>
	    			<li>
	    				<a onclick="redoData()" class="easyui-linkbutton" plain=true iconCls="icon-redo">导出</a>
	    			</li>
	    			<li style="float:right;width: auto;
	    				background: #d4d4d4;height: 31px;margin-top: -5px;padding-top: 5px;">
	    				<a id="cancelRow" class="easyui-linkbutton" plain=true iconCls="icon-del">取消选择</a>
	    			</li>
	    		</ul>
	    	</div>
	    </div>  
	    	
	    <div data-options="region:'center',border:false" style="padding:10px;background:#fff;">
	    	<table id="table"></table>
	    </div>   
	</body>  
</html>
