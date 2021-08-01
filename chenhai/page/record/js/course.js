layui.use(['form', 'layedit', 'laydate','jquery'], function () {
    const form = layui.form,
        $ = layui.$;
    //监听提交
    form.on('submit(*)', function (data) {
        $.ajax({
            url: baseUrl + '/cr/insert',
            type: 'POST',
            data: data.field,
            success:function(data) {
                layer.msg(data.msg);
            }
        });
        return false;
    });
});




