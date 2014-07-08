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
<%-- <script type="text/javascript" charset="utf-8" src="${basePath}jslib/js/date/jquery.mobile.simpledialog.min.js"></script>  --%>

</head>
<body>
	<div data-role="page" id="page" >
		<div data-role="header" data-position="fixed">
			<h1>用户注册</h1>
			<a href="#" data-rel="back" data-icon="arrow-l" data-iconpos="notext" data-ajax="false">Black</a>
		</div>
		<div data-role="content">
			<div class="content-primary">
				<form action=""　method="">
				<ul data-role="listview">
					<li data-role="fieldcontain">
						<label for="text-1" >昵　　称：</label>
						<input type="text" data-mini="true" data-clear-btn="true" name="text-1" id="text-1" value="" >
					</li>
					<li data-role="fieldcontain">
						<label for="password-2">密　　码：</label>
						<input type="password" data-clear-btn="true" name="password-2" id="password-2" value="" autocomplete="off">
					</li>
					<li data-role="fieldcontain">  
						<fieldset data-role="controlgroup">  
							<legend>性　　别：</legend>  
							<input type="radio" name="sex" id="nan" value="男">  
							<label for="nan">男</label>   
							<input type="radio" name="sex" id="nv" value="女">  
							<label for="nv">女</label>   
						</fieldset>  
					</li> 
					<li data-role="fieldcontain">
						<label for="slider">请选择:</label>
						<select name="slider" id="slider" data-role="slider">
							<option value="off">Off</option>
							<option value="on">On</option>
						</select> 
					</li>
					<li data-role="fieldcontain">
						<label for="slider">亮　　度</label>
						<input type="range" name="slider" id="slider" value="0" min="0" max="100">
					</li>
					<li data-role="fieldcontain">
						<fieldset data-role="controlgroup">
							<legend>您喜欢的颜色：</legend>
							<input type="checkbox" name="check-1a" id="check-1a" class="custom">
							<label for="check-1a">白色</label>
							<input type="checkbox" name="check-2a" id="check-2a" class="custom">
							<label for="check-2a">蓝色</label>
							<input type="checkbox" name="check-3a" id="check-3a" class="custom">
							<label for="check-3a">绿色</label>
							<input type="checkbox" name="check-4a" id="check-4a" class="custom">
							<label for="check-4a">红色</label>
						</fieldset>
					</li>
					<li data-role="fieldcontain">
						<fieldset data-role="controlgroup" data-type="horizontal">
							<legend>复选框</legend> 
							<input type="checkbox" name="blue" id="effect1" class="custom" /> 
							<label for="effect1">效果1</label>
							<input type="checkbox" name="green" id="effect2" class="custom" />
							<label for="effect2">效果2</label>
							<input type="checkbox" name="pink" id="effect2" class="custom"  />
							<label for="effect3">效果3</label>
							<input type="checkbox" name="pink" id="effect3" class="custom"  />
						</fieldset>
					</li>
					<li data-role="fieldcontain">
						<fieldset data-role="controlgroup">
							<legend>您喜欢的动物：</legend>
								<input type="radio" name="radio-choice-1" id="radio-choice-1" value="choice-1" checked="checked" />
								<label for="radio-choice-1">小猫</label>
								
								<input type="radio" name="radio-choice-1" id="radio-choice-2" value="choice-2" />
								<label for="radio-choice-2">小狗</label>
								
								<input type="radio" name="radio-choice-1" id="radio-choice-3" value="choice-3" />
								<label for="radio-choice-3">小白兔</label>
								
								<input type="radio" name="radio-choice-1" id="radio-choice-4" value="choice-4" />
								<label for="radio-choice-4">哈士奇</label>
						</fieldset>
					</li>
					
					<li data-role="fieldcontain">
						<label for="mydate">出生日期：</label>
						<input type="text" data-role="datebox"  data-options='{"mode":"datebox"}' data-theme="c" name="mydate" id="mydate" value="">
					</li>
					<li data-role="fieldcontain">
						<label for="mydate">申报日期：</label>
						<input name="mydate" id="mydate" type="date" data-role="datebox" data-theme="c" data-options='{"mode": "flipbox"}'>
					</li>
					<li data-role="fieldcontain">
						<label for="mydate">领取时间：</label>
						<input name="mydate" id="mydate" type="date" data-role="datebox" data-theme="c" data-options='{"mode": "slidebox", "overrideDateFormat":"%Y-%m-%d %I:%M%p", "overrideTimeFormat":24, "overrideSlideFieldOrder":["y","m","d","h","i"]}'>
					</li>
					<li data-role="fieldcontain">
						<label for="textarea">个性介绍:</label>
						<textarea cols="40" rows="8" name="textarea" id="textarea"></textarea>
					</li>
					<li class="ui-body ui-body-b">
						<fieldset class="ui-grid-a">
								<div class="ui-block-a"><button type="submit" data-theme="d">取消</button></div>
								<div class="ui-block-b"><button type="submit" data-theme="a">提交</button></div>
						</fieldset>
					</li>
				</ul>
				</form>
			</div>
		<div data-role="footer" data-position="fixed">
			<h2>Demo By <a href="http://t.qq.com/su_yangl?preview" target="_blank" style="text-decoration: none; ">苏洋</a></h2>
		</div>
		
	</div>
	
</body>
</html>