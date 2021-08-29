
var tabFilter,menu=[],liIndex,curNav,delMenu;
layui.define(["element","jquery"],function(exports){
	var element = layui.element,
		$ = layui.jquery,
		layId,
		Tab = function(){
			this.tabConfig = {
				closed : true,
				openTabNum : 100,
				tabFilter : "bodyTab"
			}
		};

	//显示左侧菜单
	if($(".navBar").html() == ''){
		var _this = this;
		$(".navBar").html(navBar(navs)).height($(window).height()-230);
		element.init();  //初始化页面元素
		$(window).resize(function(){
			$(".navBar").height($(window).height()-230);
		})
	}

	//参数设置
	Tab.prototype.set = function(option) {
		var _this = this;
		$.extend(true, _this.tabConfig, option);
		return _this;
	};

	//通过title获取lay-id
	Tab.prototype.getLayId = function(title){
		$(".layui-tab-title.top_tab li").each(function(){
			if($(this).find("cite").text() == title){
				layId = $(this).attr("lay-id");
			}
		});
		return layId;
	};

	//右侧内容tab操作
	var tabIdIndex = 0;
	Tab.prototype.tabAdd = function(_this){
		if(window.sessionStorage.getItem("menu")){
			menu = JSON.parse(window.sessionStorage.getItem("menu"));
		}
		const that = this;
		const tabFilter = that.tabConfig.tabFilter;
			if(_this.find("i.iconfont,i.layui-icon").attr("data-icon") != undefined){
				if(_this.siblings("dl.layui-nav-child").length == 0){
					tabIdIndex++;
					element.tabDelete("bodyTab",$(".tabItems li:eq(1)").attr("lay-id")).init();
					var title = '<cite>'+_this.find("cite").text()+'</cite>';
					title += '<i class="layui-icon layui-unselect layui-tab-close" data-id="'+tabIdIndex+'">&#x1006;</i>';
					element.tabAdd(tabFilter, {
				        title : title,
				        content :"<iframe src='"+_this.attr("data-url")+"' data-id='"+tabIdIndex+"'></frame>",
				        id : new Date().getTime()
				    });
					element.tabChange(tabFilter, that.getLayId(_this.find("cite").text()));
					$('body').removeClass('site-mobile');
				}
			}
	};

	$("body").on("click",".top_tab li",function(){
		element.tabChange(tabFilter,$(this).attr("lay-id")).init();
	});

	//删除tab
	$("body").on("click",".top_tab li i.layui-tab-close",function(){
		element.tabDelete("bodyTab",$(this).parent("li").attr("lay-id")).init();
	});

	var bodyTab = new Tab();
	exports("bodyTab",function(option){
		return bodyTab.set(option);
	});
})