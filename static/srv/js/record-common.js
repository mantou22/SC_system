layui.use(['form', 'layedit', 'laydate', 'jquery'], function () {
    var form = layui.form,
        $ = layui.$,
        laydate = layui.laydate;
    //自定义验证规则
    form.verify({
        course: function (val) {
            if ($.trim(val).length == 0) {
                return "科目不能为空";
            }
        },
        paper: function (val) {
            if ($.trim(val).length == 0) {
                return "试卷不能为空";
            }
        }
    });

    laydate.render({
        elem: '#date',
        trigger: 'click',//呼出事件改成click
        value: new Date()
    });
    $.ajax({
        url: baseUrl + '/user/stu',
        dataType: 'json',
        type: 'GET',
        success: function (data) {
            $.each(data.data, function (index, item) {
                $('#stu').append(new Option(item.name, item.id));//往下拉菜单里添加元素
            });
            form.render();//菜单渲染 把内容加载进去
        }
    });

    form.on('select(student_id)', function (data) {
        let id = data.value;
        $.ajax({
            url: baseUrl + '/cur/s-course?id=' + id,
            dataType: 'json',
            type: 'GET',
            success: function (data) {
                $('#cour').empty();
                $('#cour').append(new Option('请选择', null));//往下拉菜单里添加元素
                $.each(data.data, function (index, item) {
                    $('#cour').append(new Option(item.name, item.cid));//往下拉菜单里添加元素
                });
                form.render();//菜单渲染 把内容加载进去
            }
        })
    });

});