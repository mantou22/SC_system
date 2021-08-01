layui.config({
    base: '../../js/'
}).extend({
    formSelects: 'formSelects'
});
layui.use(['table', 'form', 'layedit', 'laydate', 'jquery', 'formSelects'], function () {
    const form = layui.form,
        $ = layui.$,
        table = layui.table,
        laydate = layui.laydate,
        formSelects = layui.formSelects;
    laydate.render({
        elem: '#date_range' //指定元素
        , type: 'date'
        , trigger: 'click'
        , range: true //开启日期范围，默认使用“_”分割
    });

    //监听提交
    form.on('submit(*)', function (data) {
        const students = formSelects.value('stu-select', 'val');
        const stu = students.join('-');
        const date = data.field.date_range;
        dataRenderFilter(baseUrl + '/pl/stu-list?id=' + stu + '&date=' + date);
        return false;
    });

    $.ajax({
        url: baseUrl + '/user/stu',
        dataType: 'json',
        type: 'GET',
        success: function (data) {
            formSelects.render({
                name: 'stu-select',
                data: {
                    arr: data.data,
                    name: 'name',
                    val: 'id'
                }
            });
        }
    });

    dataRender(baseUrl + '/pl/list');

    function dataRender(url) {
        table.render({
            elem: '#test'
            , url: url
            , toolbar: true
            , page: true
            , limit: 10
            , cols: [[
                { field: 'day', title: '日期', minWidth: 110 }
                , { field: 'student_name', title: '学生姓名', minWidth: 90 }
                , { field: 'morn_plan', title: '上午计划', edit: 'text', minWidth: 300 }
                , { field: 'after_plan', title: '下午计划', edit: 'text', minWidth: 300 }
                , { field: 'even_plan', title: '晚上计划', edit: 'text', minWidth: 300 }
                , { title: '操作', toolbar: '#barDemo', minWidth: 80 }
            ]]
        });
    }

    function dataRenderFilter(url) {
        table.render({
            elem: '#test'
            , url: url
            , toolbar: true
            , page: false
            , limit: 10
            , cols: [[
                { field: 'day', title: '日期', minWidth: 90 }
                , { field: 'student_name', title: '学生姓名', minWidth: 90 }
                , { field: 'morn_plan', title: '上午计划', edit: 'text', minWidth: 300 }
                , { field: 'after_plan', title: '下午计划', edit: 'text', minWidth: 300 }
                , { field: 'even_plan', title: '晚上计划', edit: 'text', minWidth: 300 }
                , { field: 'note', title: '备注', edit: 'text', minWidth: 300 }
                , { title: '操作', toolbar: '#barDemo', minWidth: 80 }
            ]]
        });
    }

    table.on('edit(test)', function (obj) {
        let value = obj.value //得到修改后的值
            , data = obj.data //得到所在行所有键值
            , field = obj.field; //得到字段
        $.ajax({
            url: baseUrl + '/pl/update',
            type: 'POST',
            data: {
                'id': data.id,
                [field]: value
            },
            success: function (data) {
                layer.msg(data.msg);
            },
            error: function () {
                layer.msg('操作失败');
            }

        })
    });

    //监听行工具事件
    table.on('tool(test)', function (obj) {
        var data = obj.data;
        if (obj.event === 'del') {
            layer.confirm('真的要删除么', function (index) {
                setOperate(data.id, null, 1);
                obj.del();
                layer.close(index);
            });
        }
    });

    function setOperate(id, is_ok, op_type) {
        let url, type, data = {};
        if (op_type === 1) {
            //删除
            url = baseUrl + '/pl/del';
            data['id'] = id;
            type = 'GET';
        }
        $.ajax({
            url: url,
            data: data,
            type: type,
            success: function (data) {
                layer.msg("操作成功！");
            }
        })
    }
});




