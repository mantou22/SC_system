var $,tab,skyconsWeather;
layui.config({
	base : "js/"
}).use(['bodyTab','form','element','layer','jquery'],function(){
	const element = layui.element;
		$ = layui.jquery;
		tab = layui.bodyTab();


	$('.logout').click(function () {
		$.ajax({
			url: baseUrl + '/logout',
			type: 'get',
			success:function() {
				location.href="login.html";
			},
			error: function () {
				console.log("error");
			}
		});
	});

	$.ajax({
		url: baseUrl + '/auth',
		type: 'get',
		success:function(data) {
			if (data.code!==0){
				location.href="login.html";
			}
		},
		error: function () {
			console.log("error");
		}
	});

	//手机设备的简单适配
	const treeMobile = $('.site-tree-mobile'),
		shadeMobile = $('.site-mobile-shade')

	treeMobile.on('click', function(){
		$('body').addClass('site-mobile');
	});

	shadeMobile.on('click', function(){
		$('body').removeClass('site-mobile');
	});

	//添加新窗口
	$(".layui-nav .layui-nav-item a").on("click",function(){
		addTab($(this));
		$(this).parent("li").siblings().removeClass("layui-nav-itemed");
	});
});

//打开新窗口
function addTab(_this){
	tab.tabAdd(_this);
}