layui.use(['form', 'layedit', 'laydate','jquery'], function () {
    var form = layui.form,
        $ = layui.$;

    form.on('radio', function (data) {
        if(data.elem.value===1){
            $(".subj").css("display","block");
        }else if(data.elem.value===2){
            $(".subj").css("display","none");
        }
    });
    //监听提交
    form.on('submit(*)', function (data) {
        $.ajax({
            url: baseUrl + '/oc/insert',
            type: 'POST',
            data: data.field,
            success:function(data) {
                layer.msg(data.msg);
            }
        });
        return false;
    });
});




