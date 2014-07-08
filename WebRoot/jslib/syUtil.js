/**
 * 包含easyui的扩展和常用的方法
 * 
 * @author
 * 
 * @version 20120806
 */

var sy = $.extend({}, sy);/* 定义全局对象，类似于命名空间或包的作用 */

/**
 * 
 * 取消easyui默认开启的parser
 * 
 * 在页面加载之前，先开启一个进度条
 * 
 * 然后在页面所有easyui组件渲染完毕后，关闭进度条
 * 
 * @author
 * 
 */
$.parser.auto = false;
$(function() {
	$.messager.progress({
		text : '页面加载中....',
		interval : 100
	});
	$.parser.parse(window.document);
	window.setTimeout(function() {
		$.messager.progress('close');
		if (self != parent) {
			window.setTimeout(function() {
				try {
					parent.$.messager.progress('close');
				} catch (e) {
				}
			}, 500);
		}
	}, 1);
	$.parser.auto = true;
});

/**
 * @author
 * 
 * 通用错误提示
 * 
 * 用于datagrid/treegrid/tree/combogrid/combobox/form加载数据出错时的操作
 */
var easyuiErrorFunction = function(XMLHttpRequest) {
	$.messager.progress('close');
	$.messager.alert('错误信息', XMLHttpRequest.responseText);
};
$.fn.datagrid.defaults.onLoadError = easyuiErrorFunction;
$.fn.treegrid.defaults.onLoadError = easyuiErrorFunction;
$.fn.tree.defaults.onLoadError = easyuiErrorFunction;
$.fn.combogrid.defaults.onLoadError = easyuiErrorFunction;
$.fn.combobox.defaults.onLoadError = easyuiErrorFunction;
$.fn.form.defaults.onLoadError = easyuiErrorFunction;

/**
 * @author
 * 
 * 为datagrid、treegrid增加表头菜单，用于显示或隐藏列，注意：冻结列不在此菜单中
 */
var createGridHeaderContextMenu = function(e, field) {
	e.preventDefault();
	var grid = $(this);/* grid本身 */
	var headerContextMenu = this.headerContextMenu;/* grid上的列头菜单对象 */
	if (!headerContextMenu) {
		var tmenu = $('<div style="width:100px;"></div>').appendTo('body');
		var fields = grid.datagrid('getColumnFields');
		for ( var i = 0; i < fields.length; i++) {
			var fildOption = grid.datagrid('getColumnOption', fields[i]);
			if (!fildOption.hidden) {
				$('<div iconCls="icon-ok" field="' + fields[i] + '"/>').html(
						fildOption.title).appendTo(tmenu);
			} else {
				$('<div iconCls="icon-empty" field="' + fields[i] + '"/>')
						.html(fildOption.title).appendTo(tmenu);
			}
		}
		headerContextMenu = this.headerContextMenu = tmenu.menu({
			onClick : function(item) {
				var field = $(item.target).attr('field');
				if (item.iconCls == 'icon-ok') {
					grid.datagrid('hideColumn', field);
					$(this).menu('setIcon', {
						target : item.target,
						iconCls : 'icon-empty'
					});
				} else {
					grid.datagrid('showColumn', field);
					$(this).menu('setIcon', {
						target : item.target,
						iconCls : 'icon-ok'
					});
				}
			}
		});
	}
	headerContextMenu.menu('show', {
		left : e.pageX,
		top : e.pageY
	});
};
//$.fn.datagrid.defaults.onHeaderContextMenu = createGridHeaderContextMenu;
//$.fn.treegrid.defaults.onHeaderContextMenu = createGridHeaderContextMenu;

var popuMenu = function(e, rowIndex, rowData) {
	e.preventDefault();
	$(this).datagrid('unselectAll');
	$(this).datagrid('selectRow', rowIndex);
	$('#menu').menu('show', {
		left : e.pageX,
		top : e.pageY
	});
};

$.fn.datagrid.defaults.onRowContextMenu = popuMenu;
$.fn.treegrid.defaults.onRowContextMenu = popuMenu;
$.fn.datagrid.defaults.onBeforeLoad = function(param){
	$(this).datagrid('clearChecked');
	$(this).datagrid('clearSelections');
};

/**
 * @author
 * 
 * 
 * 防止panel/window/dialog组件超出浏览器边界
 * @param left
 * @param top
 */
var easyuiPanelOnMove = function(left, top) {
	if (left < 0) {
		$(this).window('move', {
			left : 1
		});
	}
	if (top < 0) {
		$(this).window('move', {
			top : 1
		});
	}
	var width = $(this).panel('options').width;
	var height = $(this).panel('options').height;
	var right = left + width;
	var buttom = top + height;
	var browserWidth = $(document).width();
	var browserHeight = $(document).height();
	if (right > browserWidth) {
		$(this).window('move', {
			left : browserWidth - width
		});
	}
	if (buttom > browserHeight) {
		$(this).window('move', {
			top : browserHeight - height
		});
	}
};
$.fn.panel.defaults.onMove = easyuiPanelOnMove;
$.fn.window.defaults.onMove = easyuiPanelOnMove;
$.fn.dialog.defaults.onMove = easyuiPanelOnMove;

/**
 * @author
 * 
 * @requires jQuery,EasySSH
 * 
 * panel关闭时回收内存
 */
$.fn.panel.defaults.onBeforeDestroy = function() {
	var frame = $('iframe', this);
	try {
		if (frame.length > 0) {
			frame[0].contentWindow.document.write('');
			frame[0].contentWindow.close();
			frame.remove();
			if ($.browser.msie) {
				CollectGarbage();
			}
		}
	} catch (e) {
	}
};

/**
 * @author
 * 
 * 
 * 扩展datagrid，添加动态增加或删除Editor的方法
 * 
 * 例子如下，第二个参数可以是数组
 * 
 * datagrid.datagrid('removeEditor', 'cpwd');
 * 
 * datagrid.datagrid('addEditor', [ { field : 'ccreatedatetime', editor : { type :
 * 'datetimebox', options : { editable : false } } }, { field :
 * 'cmodifydatetime', editor : { type : 'datetimebox', options : { editable :
 * false } } } ]);
 * 
 * datagrid.datagrid('columnMoving');
 * 
 * $('#tt').datagrid("addToolbarItem",[{"text":"xxx"},"-",{"text":"xxxsss","iconCls":"icon-ok"}])
 * $('#tt').datagrid("removeToolbarItem","GetChanges")//根据btn的text删除
 * $('#tt').datagrid("removeToolbarItem",0)//根据下标删除
 */
$.extend($.fn.datagrid.methods,{
					addEditor : function(jq, param) {
						if (param instanceof Array) {
							$.each(param, function(index, item) {
								var e = $(jq).datagrid('getColumnOption',
										item.field);
								e.editor = item.editor;
							});
						} else {
							var e = $(jq).datagrid('getColumnOption',
									param.field);
							e.editor = param.editor;
						}
					},
					removeEditor : function(jq, param) {
						if (param instanceof Array) {
							$.each(param,
									function(index, item) {
										var e = $(jq).datagrid(
												'getColumnOption', item);
										e.editor = {};
									});
						} else {
							var e = $(jq).datagrid('getColumnOption', param);
							e.editor = {};
						}
					},
					columnMoving : function(jq) {
						return jq
								.each(function() {
									var target = this;
									var cells = $(this)
											.datagrid('getPanel')
											.find(
													'div.datagrid-header td[field]');
									cells
											.draggable(
													{
														revert : true,
														cursor : 'pointer',
														edge : 5,
														proxy : function(source) {
															var p = $(
																	'<div class="tree-node-proxy tree-dnd-no" style="position:absolute;border:1px solid #ff0000"/>')
																	.appendTo(
																			'body');
															p.html($(source)
																	.text());
															p.hide();
															return p;
														},
														onBeforeDrag : function(
																e) {
															e.data.startLeft = $(
																	this)
																	.offset().left;
															e.data.startTop = $(
																	this)
																	.offset().top;
														},
														onStartDrag : function() {
															$(this)
																	.draggable(
																			'proxy')
																	.css(
																			{
																				left : -10000,
																				top : -10000
																			});
														},
														onDrag : function(e) {
															$(this)
																	.draggable(
																			'proxy')
																	.show()
																	.css(
																			{
																				left : e.pageX + 15,
																				top : e.pageY + 15
																			});
															return false;
														}
													})
											.droppable(
													{
														accept : 'td[field]',
														onDragOver : function(
																e, source) {
															$(source)
																	.draggable(
																			'proxy')
																	.removeClass(
																			'tree-dnd-no')
																	.addClass(
																			'tree-dnd-yes');
															$(this)
																	.css(
																			'border-left',
																			'1px solid #ff0000');
														},
														onDragLeave : function(
																e, source) {
															$(source)
																	.draggable(
																			'proxy')
																	.removeClass(
																			'tree-dnd-yes')
																	.addClass(
																			'tree-dnd-no');
															$(this)
																	.css(
																			'border-left',
																			0);
														},
														onDrop : function(e,
																source) {
															$(this)
																	.css(
																			'border-left',
																			0);
															var fromField = $(
																	source)
																	.attr(
																			'field');
															var toField = $(
																	this).attr(
																	'field');
															setTimeout(
																	function() {
																		moveField(
																				fromField,
																				toField);
																		$(
																				target)
																				.datagrid();
																		$(
																				target)
																				.datagrid(
																						'columnMoving');
																	}, 0);
														}
													});

									// move field to another location
									function moveField(from, to) {
										var columns = $(target).datagrid(
												'options').columns;
										var cc = columns[0];
										var c = _remove(from);
										if (c) {
											_insert(to, c);
										}

										function _remove(field) {
											for ( var i = 0; i < cc.length; i++) {
												if (cc[i].field == field) {
													var c = cc[i];
													cc.splice(i, 1);
													return c;
												}
											}
											return null;
										}
										function _insert(field, c) {
											var newcc = [];
											for ( var i = 0; i < cc.length; i++) {
												if (cc[i].field == field) {
													newcc.push(c);
												}
												newcc.push(cc[i]);
											}
											columns[0] = newcc;
										}
									}
								});
					},
					addToolbarItem : function(jq, items) {
						return jq
								.each(function() {
									var toolbar = $(this).parent().prev(
											"div.datagrid-toolbar");
									for ( var i = 0; i < items.length; i++) {
										var item = items[i];
										if (item === "-") {
											toolbar
													.append('<div class="datagrid-btn-separator"></div>');
										} else {
											var btn = $("<a href=\"javascript:void(0)\"></a>");
											btn[0].onclick = eval(item.handler
													|| function() {
													});
											btn.css("float", "left").appendTo(
													toolbar).linkbutton(
													$.extend({}, item, {
														plain : true
													}));
										}
									}
									toolbar = null;
								});
					},
					removeToolbarItem : function(jq, param) {
						return jq
								.each(function() {
									var btns = $(this).parent().prev(
											"div.datagrid-toolbar").children(
											"a");
									var cbtn = null;
									if (typeof param == "number") {
										cbtn = btns.eq(param);
									} else if (typeof param == "string") {
										var text = null;
										btns
												.each(function() {
													text = $(this).data().linkbutton.options.text;
													if (text == param) {
														cbtn = $(this);
														text = null;
														return;
													}
												});
									}
									if (cbtn) {
										var prev = cbtn.prev()[0];
										var next = cbtn.next()[0];
										if (prev
												&& next
												&& prev.nodeName == "DIV"
												&& prev.nodeName == next.nodeName) {
											$(prev).remove();
										} else if (next
												&& next.nodeName == "DIV") {
											$(next).remove();
										} else if (prev
												&& prev.nodeName == "DIV") {
											$(prev).remove();
										}
										cbtn.remove();
										cbtn = null;
									}
								});
					}
				});

/**
 * @author
 * 
 * 
 * 扩展datagrid的editor
 * 
 * 增加带复选框的下拉树
 * 
 * 增加日期时间组件editor
 * 
 * 增加多选combobox组件
 * 
 * 增加checkbox
 */
$.extend($.fn.datagrid.defaults.editors,
	{			
					combocheckboxtree : {
						init : function(container, options) {
							var editor = $('<input />').appendTo(container);
							options.multiple = true;
							editor.combotree(options);
							return editor;
						},
						destroy : function(target) {
							$(target).combotree('destroy');
						},
						getValue : function(target) {
							return $(target).combotree('getValues').join(',');
						},
						setValue : function(target, value) {
							$(target).combotree('setValues', sy.getList(value));
						},
						resize : function(target, width) {
							$(target).combotree('resize', width);
						}
					},
					datetimebox : {
						init : function(container, options) {
							var editor = $('<input />').appendTo(container);
							editor.datetimebox(options);
							return editor;
						},
						destroy : function(target) {
							$(target).datetimebox('destroy');
						},
						getValue : function(target) {
							return $(target).datetimebox('getValue');
						},
						setValue : function(target, value) {
							$(target).datetimebox('setValue', value);
						},
						resize : function(target, width) {
							$(target).datetimebox('resize', width);
						}
					},
					multiplecombobox : {
						init : function(container, options) {
							var editor = $('<input />').appendTo(container);
							options.multiple = true;
							editor.combobox(options);
							return editor;
						},
						destroy : function(target) {
							$(target).combobox('destroy');
						},
						getValue : function(target) {
							return $(target).combobox('getValues').join(',');
						},
						setValue : function(target, value) {
							$(target).combobox('setValues', sy.getList(value));
						},
						resize : function(target, width) {
							$(target).combobox('resize', width);
						}
					},
					checkBox : {
						init : function(container, options) {
							var editor = $(
									"<input type='checkBox' value ='true'/>")
									.appendTo(container);
							return editor;
						},
						destroy : function(target) {
							$(target).remove();
						},
						getValue : function(target) {
							if ($(target).attr("checked")) {
								return true;
							}
							return false;
						},
						setValue : function(target, value) {
							if (value) {
								$(target).attr("checked", "checked");
							}
						},
						resize : function(target, width) {
						}
					},
					combogrid : {
						init : function(container, options) {
							var input = $(
									'<input type="text" class="datagrid-editable-input">')
									.appendTo(container);
							input.combogrid(options);
							return input;
						},
						destroy : function(target) {
							$(target).combogrid('destroy');
						},
						getValue : function(target) {
							return $(target).combogrid('getValue');
						},
						setValue : function(target, value) {
							$(target).combogrid('setValue', value);
						},
						resize : function(target, width) {
							$(target).combogrid('resize', width);
						}
					}
				});





/**
 * linkbutton方法扩展
 * @param {Object} jq
 */
$.extend($.fn.linkbutton.methods, {
    /**
     * 激活选项（覆盖重写）
     * @param {Object} jq
     */
    enable: function(jq){
        return jq.each(function(){
            var state = $.data(this, 'linkbutton');
            if ($(this).hasClass('l-btn-disabled')) {
                var itemData = state._eventsStore;
                //恢复超链接
                if (itemData && itemData.href) {
                    $(this).attr("href", itemData.href);
                }
                //回复点击事件
                if (itemData && itemData.onclicks) {
                    for (var j = 0; j < itemData.onclicks.length; j++) {
                        $(this).bind('click', itemData.onclicks[j]);
                    }
                }
                //设置target为null，清空存储的事件处理程序
                itemData.target = null;
                itemData.onclicks = [];
                $(this).removeClass('l-btn-disabled');
            }
        });
    },
    /**
     * 禁用选项（覆盖重写）
     * @param {Object} jq
     */
    disable: function(jq){
        return jq.each(function(){
            var state = $.data(this, 'linkbutton');
            
            if (!state._eventsStore) 
                state._eventsStore = {};
            if (!$(this).hasClass('l-btn-disabled')) {
                var eventsStore = {};
                eventsStore.target = this;
                eventsStore.onclicks = [];
                //处理超链接
                var strHref = $(this).attr("href");
                if (strHref) {
                    eventsStore.href = strHref;
                    $(this).attr("href", "javascript:void(0)");
                }
                //处理直接耦合绑定到onclick属性上的事件
                var onclickStr = $(this).attr("onclick");
                if (onclickStr && onclickStr != "") {
                    eventsStore.onclicks[eventsStore.onclicks.length] = new Function(onclickStr);
                    $(this).attr("onclick", "");
                }
                //处理使用jquery绑定的事件
                var eventDatas = $(this).data("events") || $._data(this, 'events');
                if (eventDatas["click"]) {
                    var eventData = eventDatas["click"];
                    for (var i = 0; i < eventData.length; i++) {
                        if (eventData[i].namespace != "menu") {
                            eventsStore.onclicks[eventsStore.onclicks.length] = eventData[i]["handler"];
                            $(this).unbind('click', eventData[i]["handler"]);
                            i--;
                        }
                    }
                }
                state._eventsStore = eventsStore;
                $(this).addClass('l-btn-disabled');
            }
        });
    }
});

/**
 * menu方法扩展
 * @param {Object} jq
 * @param {Object} itemEl
 */
$.extend($.fn.menu.methods, {
	/**
	 * 激活选项（覆盖重写）
	 * @param {Object} jq
	 * @param {Object} itemEl
	 */
	enableItem : function(jq, itemEl) { 
        return jq.each(function(){
            var jqElements = $(itemEl);
            var state = $.data(this, 'menu');
            
            if (jqElements.length > 0) {
                jqElements.each(function(){
                    if ($(this).hasClass('menu-item-disabled')) {
						for(var i=0; i<state._eventsStore.length; i++){
							var itemData = state._eventsStore[i];
							if(itemData.target == this){
								//恢复超链接
								if (itemData.href) {
                            		$(this).attr("href", itemData.href);
                        		}
								//回复点击事件
                        		if (itemData.onclicks) {
                            		for (var j = 0; j < itemData.onclicks.length; j++) {
                                		$(this).bind('click', itemData.onclicks[j]);
                            		}
                        		}
								//设置target为null，清空存储的事件处理程序
								itemData.target = null;
								itemData.onclicks = [];
                        		$(this).removeClass('menu-item-disabled');
							}
						}
                    }
                });
            }
        });
	},
/**
 * 禁用选项（覆盖重写）
 * @param {Object} jq
 * @param {Object} itemEl
 */
disableItem : function(jq, itemEl) {
	return jq.each(function() {
		var jqElements = $(itemEl);
        var state = $.data(this,'menu');
        
        if (jqElements.length > 0) {
            if (!state._eventsStore) 
                state._eventsStore = [];
            jqElements.each(function(){
                if (!$(this).hasClass('menu-item-disabled')) {
                    var backStore = {};
					backStore.target = this;
					backStore.onclicks = [];
					//处理超链接
                    var strHref = $(this).attr("href");
                    if (strHref) {
                        backStore.href = strHref;
                        $(this).attr("href", "javascript:void(0)");
                    }
                    //处理直接耦合绑定到onclick属性上的事件
                    var onclickStr = $(this).attr("onclick");
                    if (onclickStr && onclickStr != "") {
                        backStore.onclicks[backStore.onclicks.length] = new Function(onclickStr);
                        $(this).attr("onclick", "");
                    }
					//处理使用jquery绑定的事件
                    var eventDatas = $(this).data("events") || $._data(this, 'events');
                    if (eventDatas["click"]) {
                        var eventData = eventDatas["click"];
                        for (var i = 0; i < eventData.length; i++) {
                            if (eventData[i].namespace != "menu") {
                                backStore.onclicks[backStore.onclicks.length] = eventData[i]["handler"];
                                $(this).unbind('click', eventData[i]["handler"]);
                                i--;
                            }
                        }
                    }
					//遍历_eventsStore数组，如果有target为null的元素，则利用起来
					var isStored = false;
					for(var j=0; j<state._eventsStore.length; j++){
						var itemData = state._eventsStore[j];
						if(itemData.target==null){
							isStored = true;
							state._eventsStore[j] = backStore;
						}
					}
					//没有现成的，则push进去
					if(isStored==false){
						state._eventsStore[state._eventsStore.length] = backStore;
					}
                    $(this).addClass('menu-item-disabled');
                }
            });
         }
	});
	}
});


/**
 * @author
 * 
 * @requires jQuery,EasySSH,jQuery cookie plugin
 * 
 * 更换EasySSH主题的方法
 * 
 * @param themeName
 *            主题名称
 */
sy.changeTheme = function(themeName) {
	var $easyuiTheme = $('#easyuiTheme');
	var url = $easyuiTheme.attr('href');
	var href = url.substring(0, url.indexOf('themes')) + 'themes/' + themeName
			+ '/easyui.css';
	$easyuiTheme.attr('href', href);

	var $iframe = $('iframe');
	if ($iframe.length > 0) {
		for ( var i = 0; i < $iframe.length; i++) {
			var ifr = $iframe[i];
			$(ifr).contents().find('#easyuiTheme').attr('href', href);
		}
	}

	$.cookie('easyuiThemeName', themeName, {
		expires : 7
	});
};

/**
 * @author
 * 
 * 获得项目根路径
 * 
 * 使用方法：sy.bp();
 * 
 * @returns 项目根路径
 */
sy.bp = function() {
	var curWwwPath = window.document.location.href;
	var pathName = window.document.location.pathname;
	var pos = curWwwPath.indexOf(pathName);
	var localhostPaht = curWwwPath.substring(0, pos);
	var projectName = pathName
			.substring(0, pathName.substr(1).indexOf('/') + 1);
	return (localhostPaht + projectName);
};

/**
 * @author
 * 
 * 使用方法:sy.pn();
 * 
 * @returns 项目名称
 */
sy.pn = function() {
	return window.document.location.pathname.substring(0,
			window.document.location.pathname.indexOf('\/', 1));
};

/**
 * @author
 * 
 * 增加formatString功能
 * 
 * 使用方法：sy.fs('字符串{0}字符串{1}字符串','第一个变量','第二个变量');
 * 
 * @returns 格式化后的字符串
 */
sy.fs = function(str) {
	for ( var i = 0; i < arguments.length - 1; i++) {
		str = str.replace("{" + i + "}", arguments[i + 1]);
	}
	return str;
};

/**
 * @author 郭华(夏悸)
 * 
 * 生成UUID
 * 
 * @returns UUID字符串
 */
sy.random4 = function() {
	return (((1 + Math.random()) * 0x10000) | 0).toString(16).substring(1);
};
sy.UUID = function() {
	return (sy.random4() + sy.random4() + "-" + sy.random4() + "-"
			+ sy.random4() + "-" + sy.random4() + "-" + sy.random4()
			+ sy.random4() + sy.random4());
};

/**
 * @author
 * 
 * 接收一个以逗号分割的字符串，返回List，list里每一项都是一个字符串
 * 
 * @returns list
 */
sy.getList = function(value) {
	if (value != undefined && value != '') {
		var values = [];
		var t = value.split(',');
		for ( var i = 0; i < t.length; i++) {
			values.push('' + t[i]);/* 避免他将ID当成数字 */
		}
		return values;
	} else {
		return [];
	}
};

/**
 * @author
 * 
 * @requires jQuery
 * 
 * 判断浏览器是否是IE并且版本小于8
 * 
 * @returns true/false
 */
sy.isLessThanIe8 = function() {
	return ($.browser.msie && $.browser.version < 8);
};

/**
 * @author
 * 
 * @requires jQuery
 * 
 * 将form表单元素的值序列化成对象
 * 
 * @returns object
 */
sy.serializeObject = function(form) {
	var o = {};
	$.each(form.serializeArray(), function(index) {
		if (o[this['name']]) {
			o[this['name']] = o[this['name']] + "," + this['value'];
		} else {
			o[this['name']] = this['value'];
		}
	});
	return o;
};

/**
 * 
 * 将JSON对象转换成字符串
 * 
 * @param o
 * @returns string
 */
sy.jsonToString = function(o) {
	var r = [];
	if (typeof o == "string")
		return "\""
				+ o.replace(/([\'\"\\])/g, "\\$1").replace(/(\n)/g, "\\n")
						.replace(/(\r)/g, "\\r").replace(/(\t)/g, "\\t") + "\"";
	if (typeof o == "object") {
		if (!o.sort) {
			for ( var i in o)
				r.push(i + ":" + obj2str(o[i]));
			if (!!document.all
					&& !/^\n?function\s*toString\(\)\s*\{\n?\s*\[native code\]\n?\s*\}\n?\s*$/
							.test(o.toString)) {
				r.push("toString:" + o.toString.toString());
			}
			r = "{" + r.join() + "}";
		} else {
			for ( var i = 0; i < o.length; i++)
				r.push(obj2str(o[i]));
			r = "[" + r.join() + "]";
		}
		return r;
	}
	return o.toString();
};

sy.showUEditorContent = function(){
	setTimeout(function(){
		uParse('div',
			{'highlightJsUrl':'${basePath}jslib/ueditor/third-party/SyntaxHighlighter/shCore.js',
			'highlightCssUrl':'${basePath}jslib/ueditor/third-party/SyntaxHighlighter/shCoreDefault.css'})
			},200);
};


/**
 * @author 郑承举
 * 
 * 格式化日期时间
 * 
 * @param format
 * @returns
 */
Date.prototype.format = function(format) {
	if (isNaN(this.getMonth())) {
		return '';
	}
	if (!format) {
		format = "yyyy-MM-dd hh:mm:ss";
	}
	var o = {
		/* month */
		"M+" : this.getMonth() + 1,
		/* day */
		"d+" : this.getDate(),
		/* hour */
		"h+" : this.getHours(),
		/* minute */
		"m+" : this.getMinutes(),
		/* second */
		"s+" : this.getSeconds(),
		/* quarter */
		"q+" : Math.floor((this.getMonth() + 3) / 3),
		/* millisecond */
		"S" : this.getMilliseconds()
	};
	if (/(y+)/.test(format)) {
		format = format.replace(RegExp.$1, (this.getFullYear() + "")
				.substr(4 - RegExp.$1.length));
	}
	for ( var k in o) {
		if (new RegExp("(" + k + ")").test(format)) {
			format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k]
					: ("00" + o[k]).substr(("" + o[k]).length));
		}
	}
	return format;
};

/**
 * @author
 * 
 * @requires jQuery
 * 
 * 改变jQuery的AJAX默认属性和方法
 */
$.ajaxSetup({
	type : 'POST',
	error : function(XMLHttpRequest, textStatus, errorThrown) {
		$.messager.progress('close');
		//$.messager.alert('错误', XMLHttpRequest.responseText);
	}
});

/**
 * 数据状态
 */
var statusJson = [ {
	"id" : "Enable",
	"text" : "启用"
}, {
	"id" : "Disable",
	"text" : "停用"
} ];

/**
 * 图标
 */
var iconData = [ {
	value : '',
	text : '默认'
}, {
	value : 'icon-annex',
	text : 'icon-annex'
}, {
	value : 'icon-bars',
	text : 'icon-bars'
}, {
	value : 'icon-bing',
	text : 'icon-bing'
}, {
	value : 'icon-blue',
	text : 'icon-blue'
}, {
	value : 'icon-casa',
	text : 'icon-casa'
}, {
	value : 'icon-calc',
	text : 'icon-calc'
}, {
	value : 'icon-cale',
	text : 'icon-cale'
}, {
	value : 'icon-conf',
	text : 'icon-conf'
}, {
	value : 'icon-danr',
	text : 'icon-danr'
}, {
	value : 'icon-ding',
	text : 'icon-ding'
}, {
	value : 'icon-doll',
	text : 'icon-doll'
}, {
	value : 'icon-duot',
	text : 'icon-duot'
}, {
	value : 'icon-eart',
	text : 'icon-eart'
}, {
	value : 'icon-face',
	text : 'icon-face'
}, {
	value : 'icon-find',
	text : 'icon-find'
}, {
	value : 'icon-gold',
	text : 'icon-gold'
}, {
	value : 'icon-gole',
	text : 'icon-gole'
}, {
	value : 'icon-gree',
	text : 'icon-gree'
}, {
	value : 'icon-grou',
	text : 'icon-grou'
}, {
	value : 'icon-hard',
	text : 'icon-hard'
}, {
	value : 'icon-hihi',
	text : 'icon-hihi'
}, {
	value : 'icon-hibo',
	text : 'icon-hibo'
}, {
	value : 'icon-hoho',
	text : 'icon-hoho'
}, {
	value : 'icon-home',
	text : 'icon-home'
}, {
	value : 'icon-hote',
	text : 'icon-hote'
}, {
	value : 'icon-inpu',
	text : 'icon-inpu'
}, {
	value : 'icon-keys',
	text : 'icon-keys'
}, {
	value : 'icon-limi',
	text : 'icon-limi'
}, {
	value : 'icon-lock',
	text : 'icon-lock'
}, {
	value : 'icon-love',
	text : 'icon-love'
}, {
	value : 'icon-mans',
	text : 'icon-mans'
}, {
	value : 'icon-mous',
	text : 'icon-mous'
}, {
	value : 'icon-newd',
	text : 'icon-newd'
}, {
	value : 'icon-offe',
	text : 'icon-offe'
}, {
	value : 'icon-orde',
	text : 'icon-orde'
}, {
	value : 'icon-pass',
	text : 'icon-pass'
}, {
	value : 'icon-pens',
	text : 'icon-pens'
}, {
	value : 'icon-penc',
	text : 'icon-penc'
}, {
	value : 'icon-prin',
	text : 'icon-prin'
}, {
	value : 'icon-quxi',
	text : 'icon-quxi'
}, {
	value : 'icon-relo',
	text : 'icon-relo'
}, {
	value : 'icon-rmbs',
	text : 'icon-rmbs'
}, {
	value : 'icon-road',
	text : 'icon-road'
}, {
	value : 'icon-sand',
	text : 'icon-sand'
}, {
	value : 'icon-seal',
	text : 'icon-seal'
}, {
	value : 'icon-shee',
	text : 'icon-shee'
}, {
	value : 'icon-spec',
	text : 'icon-spec'
}, {
	value : 'icon-star',
	text : 'icon-star'
}, {
	value : 'icon-stgo',
	text : 'icon-stgo'
}, {
	value : 'icon-talk',
	text : 'icon-talk'
}, {
	value : 'icon-task',
	text : 'icon-task'
}, {
	value : 'icon-user',
	text : 'icon-user'
}, {
	value : 'icon-yiyi',
	text : 'icon-yiyi'
}, {
	value : 'icon-yuan',
	text : 'icon-yuan'
}, {
	value : 'icon-zhen',
	text : 'icon-zhen'
}, {
	value : 'icon-zhus',
	text : 'icon-zhus'
}, {
	value : 'icon-add',
	text : 'icon-add'
}, {
	value : 'icon-edit',
	text : 'icon-edit'
}, {
	value : 'icon-remove',
	text : 'icon-remove'
}, {
	value : 'icon-save',
	text : 'icon-save'
}, {
	value : 'icon-cut',
	text : 'icon-cut'
}, {
	value : 'icon-ok',
	text : 'icon-ok'
}, {
	value : 'icon-no',
	text : 'icon-no'
}, {
	value : 'icon-cancel',
	text : 'icon-cancel'
}, {
	value : 'icon-reload',
	text : 'icon-reload'
}, {
	value : 'icon-search',
	text : 'icon-search'
}, {
	value : 'icon-print',
	text : 'icon-print'
}, {
	value : 'icon-help',
	text : 'icon-help'
}, {
	value : 'icon-undo',
	text : 'icon-undo'
}, {
	value : 'icon-redo',
	text : 'icon-redo'
}, {
	value : 'icon-back',
	text : 'icon-back'
}, {
	value : 'icon-sum',
	text : 'icon-sum'
}, {
	value : 'icon-tip',
	text : 'icon-tip'
} ];

/**
 * 性别状态
 */
var sexJson = [ {
	"id" : 0,
	"text" : "男"
}, {
	"id" : 1,
	"text" : "女"
} ];

/**
 * 数据字典Key
 */
var DicTypeJson = [ {
	"id" : 1,
	"text" : "政治面貌"
}, {
	"id" : 2,
	"text" : "职务"
}, {
	"id" : 3,
	"text" : "门户类别"
},
{
	"id" : 4,
	"text" : "员工状态"
},
{
	"id" : 5,
	"text" : "外语语种"
},
{
	"id" : 6,
	"text" : "外语水平"
},
{
	"id" : 7,
	"text" : "学历"
},
{
	"id" : 8,
	"text" : "电脑水平"
},
{
	"id" : 9,
	"text" : "资源类别"
},
{
	"id" : 10,
	"text" : "加班基本工资(金额/天)"
}];

/**
 * workType
 */
var workType = [ {
	"id" : 1,
	"text" : "工作日志"
}, {
	"id" : 2,
	"text" : "周计划"
}, {
	"id" : 3,
	"text" : "月计划"
},
{
	"id" : 4,
	"text" : "季度计划"
},
{
	"id" : 5,
	"text" : "年度计划"
},
{
	"id" : 6,
	"text" : "周总结"
},
{
	"id" : 7,
	"text" : "月总结"
},
{
	"id" : 8,
	"text" : "季度总结"
},
{
	"id" : 9,
	"text" : "年度总结"
}];



/*通过 工作的各种类型的text 来查找ID*/
function findWorkTypeIdByText(value) {
	for ( var i = 0; i < workType.length; i++) {
		if (workType[i].text == value)
			return workType[i].id;
	}
	return value;
};

function statusFormat(value) {
	for ( var i = 0; i < statusJson.length; i++) {
		if (statusJson[i].id == value)
			return statusJson[i].text;
	}
	return value;
};

function sexFormat(value) {
	for ( var i = 0; i < sexJson.length; i++) {
		if (sexJson[i].id == value)
			return sexJson[i].text;
	}
	return value;
};

function checkboxFormat(value){
	return "<input type='checkBox' value ='true' disabled='disabled' "+(value ? "checked='checked'" : "")+"/>";
}

function daysBetween(DateOne, DateTwo) {
	var OneMonth = DateOne.substring(5, DateOne.lastIndexOf('-'));
	var OneDay = DateOne
			.substring(DateOne.length, DateOne.lastIndexOf('-') + 1);
	var OneYear = DateOne.substring(0, DateOne.indexOf('-'));

	var TwoMonth = DateTwo.substring(5, DateTwo.lastIndexOf('-'));
	var TwoDay = DateTwo
			.substring(DateTwo.length, DateTwo.lastIndexOf('-') + 1);
	var TwoYear = DateTwo.substring(0, DateTwo.indexOf('-'));

	var cha = ((Date.parse(OneMonth + '/' + OneDay + '/' + OneYear) - Date
			.parse(TwoMonth + '/' + TwoDay + '/' + TwoYear)) / 86400000);
	return cha;
}


//会议大盘表Json 用于查表
var dateMap={
		1:["00:00:00","08:00:00"],
		
		2:["08:00:00","08:30:00"],
		3:["08:30:00","09:00:00"],
		
		4:["09:00:00","09:30:00"],
		5:["09:30:00","10:00:00"],
		
		6:["10:00:00","10:30:00"],
		7:["10:30:00","11:00:00"],
		
		8:["11:00:00","11:30:00"],
		9:["11:30:00","12:00:00"],
		
		10:["12:00:00","12:30:00"],
		11:["12:30:00","13:00:00"],
		
		12:["13:00:00","13:30:00"],
		13:["13:30:00","14:00:00"],
		
		14:["14:00:00","14:30:00"],
		15:["14:30:00","15:00:00"],
		
		16:["15:00:00","15:30:00"],
		17:["15:30:00","16:00:00"],
		
		18:["16:00:00","16:30:00"],
		19:["16:30:00","17:00:00"],
		
		20:["17:00:00","17:30:00"],
		21:["17:30:00","18:00:00"],
		
		22:["18:00:00","18:30:00"],
		23:["18:30:00","19:00:00"],
		
		24:["19:00:00","19:30:00"],
		25:["19:30:00","20:00:00"],
		
		26:["20:00:00","20:30:00"],
		27:["20:30:00","21:00:00"],
		
		28:["21:00:00","00:00:00"]
		
};

String.prototype.trim = function() {
	return this.replace(/^\s+|\s+$/g, '');
};

String.prototype.replaceAll = function(s1, s2) {      
	return this.replace(new RegExp(s1, "gm"), s2); //g全局     
};

//设置input,textarea默认值
$.fn.setDefauleValue = function() {
    var defauleValue = $(this).val();
    $(this).val(defauleValue).css("color","#999");
 
    return this.each(function() {      
        $(this).focus(function() {
            if ($(this).val() == defauleValue) {
                $(this).val("").css("color","#000");//输入值的颜色
            }
        }).blur(function() {
            if ($(this).val() == "") {
                $(this).val(defauleValue).css("color","#999");//默认值的颜色
            }
        });
    });
}

$.fn.setDivDefauleValue = function() {
    var defauleValue = $(this).html();
    $(this).html(defauleValue).css("color","#999");
 
    return this.each(function() {      
        $(this).focus(function() {
            if ($(this).html() == defauleValue) {
                $(this).html("").css("color","#000");//输入值的颜色
            }
        }).blur(function() {
            if ($(this).html() == "") {
                $(this).html(defauleValue).css("color","#999");//默认值的颜色
            }
        });
    });
}

//下面这个方法是将json对象转换为字符串
function obj2str(o){
    var r = [];
    if(typeof o =="string") return "\""+o.replace(/([\'\"\\])/g,"\\$1").replace(/(\n)/g,"\\n").replace(/(\r)/g,"\\r").replace(/(\t)/g,"\\t")+"\"";
    if(typeof o =="undefined") return "undefined";
    if(typeof o == "object"){
        if(o===null) return "null";
        else if(!o.sort){
            for(var i in o)
                r.push(i+":"+obj2str(o[i]))
            r="{"+r.join()+"}"
        }else{
            for(var i =0;i<o.length;i++)
                r.push(obj2str(o[i]))
            r="["+r.join()+"]"
        }
        return r;
    }
    return o.toString();
}
