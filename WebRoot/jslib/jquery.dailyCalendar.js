(function($) {

	function setSize(target) {
		var opts = $.data(target, 'dailyCalendar').options;
		var t = $(target);
		if (opts.fit == true) {
			var p = t.parent();
			opts.width = p.width();
			opts.height = p.height();
		}
		var header = t.find('.calendar-header');
		t._outerWidth(opts.width);
		t._outerHeight(opts.height);
		t.find('.calendar-body')._outerHeight(
				t.height() - header._outerHeight());
	}

	function init(target) {
		$(target)
				.addClass('calendar')
				.wrapInner('<div class="calendar-header">'
								+ '<div class="calendar-prevmonth"></div>'
								+ '<div class="calendar-nextmonth"></div>'
								+ '<div class="calendar-prevyear"></div>'
								+ '<div class="calendar-nextyear"></div>'
								+ '<div class="calendar-title">'
								+ '<span>2013</span>'
								+ '</div>'
								+ '</div>'
								+ '<div class="calendar-body" style="overflow: auto;">'
								+ '<div class="calendar-menu">'
								+ '<div class="calendar-menu-year-inner">'
								+ '<span class="calendar-menu-prev"></span>'
								+ '<span><input class="calendar-menu-year" type="text"></input></span>'
								+ '<span class="calendar-menu-next"></span>'
								+ '</div>'
								+ '<div class="calendar-menu-month-inner">'
								+ '</div>' + '</div>' + '</div>');

		$(target).find('.calendar-title span').hover(function() {
			$(this).addClass('calendar-menu-hover');
		}, function() {
			$(this).removeClass('calendar-menu-hover');
		}).click(function() {
			var menu = $(target).find('.calendar-menu');
			if (menu.is(':visible')) {
				menu.hide();
			} else {
				showSelectMenus(target);
			}
		});

		$(
				'.calendar-prevmonth,.calendar-nextmonth,.calendar-prevyear,.calendar-nextyear',
				target).hover(function() {
			$(this).addClass('calendar-nav-hover');
		}, function() {
			$(this).removeClass('calendar-nav-hover');
		});
		$(target).find('.calendar-nextmonth').click(function() {
			showMonth(target, 1);
		});
		$(target).find('.calendar-prevmonth').click(function() {
			showMonth(target, -1);
		});
		$(target).find('.calendar-nextyear').click(function() {
			showYear(target, 1);
		});
		$(target).find('.calendar-prevyear').click(function() {
			showYear(target, -1);
		});

		$(target).bind('_resize', function() {
			var opts = $.data(target, 'dailyCalendar').options;
			if (opts.fit == true) {
				setSize(target);
			}
			return false;
		});
	}

	/**
	 * show the calendar corresponding to the current month.
	 */
	function showMonth(target, delta) {
		var opts = $.data(target, 'dailyCalendar').options;
		opts.month += delta;
		if (opts.month > 12) {
			opts.year++;
			opts.month = 1;
		} else if (opts.month < 1) {
			opts.year--;
			opts.month = 12;
		}
		show(target);

		var menu = $(target).find('.calendar-menu-month-inner');
		menu.find('td.calendar-selected').removeClass('calendar-selected');
		menu.find('td:eq(' + (opts.month - 1) + ')').addClass(
				'calendar-selected');
	}

	/**
	 * show the calendar corresponding to the current year.
	 */
	function showYear(target, delta) {
		var opts = $.data(target, 'dailyCalendar').options;
		opts.year += delta;
		show(target);

		var menu = $(target).find('.calendar-menu-year');
		menu.val(opts.year);
	}

	/**
	 * show the select menu that can change year or month, if the menu is not be
	 * created then create it.
	 */
	function showSelectMenus(target) {
		var opts = $.data(target, 'dailyCalendar').options;
		$(target).find('.calendar-menu').show();

		if ($(target).find('.calendar-menu-month-inner').is(':empty')) {
			$(target).find('.calendar-menu-month-inner').empty();
			var t = $('<table></table>').appendTo(
					$(target).find('.calendar-menu-month-inner'));
			var idx = 0;
			for ( var i = 0; i < 3; i++) {
				var tr = $('<tr></tr>').appendTo(t);
				for ( var j = 0; j < 4; j++) {
					$('<td class="calendar-menu-month"></td>').html(
							opts.months[idx++]).attr('abbr', idx).appendTo(tr);
				}
			}

			$(target).find('.calendar-menu-prev,.calendar-menu-next').hover(
					function() {
						$(this).addClass('calendar-menu-hover');
					}, function() {
						$(this).removeClass('calendar-menu-hover');
					});
			$(target).find('.calendar-menu-next').click(function() {
				var y = $(target).find('.calendar-menu-year');
				if (!isNaN(y.val())) {
					y.val(parseInt(y.val()) + 1);
				}
			});
			$(target).find('.calendar-menu-prev').click(function() {
				var y = $(target).find('.calendar-menu-year');
				if (!isNaN(y.val())) {
					y.val(parseInt(y.val() - 1));
				}
			});

			$(target).find('.calendar-menu-year').keypress(function(e) {
				if (e.keyCode == 13) {
					setDate();
				}
			});

			$(target).find('.calendar-menu-month').hover(function() {
				$(this).addClass('calendar-menu-hover');
			}, function() {
				$(this).removeClass('calendar-menu-hover');
			}).click(
					function() {
						var menu = $(target).find('.calendar-menu');
						menu.find('.calendar-selected').removeClass(
								'calendar-selected');
						$(this).addClass('calendar-selected');
						setDate();
					});
		}

		function setDate() {
			var menu = $(target).find('.calendar-menu');
			var year = menu.find('.calendar-menu-year').val();
			var month = menu.find('.calendar-selected').attr('abbr');
			if (!isNaN(year)) {
				opts.year = parseInt(year);
				opts.month = parseInt(month);
				show(target);
			}
			menu.hide();
		}

		var body = $(target).find('.calendar-body');
		var sele = $(target).find('.calendar-menu');
		var seleYear = sele.find('.calendar-menu-year-inner');
		var seleMonth = sele.find('.calendar-menu-month-inner');

		seleYear.find('input').val(opts.year).focus();
		seleMonth.find('td.calendar-selected').removeClass('calendar-selected');
		seleMonth.find('td:eq(' + (opts.month - 1) + ')').addClass(
				'calendar-selected');

		sele._outerWidth(body._outerWidth());
		sele._outerHeight(body._outerHeight());
		seleMonth._outerHeight(sele.height() - seleYear._outerHeight());
	}

	/**
	 * get weeks data.
	 */
	function getWeeks(target, year, month) {
		var opts = $.data(target, 'dailyCalendar').options;
		var dates = [];
		var lastDay = new Date(year, month, 0).getDate();
		for ( var i = 1; i <= lastDay; i++)
			dates.push([ year, month, i ]);
		// group date by week
		var weeks = [], week = [];
		// var memoDay = 0;
		var memoDay = -1;
		while (dates.length > 0) {
			var date = dates.shift();
			week.push(date);
			var day = new Date(date[0], date[1] - 1, date[2]).getDay();
			if (memoDay == day) {
				day = 0;
			} else if (day == (opts.firstDay == 0 ? 7 : opts.firstDay) - 1) {
				weeks.push(week);
				week = [];
			}
			memoDay = day;
		}
		if (week.length) {
			weeks.push(week);
		}

		var firstWeek = weeks[0];
		if (firstWeek.length < 7) {
			while (firstWeek.length < 7) {
				var firstDate = firstWeek[0];
				var date = new Date(firstDate[0], firstDate[1] - 1,
						firstDate[2] - 1);
				firstWeek.unshift([ date.getFullYear(), date.getMonth() + 1,
						date.getDate() ]);
			}
		} else {
			var firstDate = firstWeek[0];
			var week = [];
			for ( var i = 1; i <= 7; i++) {
				var date = new Date(firstDate[0], firstDate[1] - 1,
						firstDate[2] - i);
				week.unshift([ date.getFullYear(), date.getMonth() + 1,
						date.getDate() ]);
			}
			weeks.unshift(week);
		}

		var lastWeek = weeks[weeks.length - 1];
		while (lastWeek.length < 7) {
			var lastDate = lastWeek[lastWeek.length - 1];
			var date = new Date(lastDate[0], lastDate[1] - 1, lastDate[2] + 1);
			lastWeek.push([ date.getFullYear(), date.getMonth() + 1,
					date.getDate() ]);
		}
		if (weeks.length < 6) {
			var lastDate = lastWeek[lastWeek.length - 1];
			var week = [];
			for ( var i = 1; i <= 7; i++) {
				var date = new Date(lastDate[0], lastDate[1] - 1, lastDate[2]
						+ i);
				week.push([ date.getFullYear(), date.getMonth() + 1,
						date.getDate() ]);
			}
			weeks.push(week);
		}

		return weeks;
	}
	
	function getDate(strDate) {
        var date = eval('new Date(' + strDate.replace(/\d+(?=-[^-]+$)/,
         function (a) { return parseInt(a, 10) - 1; }).match(/\d+/g) + ')');
        return date;
    }

	/**
	 * show the calendar day.
	 */
	function show(target) {
		var opts = $.data(target, 'dailyCalendar').options;
		$(target).find('.calendar-title span').html( opts.year
				 + ' ' +opts.months[opts.month - 1]);

		var body = $(target).find('div.calendar-body');
		body.find('>table').remove();
		var t = $(
				'<table cellspacing="0" cellpadding="0" border="1"><thead></thead><tbody></tbody></table>')
				.prependTo(body);
		var tr = $('<tr></tr>').css({height:opts.headHeight}).appendTo(t.find('thead'));
		for ( var i = opts.firstDay; i < opts.weeks.length; i++) {
			tr.append($("<th>").html(opts.weeks[i]).css({width:opts.colWidth}));
		}
		for ( var i = 0; i < opts.firstDay; i++) {
			tr.append($("<th>").html(opts.weeks[i]).css({width:opts.colWidth}));
		}

		var weeks = getWeeks(target, opts.year, opts.month);
		$.extend(opts,{dailyData:{}});
		
		if(opts.loadUrl){
			$.ajax({
				url:opts.loadUrl,
				data:{year:opts.year,month:opts.month},
				type:"post",
				dataType:"json",
				async:false,
				success:function(data){
					$.extend(opts,{dailyData:data});
				}
			});
		}
		var now = new Date();
		
		for ( var i = 0; i < weeks.length; i++) {
			var week = weeks[i];
			
			var tr = $('<tr valign="top"></tr>').css({height:opts.rowHeight}).appendTo(t.find('tbody')); 
			
			for ( var j = 0; j < week.length; j++) {
				var day = week[j];
				var td = $('<td>').appendTo(tr);
				var div = $('<div>').appendTo(td);
				$('<div name="day" style="margin-top:0px;background-color: #CCCCCC;" class="calendar-day calendar-other-month"></div>').attr(
						'abbr', day[0] + ',' + day[1] + ',' + day[2]).css({height:opts.headHeight}).html(
						day[2]).appendTo(div);
				
				var div2 = $('<div style="text-align:left;white-space: nowrap;overflow-x:hidden ;overflow-y: auto;text-overflow:ellipsis;"></div>')
				.css({height:opts.dataHeight,width:opts.colWidth}).appendTo(div);
				
				
				day =  (day[0] + '-' + (day[1] < 10 ? "0"+day[1] : day[1] )+ '-' + (day[2] < 10 ? "0"+day[2] : day[2]));
				if(day in opts.dailyData){
					var dayData =opts.dailyData[day];
					for(var k = 0 ;k<dayData.length;k++){
						var temp = opts.onFormat.call(target, dayData[k]).data('data',dayData[k])
						.hover(
							function(){$(this).addClass('calendar-hover');},
							function(){$(this).removeClass('calendar-hover');}
						).dblclick(function(){
							opts.onDbClickData.call(target, $(this).data('data'));
						}).appendTo(div2);
						if(opts.leadView && now >= getDate(day)){
							if(dayData[k].status != 'Finished')
								temp.css("background-color",'red');
						}
						
						$("<br>").appendTo(div2);
					}
				}
			}
		}
		t.find('div[abbr^="' + opts.year + ',' + opts.month + '"]').removeClass(
				'calendar-other-month');

		var today = now.getFullYear() + ',' + (now.getMonth() + 1) + ','
			+ now.getDate();
		t.find('div[abbr="' + today + '"]').addClass('calendar-today');

		if (opts.current) {
			t.find('.calendar-selected').removeClass('calendar-selected');
			var current = opts.current.getFullYear() + ','
					+ (opts.current.getMonth() + 1) + ','
					+ opts.current.getDate();
			t.find('div[abbr="' + current + '"]').addClass('calendar-selected');
		}

		// calulate the saturday and sunday index
		var saIndex = 6 - opts.firstDay;
		var suIndex = saIndex + 1;
		if (saIndex >= 7)
			saIndex -= 7;
		if (suIndex >= 7)
			suIndex -= 7;
		t.find('tr').find('div[name="day"]:eq(' + saIndex + ')').addClass(
				'calendar-saturday');
		t.find('tr').find('div[name="day"]:eq(' + suIndex + ')').addClass('calendar-sunday');

		t.find('div[name="day"]').hover(function() {
			$(this).addClass('calendar-hover');
		}, function() {
			$(this).removeClass('calendar-hover');
		}).click(
				function() {
					t.find('.calendar-selected').removeClass(
							'calendar-selected');
					$(this).addClass('calendar-selected');
					var parts = $(this).attr('abbr').split(',');
					opts.current = new Date(parts[0], parseInt(parts[1]) - 1,
							parts[2]);
					opts.onSelect.call(target, opts.current);
				}).dblclick(
						function() {
							t.find('.calendar-selected').removeClass(
									'calendar-selected');
							$(this).addClass('calendar-selected');
							var parts = $(this).attr('abbr').split(',');
							opts.current = new Date(parts[0], parseInt(parts[1]) - 1,
									parts[2]);
							opts.onDbClickHead.call(target, opts.current);
						});
	}

	$.fn.dailyCalendar = function(options, param) {
		if (typeof options == 'string') {
			var method = $.fn.dailyCalendar.methods[options];
			if (method){
				return method(this, param);
			} else {
				return this.calendar(options, param);
			}
		}

		options = options || {};
		return this.each(function() {
			var state = $.data(this, 'dailyCalendar');
			if (state) {
				$.extend(state.options, options);
			} else {
				state = $.data(this, 'dailyCalendar', {
					options : $.extend({}, $.fn.dailyCalendar.defaults,
							$.fn.calendar.parseOptions(this), options)
				});
				init(this);
			}
			if (state.options.border == false) {
				$(this).addClass('calendar-noborder');
			}
			setSize(this);
			show(this);
			$(this).find('div.calendar-menu').hide(); // hide the calendar
														// menu
		});
	};

	$.fn.dailyCalendar.methods = {
		options : function(jq) {
			return $.data(jq[0], 'dailyCalendar').options;
		},
		resize : function(jq) {
			return jq.each(function() {
				setSize(this);
			});
		},
		moveTo : function(jq, date) {
			return jq.each(function() {
				$(this).dailyCalendar({
					year : date.getFullYear(),
					month : date.getMonth() + 1,
					current : date
				});
			});
		}
	};
	
	$.fn.dailyCalendar.parseOptions = function(target){
		return $.extend({}, $.fn.calendar.parseOptions(target), $.parser.parseOptions(target, [ 'width', 'height',
			{
			firstDay : 'number',
			fit : 'boolean',
			border : 'boolean'
			} 
		]));
	};

	$.fn.dailyCalendar.defaults =  $.extend({}, $.fn.calendar.defaults, {
		width : 800,
		height : 500,
		colWidth:100, //列宽
		headHeight:20,//星期头高度
		dataHeight:100,//数据栏高度
		rowHeight:120,//行高
		leadView:false,
		loadUrl:undefined,
		onFormat:function(data){
			return $("<span style='cursor:pointer'></span>").attr("id",data.id).html(data.text);
		},
		onDbClickHead:function(date){
		}
		,
		onDbClickData:function(data){
		}
	});
})(jQuery);
