<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Listview Autodivider Linkbar - jQuery Mobile Demos</title>
<!-- CSS 样式 -->
<!-- <link rel="stylesheet" href="../css/jquery.mobile.theme-1.3.2.min.css"> -->
<!-- <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,700"> -->
<!-- <link rel="stylesheet" href="../css/autodividers-linkbar.css"> -->
<!-- <link rel="stylesheet" href="../css/jquery.mobile-1.3.2.min.css">

<script src="../jslib/js/jquery.mobile-1.3.2.min.js"></script> -->
<!-- <link rel="stylesheet" href="../css/jquery.mobile.theme-1.3.2.css"> -->
<!-- <link rel="stylesheet" href="../css/jquery.mobile-1.3.2.css"> -->
<!-- javascript 引用 -->
<!-- <script src="../jslib/js/jquery.js"></script> -->
<!-- <script src="../jslib/js/jquery.mobile-1.3.2.js"></script> -->

<!-- <script src="../jslib/js/jquery.mobile-1.3.2.min.map"></script> -->
<!-- <script src="../jslib/js/autodividers-linkbar.js"></script> -->
<jsp:include page="../inc.jsp"></jsp:include>

<link rel="stylesheet" href="${basePath}css/jquery.mobile-1.3.2.min.css" type="text/css"></link> 

<script type="text/javascript" charset="utf-8" src="${basePath}jslib/jquery-easyui/jquery-1.8.0.min.js"></script>
<script type="text/javascript" charset="utf-8" src="${basePath}jslib/js/jquery.mobile-1.3.2.min.js"></script>
<script type="text/javascript" charset="utf-8" src="${basePath}jslib/js/jquerymobile.jqGrid.min.js"></script>

</head>
<body>
	<div date-role="page" >
		<div data-role="header">
			<h1>Listview Autodivider Linkbar</h1>
		<a href="#" data-rel="back" data-icon="arrow-l" data-iconpos="notext" data-ajax="false">Back</a>
		</div>
		<div data-role="content">
			<ul data-role="listview" data-inset="true" data-theme="e" data-dividertheme="b"> 
				<li data-role="list-divider">Transition Effects</li> 
				<li><a href="effects.php?id=slide" data-transition="slide">Slide</a></li> 
				<li><a href="effects.php?id=slideup" data-transition="slideup">Slide Up</a></li> 
				<li><a href="effects.php?id=slidedown" data-transition="slidedown">Slide Down</a></li> 
				<li><a href="effects.php?id=pop" data-transition="pop">Pop</a></li> 
				<li><a href="effects.php?id=flip" data-transition="flip">Flip</a></li> 
				<li><a href="effects.php?id=fade" data-transition="fade">Fade</a></li> 
			</ul> 
				<br  /><br  /> 
			<!-- <ul data-role="listview" data-dividertheme="e"> 
				<li data-role="list-divider">Seamless List (margin-less)</li> 
				<li><a href="#foo" data-transition="slide">Internal Link 1</a></li> 
				<li><a href="#bar" data-transition="slide">Internal Link 2</a></li> 
				<li><a href="#" data-transition="slide">Example Item 3</a></li> 
			</ul> -->
			<!-- <div class="ui-grid-b">
				<div class="ui-block-a"><div class="ui-bar ui-bar-e" style="height:60px">Block A</div></div>
				<div class="ui-block-b"><div class="ui-bar ui-bar-e" style="height:60px">Block B</div></div>
			</div>/grid-a -->
		</div>
	</div>
	<p>
		<a  href="pages/mobile.jsp" data-role="button" data-inline="true" data-theme="b" data-icon="check" class="ui-disabled">jquery-Mobile1</a>
	</p>
	<a href="#" data-role="button" data-inline="true">Anchor</a>
	<form>
		<button data-inline="true">Button</button>
		<input type="button" value="Input" data-inline="true">
		<input type="submit" value="Submit" data-inline="true">
		<input type="reset" value="Reset" data-inline="true">
	</form>
	<ul data-role="listview" data-inset="true">
		<li>
			<a href="#" >
				<img alt="" src="../css/img/album-af.jpg">
				<h2>测试标题</h2>
				<p>环境介绍，欢迎购买！</p>
				<a href="#purchase" data-rel="poup" data-position-to="window" data-transition="pop">Purchase album</a>
			</a>
		</li>
		<li>
			<a href="#" >
				<img alt="" src="../css/img/album-ag.jpg">
				<h2>测试标题</h2>
				<p>环境介绍，欢迎购买！</p>
			</a>
		</li>
		<li>
			<a href="#" >
				<img alt="" src="../css/img/album-bb.jpg">
				<h2>测试标题</h2>
				<p>环境介绍，欢迎购买！</p>
			</a>
		</li>
		<li>
			<a href="#" >
				<img alt="" src="../css/img/album-bk.jpg">
				<h2>测试标题</h2>
				<p>环境介绍，欢迎购买！</p>
			</a>
		</li>
	</ul>
	<dir data-role="poup" id="purchase">
		
	</dir>
	
	
</body>
</html>