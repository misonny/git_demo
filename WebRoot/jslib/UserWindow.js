(function($){
	function buildDialog(target){
		var opts = $.data(target, 'userWindow').options;
		var tree=$("<ul>").appendTo($(target));
		tree.tree({
			url : opts.treeUrl,
			lines : true,
			checkbox:true,
			onlyLeafCheck:true,
			animate : true,
			onCheck : function(node, checked){
				
			},
			onBeforeCheck:function(node, checked){
				if(opts.singleSelect){
					if(checked){
						var nodes = tree.tree("getChecked");
						for(var i = 0;i<nodes.length;i++){
							tree.tree("uncheck",nodes[i].target);
						}
					}
				}
			},
			onClick : function(node) {
			}
		});
		
		$(target).dialog($.extend({}, opts, {
		title: opts.title+"[选择模式:"+(opts.singleSelect?"单选":"多选")+"]",
		buttons: [
		{
			text:'确认',
			iconCls:'icon-ok',
			handler:function(){
				var nodes = tree.tree("getChecked");
				if(nodes.length > 0){
					$(target).userWindow("close");
					opts.onSeleted.call(target,nodes);
				}else{
					$.messager.show({
						title : '提示',
						msg : '你没有选择人员'
					});
				}
			}
		},
		{
			text:'取消',
			iconCls:'icon-cancel',
			handler:function(){
				$(target).userWindow("close");
			}
		}
		]
		}));
	}
	
	$.fn.userWindow = function(options, param){
		if (typeof options == 'string'){
			var method = $.fn.userWindow.methods[options];
			if (method){
				return method(this, param);
			} else {
				return this.dialog(options, param);
			}
		}
		
		options = options || {};
		return this.each(function(){
			var state = $.data(this, 'userWindow');
			if (state){
				$.extend(state.options, options);
			} else {
				$.data(this, 'userWindow', {
					options: $.extend({}, $.fn.userWindow.defaults, $.fn.userWindow.parseOptions(this), options)
				});
			}
			buildDialog(this);
		});
	};
	
	$.fn.userWindow.parseOptions = function(target){
		return $.extend({}, $.fn.dialog.parseOptions(target), {});
	};
	
	$.fn.userWindow.methods = {
			options : function(jq) {
				return $.data(jq[0], "userWindow").options;
			}
	};
	
	$.fn.userWindow.defaults = $.extend({}, $.fn.dialog.defaults, {
		title : "请选择用户",
		width:250,
		height:400,
		treeUrl:'orgUserTree',
		singleSelect:true,
		onSeleted:function(nodes){}
	});
	
})(jQuery);