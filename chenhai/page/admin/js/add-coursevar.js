layui.use(['form', 'layedit', 'laydate', 'jquery'], function () {
    var form = layui.form,
        $ = layui.$;

    //监听提交
    form.on('submit(*)', function (data) {
        $.ajax({
            url: baseUrl + '/cv/insert',
            type: "POST",
            data: data.field,
            dataType: "json",
            success: function (data) {
                if (data.code == 200) {
                    layer.msg(data.msg);
                } else {
                    layer.msg(data.msg);
                }
            }
        });
        return false;
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
    })
    $.ajax({
        url: baseUrl + '/user/tea',
        dataType: 'json',
        type: 'GET',
        success: function (data) {
            $.each(data.data, function (index, item) {
                $('#tea').append(new Option(item.name, item.id));//往下拉菜单里添加元素
            })
            form.render();//菜单渲染 把内容加载进去
        }
    })
    $.ajax({
        url: baseUrl + '/cur/courseList',
        dataType: 'json',
        type: 'GET',
        success: function (data) {
            $.each(data.data, function (index, item) {
                $('#cour').append(new Option(item.name, item.cid));//往下拉菜单里添加元素
            });
            form.render();//菜单渲染 把内容加载进去
        }
    })


});