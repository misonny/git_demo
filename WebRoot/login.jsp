<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户登录</title>
<jsp:include page="inc.jsp"></jsp:include>
<link rel="stylesheet" href="css/syCss.css" type="text/css"></link>
<style>
body{font:14px/18px "Microsoft yahei", Arial, "\5b8b\4f53", sans-serif; color:#666; overflow:hidden}
</style>

<script type="text/javascript">
var loginDialog;
var loginTabs;
var loginInputForm;

$(function() {
	var formParam = {
		url : 'login',
		onSubmit: function(){
			var isValid = $(this).form('validate');
			if (isValid){
				//$("#btn_login").linkbutton({text:'正在登录'});
				window.location.href="index.jsp";
			}else{
				$("#btn_login").linkbutton({text:' 登 录 '});
			}
			return isValid;
		},
		success : function(data) {
			var json = $.parseJSON(data);
			if (json && json.success) {
				$.messager.show({
					title : '成功',
					msg : json.msg
				});
				if(window.parent){
					window.parent.location.href="index.jsp";
				}else{
					window.location.href="index.jsp";
				}
			} else {
				$("#btn_login").linkbutton({text:' 重新登录 '});
				$.messager.show({
					title : '失败',
					msg : json.msg
				});
			}
			return;
		}
	};
	loginInputForm = $('#loginInputForm').form(formParam);
	
	
	$('form input').bind('keyup', function(event) {/* 增加回车提交功能 */
		if (event.keyCode == '13') {
			$(this).submit();
		}
	});

	loginDialog = $('#loginDialog').show().dialog({
		buttons : [ {
			text : ' 登  录 ',
			id : 'btn_login',
			handler : function() {
					var f = loginTabs.tabs('getSelected').find('form');
					f.submit();
			}
		} ]
	});

	 loginTabs = $('#loginTabs').tabs({
		onSelect : function(title) {
			if ('用户登录' == title) {
				window.setTimeout(function() {
					$('div.validatebox-tip').remove();
					loginInputForm.find('input[name=cname]').focus();
				}, 0);
			}
		}
	}); 
	 
	 $("body").append("<div id='main_bg'/>");
		$("#main_bg").append("<img src='css/images/bg.jpg' id='bigpic'>");
		cover();
		$(window).resize(function(){
			cover();
		});

});

function cover(){
	var win_width = $(window).width();
	var win_height = $(window).height();
	$("#bigpic").attr({width:win_width,height:win_height});
}
</script>
</head>
<body>
<div class="" id="loginDialog" modal="true" title="欢迎使用Easyui登录界面" closable="false" style="width:350px;height:210px;display: none;overflow: hidden;">
	<div id="loginTabs" fit="true" border="false">
		<div title="用户登录" style="overflow: hidden;">
			<div class="info">
				<div class="tip icon-tip"></div>
				<div>请输入用户帐号/密码</div>
			</div>
			<div align="center">
				<form id="loginInputForm" action="index.jsp" method="post">
					<table class="tableForm" style="margin: 5px;">
						<tr>
							<th>登录名:</th>
							<td>
								<input style="border:1px solid #c5c7c9;" name="username" class="easyui-validatebox" data-options="required:true" missingMessage="请输入用户名"/>
							</td>
						</tr>
						<tr>
							<th>密&nbsp;&nbsp;&nbsp;码:</th>
							<td>
								<input style="border:1px solid #c5c7c9;" name="password" type="password" class="easyui-validatebox" data-options="required:true" missingMessage="请输入密码"/>
							</td>
						</tr>
						<tr>
							<td>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</div>
</body>
</html>