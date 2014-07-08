<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, minimum-scale=1, maximum-scale=1">
<title>jQuery-mobile、jgGrid-Demo</title>
<!-- jquery mobile 样式 -->
<link rel="stylesheet" href="${basePath}css/jquery.mobile-1.3.2.min.css" type="text/css"></link> 
<link rel="stylesheet" href="${basePath}css/ui.jqgridmobile.css" type="text/css"></link> 

<!-- jquery mobile JS核心文件 -->
<script type="text/javascript" charset="utf-8" src="${basePath}jslib/jquery-easyui/jquery-1.8.0.min.js"></script>
<script type="text/javascript" charset="utf-8" src="${basePath}jslib/js/jquery.mobile-1.3.2.min.js"></script>
<script type="text/javascript" charset="utf-8" src="${basePath}jslib/js/jquerymobile.jqGrid.min.js"></script>
<script type="text/javascript" charset="utf-8" src="${basePath}jslib/js/grid.locale-cn.js"></script>

</head>
<body>
	<!-- Demo 四 -->
	<div data-role="page" data-theme="b" data-dom-cache="false" id="page-1"">
		<div data-role="header" data-theme="a" style="margin-bottom: 10px" data-position="fixed">
			<h1>测试列表四</h1>
			<a href="#" data-rel="back" data-icon="arrow-l" data-iconpos="notext" data-ajax="false">Back</a>
		</div>
		
		<div data-role="content" data-theme="e" >
				<ul data-role="listview" data-inset="true"> 
					<li> 
						<h3>Animals</h3> 
						<p>All your favorites from aarkvarks to zebras.</p> 
						<ul> 
							<li>
								<div>Pets</div>
								<span class="ui-li-count">6</span>
								<ul>
									<li><a href="example2.html">Canary</a></li>
									<li><a href="example2.html">Cat</a></li>
									<li><a href="example2.html">Dog</a></li>
									<li><a href="example2.html">Gerbil</a></li>
									<li><a href="example2.html">Iguana</a></li>
									<li><a href="example2.html">Mouse</a></li>
								</ul>
							</li>
							<li>
								<div>Farm animals</div>
								<p class="ui-li-count">6</p>
								<ul>
									<li><a href="example2.html">Chicken</a></li>
									<li><a href="example2.html">Cow</a></li>
									<li><a href="example2.html">Duck</a></li>
									<li><a href="example2.html">Horse</a></li>
									<li><a href="example2.html">Pig</a></li>
									<li><a href="example2.html">Sheep</a></li>
								</ul>
							</li>
							<li>
								<div>Wild animals</div>
								<p class="ui-li-count">18</p>
								<ul>
									<li><a href="example2.html">Aardvark</a></li>
									<li><a href="example2.html">Alligator</a></li>
									<li><a href="example2.html">Ant</a></li>
									<li><a href="example2.html">Bear</a></li>
									<li><a href="example2.html">Beaver</a></li>
									<li><a href="example2.html">Cougar</a></li>
									<li><a href="example2.html">Dingo</a></li>
									<li><a href="example2.html">Eagle</a></li>
									<li><a href="example2.html">Elephant</a></li>
									<li><a href="example2.html">Ferret</a></li>
									<li><a href="example2.html">Frog</a></li>
									<li><a href="example2.html">Giraffe</a></li>
									<li><a href="example2.html">Lion</a></li>
									<li><a href="example2.html">Monkey</a></li>
									<li><a href="example2.html">Panda bear</a></li>
									<li><a href="example2.html">Polar bear</a></li>
									<li><a href="example2.html">Tiger</a></li>
									<li><a href="example2.html">Zebra</a></li>
								</ul>
							</li>
						</ul> 
					</li> 
					<li> 
						<a href="#page-2">
							<h3>Colors</h3> 
							<p>Fresh colors from the magic rainbow.</p> 
						</a>
					</li> 
					<li> 
						<h3>Vehicles</h3> 
						<p>Everything from cars to planes.</p> 
						<ul> 
							<li>
								<div>Cars</div>
								<span class="ui-li-count">22</span>
								<ul>
									<li><a href="example2.html">Acura</a></li>
									<li><a href="example2.html">Audi</a></li>
									<li><a href="example2.html">BMW</a></li>
									<li><a href="example2.html">Cadillac</a></li>
									<li><a href="example2.html">Chrysler</a></li>
									<li><a href="example2.html">Dodge</a></li>
									<li><a href="example2.html">Ferrari</a></li>
									<li><a href="example2.html">Ford</a></li>
									<li><a href="example2.html">GMC</a></li>
									<li><a href="example2.html">Honda</a></li>
									<li><a href="example2.html">Hyundai</a></li>
									<li><a href="example2.html">Infiniti</a></li>
									<li><a href="example2.html">Jeep</a></li>
									<li><a href="example2.html">Kia</a></li>
									<li><a href="example2.html">Lexus</a></li>
									<li><a href="example2.html">Mini</a></li>
									<li><a href="example2.html">Nissan</a></li>
									<li><a href="example2.html">Porsche</a></li>
									<li><a href="example2.html">Subaru</a></li>
									<li><a href="example2.html">Toyota</a></li>
									<li><a href="example2.html">Volkswagon</a></li>
									<li><a href="example2.html">Volvo</a></li>
								</ul>
							</li>
							<li>
								<div>Planes</div>
								<span class="ui-li-count">7</span>
								<ul>
									<li><a href="example2.html">Boeing</a></li>
									<li><a href="example2.html">Cessna</a></li>
									<li><a href="example2.html">Derringer</a></li>
									<li><a href="example2.html">Embraer</a></li>
									<li><a href="example2.html">Gulfstream</a></li>
									<li><a href="example2.html">Piper Aircraft</a></li>
									<li><a href="example2.html">Raytheon</a></li>
								</ul>
							</li>
							<li>
								<div>Construction</div>
								<span class="ui-li-count">3</span>
								<ul>
									<li><a href="example2.html">Caterpillar</a></li>
									<li><a href="example2.html">Ford</a></li>
									<li><a href="example2.html">John Deere</a></li>
								</ul>
							</li>
						</ul> 
					</li> 
				</ul> 
			</div>
			<div data-role="footer" data-theme="a"  data-position="fixed">
				<h2>Demo By <a href="http://t.qq.com/su_yangl?preview" target="_blank" style="text-decoration: none; ">苏洋</a></h2>
			</div>
		</div> <!-- #page-1 结束 -->
		<div data-role="psge" id="page-2">	
			<div data-role="header" data-position="fixed">
				<a href="#home" data-rel="back" data-icon="delete">取消</a>
				<h1>固定位置的全屏工具栏</h1>
			</div>
					<ul data-role="listview" data-inset="true"> 
						<li><a href="example3.html">The Godfather</a></li> 
						<li><a href="example3.html">Inception</a></li> 
						<li><a href="example3.html">The Good, the Bad and the Ugly </a></li> 
						<li><a href="example3.html">Pulp Fiction</a></li> 
						<li><a href="example3.html">Schindler's List</a></li> 
					</ul>
			<div data-role="footer" data-theme="a"  data-position="fixed">
				<h2>Demo By <a href="http://t.qq.com/su_yangl?preview" target="_blank" style="text-decoration: none; ">苏洋</a></h2>
			</div>
		</div>
</body>
</html>