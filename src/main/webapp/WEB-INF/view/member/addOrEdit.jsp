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
		table#formTb tr{
			height: 25px;
			border-bottom: 1px solid #d4d4d4;
			margin: 5px;
		}
		table#formTb tr td:first-child{
			text-align: right;
		}	
		table#formTb tr td{
			padding: 7px 3px;
		}
	</style>
	<script type="text/javascript">
		function checkSex(nv){
			var ras = $('input[type="radio"]');
			var sexn = nv.substring(16,17);
			if(sexn=='1'){
				ras[0].checked="checked";
				ras[1].checked=false;
			}else{
				ras[1].checked="checked";
				ras[0].checked=false;
			}
			checkBirthday(nv);
		}
		function checkBirthday(nv){
			var bir = nv.substring(6,10)+'-'+nv.substring(10,12)+'-'+nv.substring(12,14);
			$('#birthday').datebox('setValue',bir);
		}
		
		function selectPhoto(){
			$('#photo').click();
		}
		$(function(){
			$("#photo").change(function(e){
				this.name="photo";
				var file = e.target.files[0];
				//声明文件流对象
				var reader = new FileReader();
				//加载文件
				reader.onload = function(e){
					var img = $('#imgPhoto').attr("src",e.target.result);
				}
				reader.readAsDataURL(file);
			});
		});
		var si = '';
		function getCode(){
			var mobile = $('#mobile');
			if(!$('#mobile').textbox('isValid')){
				return false;
			}
			var m = mobile.textbox('getValue');
			$.ajax({
				type:'get',
				url:'${ctx}/sc/getMobileCode.coc?mobile='+m,
				dataType:'json',
				success:function(r){
					$.messager.alert('系统提示',r.msg,'info');
					if(r.is){
						$('#btn').linkbutton('disable');
						clearInterval(si);
						var i = 2;
						si = setInterval(function(){
							i--;
							$("#ft").html(i+"s后重新获取");
							if(i==0){
								$("#ft").html("点击重新获取");
								clearInterval(si);
								$('#btn').linkbutton('enable');
							}
						}, 1000);
					}
				}
			});
			
			
		}
	</script>
	<form id="dataForm" enctype="multipart/form-data">
		<div id="tt" class="easyui-tabs" fit:true border=false>   
		    <div title="基本信息" style="padding:0px;display:none;">   
		        <table id="formTb" width="100%">
		        	<tr height="130px">
		        	    
						<th align="center" colspan="2" style="padding:5px">
							<img id="imgPhoto" alt="" 
							<c:if test="${not empty mb.id }">src="${ctx }/fc/getImg.coc?tname=t_coc_member&tid=${mb.id }"</c:if>
		        	        <c:if test="${empty mb.id }">src="${ctx }/img/i07.png"</c:if> 
							style="width: 120px;height: 120px;
							border-radius: 120px;border:1px solid #d4d4d4;
							cursor: pointer;" onclick="selectPhoto()"/>
							<input
							type="file"
							id="photo" style="display: none" accept="image/jpeg,image/png"/>
							<input type="hidden" name="id" value="${mb.id }">
						</th>
						
					</tr>
					<tr>
						<td width="100px">姓名:</td>
						<td>
							<input class="easyui-textbox" name="name" value="${mb.name }" data-options="
								required:true,
								validType:'chs',
								prompt:'中文的名字'
							">
						</td>
					</tr>
					<tr>
						<td>身份证号:</td>
						<td>
							<input class="easyui-textbox" name="idcard" value="${mb.idcard}" data-options="
								required:true,
								prompt:'18位身份证号码',
								onChange:function(nv,ov){
								    checkSex(nv);
								}
							">
						</td>
					</tr>
					<tr>
						<td>性别:</td>
						<td>
							<input type="radio" name="sex" value="1" <c:if test="${mb.sex eq '1' }">checked</c:if>>男 
							<input type="radio" name="sex" value="2" <c:if test="${mb.sex eq '2' }">checked</c:if>>女
						</td>
					</tr>
					<tr>
						<td>出生日期:</td>
						<td>
							<input class="easyui-datebox" enable=false id="birthday" 
							value="${mb.bir }"
							name="birthday">
						</td>
					</tr>
					<tr>
						<td>手机号码:</td>
						<td>
							<input class="easyui-textbox" id="mobile" name="mobile" value="${mb.mobile }" data-options="
								required:true,
								validType:'phone',
								prompt:'11位的手机号码'
							">
						</td>
					</tr>
					<tr>
						<td>手机验证码:</td>
						<td>
							<input class="easyui-numberbox" name="code" data-options="
								required:true,
								prompt:'短信验证码',
								width:80
							">
							<a id="btn" onclick="getCode()" class="easyui-linkbutton">
								<font id="ft">获取验证码</font>
							</a>
						</td>
					</tr>
					<tr>
						<td>住址:</td>
						<td>
							<input class="easyui-textbox" value="${mb.address }" multiline=true name="address" style="height: 50px;width: 150px" >
						</td>
					</tr>
				</table>  
		    </div>   
		    <div title="拓展信息" data-options="closable:false" style="overflow:auto;padding:0px;display:none;">   
		        <table id="formTb" width="100%">
					<tr>
						<td width="100px">民族:</td>
						<td>
							<input id="ecc" class="easyui-combobox" name="nation_id"   
    					data-options="valueField:'id',textField:'text',url:''" /> 
						</td>
					</tr>
					<tr>
						<td>学历:</td>
						<td>
							<input class="easyui-textbox" name="eduction" data-options="">
						</td>
					</tr>
					<tr>
						<td>固定电话:</td>
						<td>
							<input class="easyui-textbox" name="telphone" data-options="">
						</td>
					</tr>
					<tr>
						<td>电子邮箱:</td>
						<td>
							<input class="easyui-textbox" name="email" data-options="">
						</td>
					</tr>
					<tr>
						<td>QQ:</td>
						<td>
							<input class="easyui-textbox" name="qq" data-options="">
						</td>
					</tr>
					<tr>
						<td>微信号:</td>
						<td>
							<input class="easyui-textbox" name="wechat" data-options="">
						</td>
					</tr>
				</table>    
		    </div>   
		</div> 
		
	</form>
</body>
</html>