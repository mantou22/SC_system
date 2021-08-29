layui.use(['form','element','layer','jquery'],function(){
	const element = layui.element,
		$ = layui.jquery;

	$(".panel a").on("click",function(){
		window.parent.addTab($(this));
	});

	$.ajax({
		url: baseUrl+'/dashboard/list',
		type: 'get',
		success:function (data) {
			$(".tea span").text(data.teaNum);
			$(".stu span").text(data.stuNum);
			$(".check span").text(data.checkNum);
			data.items.forEach(function(cur){
				$('.items').append(`<tr><td>${cur.type}</td><td>${cur.count}</td></tr>`)
			})
		}
	})
});
