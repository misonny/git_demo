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

<!-- jquery mobile JS核心文件 -->
<script type="text/javascript" charset="utf-8" src="${basePath}jslib/jquery-easyui/jquery-1.8.0.min.js"></script>
<script type="text/javascript" charset="utf-8" src="${basePath}jslib/js/jquery.mobile-1.3.2.min.js"></script>
<script type="text/javascript" charset="utf-8" src="${basePath}jslib/js/jquerymobile.jqGrid.min.js"></script>
<script type="text/javascript" charset="utf-8" src="${basePath}jslib/js/grid.locale-cn.js"></script>

</head>
<body>
	<div data-role="page" id="foo" data-position="fixed">
		<div data-role="header">
			<h1>测试五顶部</h1>
			<a href="#" data-rel="back" data-icon="arrow-l" data-iconpos="notext" data-ajax="false">Black</a>
		</div>
		<!-- <div data-role="content"> -->
			<!-- ui-body-d 去除表格行线 -->
			<table data-role="table" id="table-column-toggle" data-mode="columntoggle" class="ui-shadow table-stroke ui-responsive" data-column-btn-theme="c" data-column-btn-text="Columns to display..." data-column-popup-theme="c">
				<thead>
					<tr class="ui-bar-d">
						<th data-priority="2" >序号</th>
						<th>标题</th>
						<th data-priority="3">年份</th>
						<th data-priority="1"><abbr title="Rotten Tomato Rating">点击率</abbr></th>
						<th data-priority="5">点击次数</th>
					</tr>
					
				</thead>
				<tbody>
					  <tr>
					    <th>1</th>
					    <td><a href="http://en.wikipedia.org/wiki/Citizen_Kane" data-rel="external">Citizen Kane</a></td>
					    <td>1941</td>
					    <td>100%</td>
					    <td>74</td>
					  </tr>
					  <tr>
					    <th>2</th>
					    <td><a href="http://en.wikipedia.org/wiki/Casablanca_(film)" data-rel="external">Casablanca</a></td>
					    <td>1942</td>
					    <td>97%</td>
					    <td>64</td>
					  </tr>
					  <tr>
					    <th>3</th>
					    <td><a href="http://en.wikipedia.org/wiki/The_Godfather" data-rel="external">The Godfather</a></td>
					    <td>1972</td>
					    <td>97%</td>
					    <td>87</td>
					  </tr>
					  <tr>
					    <th>4</th>
					    <td><a href="http://en.wikipedia.org/wiki/Gone_with_the_Wind_(film)" data-rel="external">Gone with the Wind</a></td>
					    <td>1939</td>
					    <td>96%</td>
					    <td>87</td>
					  </tr>
					  <tr>
					    <th>5</th>
					    <td><a href="http://en.wikipedia.org/wiki/Lawrence_of_Arabia_(film)" data-rel="external">Lawrence of Arabia</a></td>
					    <td>1962</td>
					    <td>94%</td>
					    <td>87</td>
					  </tr>
					  <tr>
					    <th>6</th>
					    <td><a href="http://en.wikipedia.org/wiki/Dr._Strangelove" data-rel="external">Dr. Strangelove Or How I Learned to Stop Worrying and Love the Bomb</a></td>
					    <td>1964</td>
					    <td>92%</td>
					    <td>74</td>
					  </tr>
					  <tr>
					    <th>7</th>
					    <td><a href="http://en.wikipedia.org/wiki/The_Graduate" data-rel="external">The Graduate</a></td>
					    <td>1967</td>
					    <td>91%</td>
					    <td>122</td>
					  </tr>
					  <tr>
					    <th>8</th>
					    <td><a href="http://en.wikipedia.org/wiki/The_Wizard_of_Oz_(1939_film)" data-rel="external">The Wizard of Oz</a></td>
					    <td>1939</td>
					    <td>90%</td>
					    <td>72</td>
					  </tr>
					  <tr>
					    <th>9</th>
					    <td><a href="http://en.wikipedia.org/wiki/Singin%27_in_the_Rain" data-rel="external">Singin' in the Rain</a></td>
					    <td>1952</td>
					    <td>89%</td>
					    <td>85</td>
					  </tr>
					  <tr>
					    <th>10</th>
					    <td class="title"><a href="http://en.wikipedia.org/wiki/Inception" data-rel="external">Inception</a></td>
					    <td>2010</td>
					    <td>84%</td>
					    <td>78</td>
					  </tr>
					</tbody>
			</table>
			
		<!-- </div> -->
		<div data-role="footer" data-position="fixed">
			<h2>Demo By <a href="http://t.qq.com/su_yangl?preview" target="_blank" style="text-decoration: none; ">苏洋</a></h2>
		</div>
	</div>
</body>
</html>