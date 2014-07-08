<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="css/images/favicon.ico" type="image/x-icon" /> 
<jsp:include page="../inc.jsp"></jsp:include>
<title>CSS3样式测试</title>
<style type="text/css">
	#div1{
		text-align: center; 
		background: orange;
		width: 450px;
		border: 2px solid red;
		padding: 10px 40px;
		border-radius:25px;		/* CSS3 圆角边框  */
	}	
	#div2{
		text-align: center; 
		background-color:#ff9900;
		width: 450px;
		height: 150px;
		margin-top: 10px;
		box-shadow: 10px 10px 5px #888888;	/* CSS3 边框阴影  */
		/* border-radius:25px; */
	}
	#div3{
		margin-top: 50px;
		border:15px solid transparent;
		width:400px;
		padding:20px 50px;
		border-image:url(../css/images/border.png) 30 30 round;
	}	
	h1{
		text-shadow: 5px 5px 5px #FF0000;
	}
</style>

</head>
<body>
	<div>
		<div id="div1">
			启用border-radius 属性允许您向元素添加圆角。
		</div>
		<div id="div2">
			CSS3 边框阴影。
		</div>
		<div id="div3">
			<h1>在这里，图片铺满整个边框。</h1>
		</div>
		<div class="toolbar">  
	        <a id="add" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'">Add</a>  
	        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-remove'">Remove</a>  
	        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save'">Save</a>  
	        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-cut',disabled:true">Cut</a>  
	        <a href="#" class="easyui-linkbutton" onclick="javascript:alert('ttt')">Text Button</a>  
	    </div>
	</div>
</body>
<script type="text/javascript">
	$(function(){
		$("#add").click(function(){
			alert(213);
			$.messager.show({
				title:'消息框',
				msg:'这个是一个消息框',
				timeout:5000,
				showType:'slile'
			});
		});
	});
</script>
</html>