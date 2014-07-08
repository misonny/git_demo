<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SpringMVC框架测试</title>
<link rel="shortcut icon" href="css/images/favicon.ico" type="image/x-icon" /> 
<jsp:include page="inc.jsp"></jsp:include>
</head>
<body id="indexLayout" class="easyui-layout">  
	<div region="north" class="logo" style="height:130px;overflow: auto;" href="jsp/layout/north.jsp"></div>
	<div region="east" split="true" maxWidth="550px" style="width:180px;overflow: hidden;" href="jsp/layout/east.jsp"></div>
	<div region="center" title="欢迎回来" style="overflow: hidden;" href="jsp/layout/center.jsp"></div>
	<div region="west" title="功能导航" split="true" maxWidth="180px" style="width:180px;overflow: auto;" href="jsp/layout/west.jsp"></div>
	<div region="south" style="height:20px;overflow: auto;" href="jsp/layout/south.jsp"></div>
	<jsp:include page="isIe.jsp"></jsp:include>
</body>
</html>