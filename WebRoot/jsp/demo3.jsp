<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jQuery-mobile、jgGrid-Demo</title>

<link rel="stylesheet" href="${basePath}css/jquery.mobile-1.3.2.min.css" type="text/css"></link> 
<link rel="stylesheet" href="${basePath}css/ui.jqgridmobile.css" type="text/css"></link> 
<link rel="stylesheet" href="${basePath}css/shCore.css" type="text/css"></link> 
<link rel="stylesheet" href="${basePath}css/shCoreEclipse.css" type="text/css"></link> 
<link rel="stylesheet" href="${basePath}css/shThemeDefault.css" type="text/css"></link> 
<link rel="stylesheet" href="${basePath}css/shThemeEclipse.css" type="text/css"></link>

<script type="text/javascript" charset="utf-8" src="${basePath}jslib/jquery-easyui/jquery-1.8.0.min.js"></script>
<script type="text/javascript" charset="utf-8" src="${basePath}jslib/js/jquery.mobile-1.3.2.min.js"></script>
<script type="text/javascript" charset="utf-8" src="${basePath}jslib/js/jquerymobile.jqGrid.min.js"></script>
<script type="text/javascript" charset="utf-8" src="${basePath}jslib/js/grid.locale-cn.js"></script>
<script type="text/javascript" charset="utf-8" src="${basePath}jslib/js/shAutoloader.js"></script>
<script type="text/javascript" charset="utf-8" src="${basePath}jslib/js/shBrushJScript.js"></script>
<script type="text/javascript" charset="utf-8" src="${basePath}jslib/js/shCore.js"></script>
<script type="text/javascript" charset="utf-8" src="${basePath}jslib/js/shLegacy.js"></script> 
</head>
<body>
	<!-- Demo 三开始 -->
	<div id="page" data-role="page" data-theme="b">
		<div data-role="header">
			<h1>Listviews 测试列表视图三</h1>
		<a href="#" data-rel="back" data-icon="arrow-l" data-iconpos="notext" data-ajax="false">Back</a>
		</div>
		<table id="grid"></table>
		<div id="pager"></div>
		
		<div data-role="footer">
			<h2>Demo By <a href="http://t.qq.com/su_yangl?preview" target="_blank" style="text-decoration: none; ">苏洋</a></h2>
		</div>
	</div>
	
	
	<script type="text/javascript">
		//data数据
		var data=[
			{"Integer":200000,"Number":60000000.63,"Curreny":34.2,"Email":"john.smith@yahoo.com","Link":"http://www.yahoo.com","Checkbox":"Yes"},
			{"Integer":1600000,"Number":666666.63,"Curreny":245.2,"Email":"joe.woe@google.com","Link":"http://www.yahoo.com","Checkbox":"Yes"},
			{"Integer":65321234,"Number":454547.12,"Curreny":18545.2,"Email":"julia.bergman@bing.com","Link":"http://www.yahoo.com","Checkbox":"Yes"},
			{"Integer":123453123,"Number":44444456.30,"Curreny":354.2,"Email":"roy.corner@msn.com","Link":"http://www.yahoo.com","Checkbox":"No"},
			{"Integer":3112120,"Number":222242.55,"Curreny":152.2,"Email":"john.smith@yahoo.com","Link":"http://www.yahoo.com","Checkbox":"No"},
			{"Integer":451210,"Number":77778748.23,"Curreny":785.2,"Email":"john.smith@yahoo.com","Link":"http://www.yahoo.com","Checkbox":"No"},
		];
	
		/* demo 三，开始  */
		jQuery('#grid').jqGrid({
			"hoverrows":false,
			//"jsonReader":{"repeatitems":false,"subgrid":{"repeatitems":false}},
			"gridview":true,	//构造一行数据后添加到grid中，如果设为true则是将整个表格的数据都构造完成后再添加到grid中，但treeGrid, subGrid, or afterInsertRow 不能用
			//"loadonce":true,
			//"url":"datav.json",
			//"scroll":1,	//创建一个动态滚动的表格，当为true时，翻页栏被禁用
			//"iScroll": {"hScrollbar":false, "vScrollbar":false},
			//"srcollPaging":true,
			"autowidth":true,
			//"footerrow": true,	//当为true时，会在翻页栏之上增加一行
			//"userDataOnFooter": true,	//当为true时，会在页脚显示
			"width":800,
			//"shrinkToFit" : false,
			"rownumbers":true,
			"viewrecords":true, //定义是否要显示总记录数
			//"rowNum":20,
			//"rowList":[20,40,60],
			//"sortname":"OrderID",
			//"height":200,
			"datatype":"local",
			"data":data,
			colNames:['编号','数量','价格','邮箱','连接','是否选择'],//表格的列名
			"colModel":[
				{"name":"Integer","formatter":"integer","key":true,"width":80,"sorttype":"integer","formatoptions":{"thousandsSeparator":","},"editable":true},
				{"name":"Number","formatter":"number","width":80,"sorttype":"number","formatoptions":{"decimalPlaces":1},"editable":true},
				{"name":"Curreny","formatter":"currency","width":80,"formatoptions":{"decimalPlaces":1,"thousandsSeparator":",","prefix":"￥","sufix":"RMB"},"editable":true},
				{"name":"Email","formatter":"email","width":120,"editable":true,},
				{"name":"Link","formatter":"link","width":120,"editable":true,},
				{"name":"Checkbox","formatter":"checkbox","width":50,"editable":true,}
			],
			"loadError":function(xhr,status, err){ 
				try {
					jQuery.jgrid.info_dialog(jQuery.jgrid.errors.errcap,'<div class="ui-state-error">'+ xhr.responseText +'</div>', jQuery.jgrid.edit.bClose,
					{buttonalign:'right'});
				} catch(e) { 
					alert(xhr.responseText);} 
			},
			"pager":"#pager"
		});
		//$("#grid").jqGrid('footerData','set',{"ShipName":"合计："},true);
	</script>
</body>
</html>