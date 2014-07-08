<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body >
	<div data-options="region:'west',split:true" title="West Menu" style="width:170px;padding1:1px;overflow:hidden; height: 100%;">  
        <div class="easyui-accordion" data-options="fit:true,border:false">  
            <div title="Title1" data-options="selected:true" style="padding:10px;overflow:auto;">  
                <ul style="list-style-type: none;">
                	<li style="padding-top: 3px;"><a href="jsp/mobile.jsp" class="easyui-linkbutton" >jquery-Mobile</a></li>
                	<li style="padding-top: 3px;"><a href="jsp/demo1.jsp" class="easyui-linkbutton" >jqGrid-Demo一</a> </li>
                	<li style="padding-top: 3px;"><a href="jsp/demo2.jsp" class="easyui-linkbutton" >jqGrid-Demo二</a></li>
                	<li style="padding-top: 3px;"><a href="jsp/demo3.jsp" class="easyui-linkbutton" >jqGrid-Demo三</a></li>
                	<li style="padding-top: 3px;"><p>content1</p> </li>
                	<li style="padding-top: 3px;"><p>content1</p> </li>
                </ul>
            </div>  
            <div title="Title2"  style="padding:10px;">  
                content2  
            </div>  
            <div title="Title3" style="padding:10px">  
                content3  
            </div>  
        </div>  
    </div> 
</body>
</html>