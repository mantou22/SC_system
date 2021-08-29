layui.use(['form', 'layedit', 'laydate', 'jquery'], function () {
    var form = layui.form,
        $ = layui.$,
        laydate = layui.laydate;
    //日期
    laydate.render({
        elem: '#date',
        value: new Date(),
    });

    //监听提交
    form.on('submit(*)', function (data) {
        let paramsData = $('#form-data').serializeArray();
        $.ajax({
            url: baseUrl + '/pl/insert',
            type: 'POST',
            data: paramsData,
            success: function (data) {
                layer.msg(data.msg);
            }
        })
        return false;
    });

    //自定义绑定时间
    //1.返回键绑定
    $(".back").bind("click", function () {
        history.back();
    });

    $.ajax({
        url: baseUrl + '/user/stu',
        dataType: 'json',
        type: 'GET',
        success: function (data) {
            $.each(data.data, function (index, item) {
                $('#stu').append(new Option(item.name, item.id));//往下拉菜单里添加元素
            })
            form.render();//菜单渲染 把内容加载进去
        }
    });

    $(".minus-morn").click(function () {
        $(".plan-morn .layui-form-item:last").remove();
    });
    $(".minus-after").click(function () {
        $(".plan-after .layui-form-item:last").remove();
    });
    $(".minus-even").click(function () {
        $(".plan-even .layui-form-item:last").remove();
    });
});




