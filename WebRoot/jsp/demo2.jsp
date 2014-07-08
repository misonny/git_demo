<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, minimum-scale=1, maximum-scale=1">
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
	<!-- Demo 二 -->
	<div id="page" data-role="page" data-theme="b">
		<div data-role="header" data-position="fixed" style="margin-bottom: 10px">
			<h1>Listviews 测试列表视图二</h1>
			<a href="#" data-rel="back" data-icon="arrow-l" data-iconpos="notext" data-ajax="false">Back</a>
		</div>
		<!-- <div data-role="content" > -->
			<table id="grid" ></table>
			<div id="pager"></div>
		<!-- </div> -->
		<div data-role="footer" data-position="fixed">
			<h2>Demo By <a href="http://t.qq.com/su_yangl?preview" target="_blank" style="text-decoration: none; ">苏洋</a></h2>
		</div>
	</div>
	
	
	<script type="text/javascript">
		
		/* demo 二，开始  */
		jQuery('#grid').jqGrid({
			"hoverrows":false,
			"viewrecords":true,
			"jsonReader":{"repeatitems":false,"subgrid":{"repeatitems":false}},
			"gridview":true,	//构造一行数据后添加到grid中，如果设为true则是将整个表格的数据都构造完成后再添加到grid中，但treeGrid, subGrid, or afterInsertRow 不能用
			"loadonce":true,
			"url":"datav.json",
			//"scroll":1,	//创建一个动态滚动的表格，当为true时，翻页栏被禁用
			"iScroll":  {"zoom":true},
			//"iScroll": {"hScrollbar":false, "vScrollbar":false},
			"iScroll": {"hideScrollbar":true},	//如果需要显示滚动条把hideScrollbar设置为true就是自动显示和隐藏
			"scrollPaging":true,
			"autowidth":true,
			"footerrow": true,	//当为true时，会在翻页栏之上增加一行
			"userDataOnFooter": true,	//当为true时，会在页脚显示
			
			//"width":900,
			//"shrinkToFit" : false,	//如果为ture，则按比例初始化列宽度。如果为false，则列宽度使用colModel指定的宽度
			"rownumbers":true,
			"rowNum":20,
			"rowList":[20,40,60],
			"sortname":"OrderID",
			"height":300,
			"datatype":"json",
			"colNames":['编号','日期','名称','价格'],//表格的列名
			"colModel":[
				{"name":"OrderID","index":"OrderID","sorttype":"int","key":true,"editable":true},
				{"name":"OrderDate","index":"OrderDate","sorttype":"datetime","formatter":"date","formatoptions":{"srcformat":"Y-m-d H:i:s","newformat":"Y/m/d"},"editable":true},
				{"name":"ShipName","index":"ShipName","sorttype":"string","editable":true},
				{"name":"Freight","index":"Freight","sorttype":"numeric","editable":true,"formatter":"number"}
			],
			"loadError":function(xhr,status, err){ 
				try {
					jQuery.jgrid.info_dialog(jQuery.jgrid.errors.errcap,'<div class="ui-state-error">'+ xhr.responseText +'</div>', jQuery.jgrid.edit.bClose,
					{buttonalign:'right'});
				} catch(e) { 
					alert(xhr.responseText);} 
			},
			"pager":"#pager",
			"editurl":"nosavedata"
		});
		$("#grid").jqGrid('footerData','set',{"ShipName":"合计："},true);
		jQuery('#grid').jqGrid('navGrid','#pager',{add:true, edit:true, del:true},{reloadAfterSubmit:false},{reloadAfterSubmit:false, closeAfterAdd:true},{reloadAfterSubmit:false},{multipleSearch:true});
		jQuery('#grid').jqGrid('filterToolbar');
		
		/* $("#grid").jqGrid('setGroupHeaders',{
			"userColSpanStyle":true,
			"groupHeaders":[{d
				"startColumnName":'OrderID',
				"numberOfColumns":2,
				"titleText":"标题一",
				
			},{
				"startColumnName":'ShipName',
				"numberOfColumns":2,
				"titleText":'标题二'
			}
		]}); */
	</script>
</body>
</html>