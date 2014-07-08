<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Jquery-mobile、jgGrid-Demo</title>

<link rel="stylesheet" href="${basePath}css/jquery.mobile-1.3.2.min.css" type="text/css"></link> 
<link rel="stylesheet" href="${basePath}css/ui.jqgridmobile.css" type="text/css"></link> 

<script type="text/javascript" charset="utf-8" src="${basePath}jslib/jquery-easyui/jquery-1.8.0.min.js"></script>
<script type="text/javascript" charset="utf-8" src="${basePath}jslib/js/jquery.mobile-1.3.2.min.js"></script>
<script type="text/javascript" charset="utf-8" src="${basePath}jslib/js/jquerymobile.jqGrid.min.js"></script>
<script type="text/javascript" charset="utf-8" src="${basePath}jslib/js/grid.locale-cn.js"></script>
</head>
<body>
	<!-- Demo 一 -->
	<div id="page" data-role="page" data-theme="b">
		<div data-role="header">
			<h1>Listviews 测试列表视图一</h1>
		<a href="#" data-rel="back" data-icon="arrow-l" data-iconpos="notext" data-ajax="false">Back</a>
		</div>
		<table id="grid"></table>
		<div id="pager"></div>
	</div>
	
	
	<script type="text/javascript">
		<!-- demo 一,开始 -->
		jQuery("#grid").jqGrid({
			"hoverrows":false,
			"viewrecords":true,
			"jsonReader":{"repeatitems":false,"subgrid":{"repeatitems":false}},
			"gridview":true,
			"url":"data.json",
			"loadonce":true,
			"scrollPaging":true,
			"rowNum":10,
			"height":200,
			"autowidth":true,
			"sortname":"OrderID",
			"rowList":[10,20,30],
			"datatype":"json",
			"colModel":[
				{"name":"OrderID","index":"OrderID","sorttype":"int","key":true,"editable":true},
				{"name":"OrderDate","index":"OrderDate","sorttype":"datetime","formatter":"date",
					"formatoptions":{"srcformat":"Y-m-d H:i:s","newformat":"Y/m/d"},"search":false,"editable":true},
				{"name":"ShipName","index":"ShipName","sorttype":"String","classes":"ui-ellipsis","editable":true}
				
			],
			"pager":"#pager"
		});
		
		/* demo 二，开始  */
		/* jQuery("#grid2").jqGrid({
			"hoverrows":false,
			"viewrecords":{"repeatitems":false,"subgrid":{"repeatitems":false}},
			"gridview":true,
			"loadonce":true,
			"url":"datav.json",
			"srcollPaging":true,
			//"autowidth":true,
			"rowNum":20,
			"rowList":[20,40,60],
			"sortname":"ORderID",
			"height":200,
			"datatype":"json",
			"colModel":[
				{"name":"OrderID","index":"OrderID","sorttype":"int","key":true,"width":80,"editable":true},
				{"name":"OrderDate","index":"OrderDate","sorttype":"datetime","formatter":"date","formatoptions":{"srcformat":"Y-m-d H:i:s","newformat":"Y/m/d"},"editable":true},
				{"name":"ShipName","index":"ShipName","sorttype":"string","editable":true},
				{"name":"Freight","index":"Freight","sorttype":"numeric","editable":true}
			],
			"loadError":function(xhr,status,err){
				try {
					jQuery.jgrid.info_dialog(jQuery.jgrid.errors.errcap,'<div class="ui-state-error">'+ xhr.responseText +'</div>', jQuery.jgrid.edit.bClose,
					{buttonalign:'right'});
				} catch (e) {
					alert(xhr.responseText);
				}
			},
			"pager":"#pager2"
		}); */
	</script>
</body>
</html>