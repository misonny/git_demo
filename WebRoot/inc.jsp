<%@ page language="java" pageEncoding="UTF-8"%>
<%
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath()+"/";
	session.setAttribute("basePath", basePath);
	
	String easyuiThemeName = "default";
	Cookie cookies[] = request.getCookies();
	if (cookies != null && cookies.length > 0) {
		for (Cookie cookie : cookies) {
			if (cookie.getName().equals("easyuiThemeName")) {
				easyuiThemeName = cookie.getValue();
				break;
			}
		}
	} 
%>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">

<link id="easyuiTheme" rel="stylesheet" href="${basePath}jslib/jquery-easyui/themes/<%=easyuiThemeName %>/easyui.css" type="text/css"></link>
<link rel="stylesheet" href="${basePath}jslib/jquery-easyui/themes/icon.css" type="text/css"></link>
<link rel="stylesheet" href="${basePath}jslib/jquery-easyui-portal/portal.css" type="text/css"></link> 


<script type="text/javascript" charset="utf-8" src="${basePath}jslib/jquery-easyui/jquery-1.8.0.min.js"></script>
<script type="text/javascript" charset="utf-8" src="${basePath}jslib/jquery-easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" charset="utf-8" src="${basePath}jslib/jquery-easyui/datagrid-detailview.js"></script>



<script type="text/javascript" charset="utf-8" src="${basePath}jslib/jquery.cookie.js" charset="utf-8"></script>
<script type="text/javascript" charset="utf-8" src="${basePath}jslib/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" charset="utf-8" src="${basePath}jslib/jquery-easyui-portal/jquery.portal.js"></script>
<script type="text/javascript" charset="utf-8" src="${basePath}jslib/syUtil.js"></script>

<link rel="stylesheet" href="${basePath}jslib/kindeditor/themes/default/default.css" />
<script type="text/javascript" charset="utf-8" src="${basePath}jslib/kindeditor/kindeditor-min.js"></script>
<script type="text/javascript" charset="utf-8" src="${basePath}jslib/kindeditor/lang/zh_CN.js"></script>


<script type="text/javascript" charset="utf-8" src="${basePath}jslib/validatebox-myrule.js"></script>
<script type="text/javascript" charset="utf-8" src="${basePath}jslib/jquery.edatagrid.js"></script>
<script type="text/javascript" charset="utf-8" src="${basePath}jslib/UserWindow.js"></script>
<script type="text/javascript" charset="utf-8" src="${basePath}jslib/jquery.dailyCalendar.js"></script>
<script type="text/javascript" charset="utf-8" src="${basePath}jslib/jquery.fullCalendar.js"></script>


