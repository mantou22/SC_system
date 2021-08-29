layui.use(['form', 'layer','jquery'], function () {
    const form = layui.form,
        $ = layui.$,
        layer = layui.layer;
    //监听提交
    form.on('submit(*)', function (data) {
        $.ajax({
            url: baseUrl + '/login',
            type: 'POST',
            data: data.field,
            success:function(data) {
                const info = data.data;
                if(data.code===0 && info.role==='admin'){
                    location.href="index.html";
                }else {
                    layer.msg('账号或密码错误!');
                }
            },
            error: function () {
                console.log("network error");
            }
        });
        return false;
    });
});



