<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />
<jsp:include page="../inc.jsp" /> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<script type="text/javascript" src="js/jquery.min.js" ></script>
		<script type="text/javascript" src="js/jquery.easyui.min.js" ></script>
		<script type="text/javascript" src="js/easyui-lang-zh_CN.js" ></script>
		<script type="text/javascript" src="js/extJquery.js" ></script>
		<script type="text/javascript" src="js/extEasyUI.js" ></script>
		
		<link rel="stylesheet" href="css/themes/bootstrap/easyui.css" />
		<link rel="stylesheet" href="css/themes/icon.css" />
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
		<script type="text/javascript">
		    var i = 0;
			function addData(){
				var id = i;
				
				var f = $('#f'+id);
				var data = f.serialize();
				$.ajax({
					type:'post',
					url:'${ctx}/ec/insert.coc',
					data:data,
					dataType:'json',
					success:function(r){
						$.messager.alert('系统提示',r.msg,'info');
						if(r.is){
							var title = r.obj.name;
							var acc = $('#aa').accordion('getPanel',id);
							//acc.panel('setTitle',title);
							alert(title);
							$('#tr').hide();
							$('#addTr').show();
							var ins = $('#f'+id).find('input[type="text"]');
							$.forEach(ins,function(i,inp){
								$(inp).textbox('readonly');
							});
						}
					}
				});
				
				
				
				
			}
			function cancelAdd(){
				var id = i;
				$('#aa').accordion('remove','新增企业信息');
				i--;
				$('#tr').hide();
				$('#addTr').show();
			}
			function addNew(){
				i++;
				var str = '<div id="aa'+i+'" data-options="iconCls:\'icon-save\'" style="overflow:auto;padding:5px;">'+   
					        	'<form id="f'+i+'">'+
					        		'<table id="formTb">'+
					        			'<tr>'+
					        				'<td width="100px" align="right">公司名称:</td>'+
					        				'<td>'+
					        				    '<input type="hidden" name="memId" value="${memId}"/>'+
					        					'<input name="name" class="easyui-textbox" data-options="'+
					        						'" />'+
					        				'</td>'+
					        			'</tr>'+
					        			'<tr>'+
					        				'<td width="100px" align="right">公司职务:</td>'+
					        				'<td>'+
					        					'<input name="work" class="easyui-textbox" data-options="'+
					        						'" />'+
					        				'</td>'+
					        			'</tr>'+
					        			'<tr>'+
					        				'<td width="100px" align="right">入司时间:</td>'+
					        				'<td>'+
					        					'<input name="joinTime" class="easyui-datebox" data-options="'+
					        						'" />'+
					        				'</td>'+
					        			'</tr>'+
					        			'<tr>'+
					        				'<td width="100px" align="right">行业:</td>'+
					        				'<td>'+
					        					'<input id="cc" class="easyui-combobox" name="industry"'+   
			    									'data-options="valueField:\'code\',textField:\'name\',url:\'${ctx}/ic/find.coc\'" />'+  
					        				'</td>'+
					        			'</tr>'+
					        			'<tr>'+
					        				'<td width="100px" align="right">联系方式:</td>'+
					        				'<td>'+
					        					'<input name="phone" class="easyui-textbox" data-options="'+
					        						'" />'+
					        				'</td>'+
					        			'</tr>'+
					        			'<tr>'+
					        				'<td width="100px" align="right">地址:</td>'+
					        				'<td>'+
					        					'<input name="address" class="easyui-textbox" data-options="'+
					        						'multiline:true,'+
					        						'height:50'+
					        						'" />'+
					        				'</td>'+
					        			'</tr>'+
					        			'<tr>'+
					        				'<td width="100px" align="right">企业网站:</td>'+
					        				'<td>'+
					        					'<input name="url" class="easyui-textbox" data-options="'+
					        						'" />'+
					        				'</td>'+
					        			'</tr>'+
					        			'<tr>'+
					        				'<td width="100px" align="right">主打产品:</td>'+
					        				'<td>'+
					        					'<input name="produst" class="easyui-textbox" data-options="'+
					        						'" />'+
					        				'</td>'+
					        			'</tr>'+
					        			'<tr>'+
					        				'<td width="100px" name="content" align="right">企业简介:</td>'+
					        				'<td>'+
					        					'<input name="content" class="easyui-textbox" data-options="'+
					        						'multiline:true,'+
					        						'height:80'+
					        						'" />'+
					        				'</td>'+
					        			'</tr>'+
					        			
					        		'</table>'+
					        	'</form>'+
					    '</div>';
				$('#aa').accordion('add', {
					title: '新增企业信息',
					iconCls:'icon-save',
					content: str,
					selected: true
				});
				$('#addTr').hide();
				$('#tr').show();

			}
		</script>
		<div id="cct" class="easyui-layout" fit=true>   
		    <div data-options="region:'center',border:false" style="padding:5px;background:#fff;">
		    	<div id="aa" class="easyui-accordion" style="fit:true">   
				    <c:forEach items="${list }" var="emp">
				    <div id="aa" title="${emp.name }" data-options="iconCls:'icon-save'" style="overflow:auto;padding:5px;">   
		        		<table id="formTb">
		        			<tr>
		        				<td width="100px" align="right">公司名称:</td>
		        				<td>
		        					<input value="${emp.name }" class="easyui-textbox" data-options="
		        						
		        						" />
		        				</td>
		        			</tr>
		        			<tr>
		        				<td width="100px" align="right">公司职务:</td>
		        				<td>
		        					<input value="${emp.work }" class="easyui-textbox" data-options="
		        						
		        						" />
		        				</td>
		        			</tr>
		        			<tr>
		        				<td width="100px" align="right">入司时间:</td>
		        				<td>
		        					<input value="${emp.joinTime }" class="easyui-datebox" data-options="
		        						
		        						" />
		        				</td>
		        			</tr>
		        			<tr>
		        				<td width="100px" align="right">行业:</td>
		        				<td>
		        					<input id="cc" class="easyui-combobox" value="${emp.industry }"   
    									data-options="valueField:'code',textField:'name',url:'${ctx }/ic/find.coc'" />  
		        				</td>
		        			</tr>
		        			<tr>
		        				<td width="100px" align="right">联系方式:</td>
		        				<td>
		        					<input value="${emp.phone }" class="easyui-textbox" data-options="
		        						
		        						" />
		        				</td>
		        			</tr>
		        			<tr>
		        				<td width="100px" align="right">地址:</td>
		        				<td>
		        					<input value="${emp.address }" class="easyui-textbox" data-options="
		        						multiline:true,
		        						height:50
		        						" />
		        				</td>
		        			</tr>
		        			<tr>
		        				<td width="100px" align="right">企业网站:</td>
		        				<td>
		        					<input value="${emp.url }" class="easyui-textbox" data-options="
		        						
		        						" />
		        				</td>
		        			</tr>
		        			<tr>
		        				<td width="100px" align="right">主打产品:</td>
		        				<td>
		        					<input value="${emp.produst }" class="easyui-textbox" data-options="
		        						
		        						" />
		        				</td>
		        			</tr>
		        			<tr>
		        				<td width="100px" align="right">企业简介:</td>
		        				<td>
		        					<input value="${emp.content }" class="easyui-textbox" data-options="
		        						multiline:true,
		        						height:80
		        						" />
		        				</td>
		        			</tr>
		        		</table>
				    </div>  
				    </c:forEach> 
				</div> 
		    </div> 
			<div data-options="region:'south',border:false" style="height:35px;background: #d4d4d4;margin: 5px">
				<table width="100%" style="margin-top: 5px;">
					<tr id="tr" align="center" style="display: none;">
						<td colspan="2">
							<a id="btn1" onclick="addData(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存新增</a>
							<a id="btn2" onclick="cancelAdd(0)" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'">取消新增</a>
						</td>
					</tr>
					<tr id="addTr" align="center">
						<td colspan="2">
							<a id="btn3" onclick="addNew(0)" class="easyui-linkbutton" data-options="iconCls:'icon-eadd'">添加企业信息</a>
						</td>
					</tr>
				</table>
			</div>   
		</div> 
		
	</body>
</html>

