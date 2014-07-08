<%@page import="com.webrage.test.OnlineCounter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jQuery-mobile、jgGrid-Demo</title>
<!-- jquery mobile 样式 -->
<link rel="stylesheet" href="${basePath}css/jquery.mobile-1.3.2.min.css" type="text/css"></link> 
<link rel="stylesheet" href="${basePath}css/ui.jqgridmobile.css" type="text/css"></link> 
<link rel="stylesheet" href="${basePath}jslib/js/date/jqm-datebox.min.css" type="text/css"></link> 
<%-- <link rel="stylesheet" href="${basePath}jslib/js/date/jquery.mobile.simpledialog.min.css" type="text/css"></link>  --%>

<!-- jquery mobile JS核心文件 -->
<script type="text/javascript" charset="utf-8" src="${basePath}jslib/jquery-easyui/jquery-1.8.0.min.js"></script>
<script type="text/javascript" charset="utf-8" src="${basePath}jslib/js/jquery.mobile-1.3.2.min.js"></script>
<script type="text/javascript" charset="utf-8" src="${basePath}jslib/js/jquerymobile.jqGrid.min.js"></script>
<script type="text/javascript" charset="utf-8" src="${basePath}jslib/js/grid.locale-cn.js"></script>
<%-- <script type="text/javascript" charset="utf-8" src="${basePath}jslib/js/index.js"></script> --%>
<%-- <script type="text/javascript" charset="utf-8" src="${basePath}jslib/js/date/jquery.mousewheel.min.js"></script>  --%>
<script type="text/javascript" charset="utf-8" src="${basePath}jslib/js/date/jqm-datebox.core.min.js"></script>
<script type="text/javascript" charset="utf-8" src="${basePath}jslib/js/date/jqm-datebox.mode.calbox.min.js"></script>
<script type="text/javascript" charset="utf-8" src="${basePath}jslib/js/date/jqm-datebox.mode.flipbox.min.js"></script>
<script type="text/javascript" charset="utf-8" src="${basePath}jslib/js/date/jqm-datebox.mode.datebox.min.js"></script> 
<script type="text/javascript" charset="utf-8" src="${basePath}jslib/js/date/jqm-datebox.mode.slidebox.js"></script> 
<script type="text/javascript" charset="utf-8" src="${basePath}jslib/js/date/jquery.mobile.datebox.i18n.zh-CN.utf8.js"></script>
</head>
<body>
	<%
	OnlineCounter.getOnlineSession();
	%>
	${OnlineCounter.getOnlineSession()};
	<div data-role="page" id="page">
		<div data-role="header" data-position="fixed">
			<h1>Collapsibles</h1>
			<a href="#" data-rel="back" data-icon="arrow-l" data-iconpos="notext" data-ajax="false">Black</a>
		</div>
		<div data-role="content">
			<div data-role="collapsible">
			   <h3>I'm a header</h3>
				<ul data-role="listview">
					<li><a href="#">List item 1</a></li>
					<li><a href="#">List item 2</a></li>
					<li><a href="#">List item 3</a></li>
				</ul>
			</div>
		</div>
		<div data-role="footer" data-position="fixed">
			<h2>Demo By <a href="http://t.qq.com/su_yangl?preview" target="_blank" style="text-decoration: none; ">苏洋</a></h2>
		</div>
	</div>
</body>
</html>