layui.use(['form', 'layedit', 'laydate','jquery'], function () {
    var form = layui.form
        $ = layui.$;
    //监听提交
    form.on('submit(*)', function (data) {
        $.ajax({
            url: baseUrl + '/ks/insert',
            type: 'POST',
            data: data.field,
            success:function(data) {
                layer.msg(data.msg);
            }
        });
        return false;
    });
});




