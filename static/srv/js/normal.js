layui.use(['form', 'layedit', 'laydate','jquery'], function () {
    var form = layui.form,
        $ = layui.$;

    form.on('switch', function (data) {
        let checked = data.elem.checked;
        if(checked){
            $('.fin_rate').css("display",'block');
            $('#accuracy').attr('lay-verify','number');
        }else{
            $('.fin_rate').css("display",'none');
            $('#accuracy').attr('lay-verify','');
        }
    });
    //监听提交
    form.on('submit(*)', function (data) {
        if(data.field.is_finished === 'on') data.field.is_finished='1'; else data.field.is_finished='0';
        $.ajax({
            url: baseUrl + '/nr/insert',
            type: 'POST',
            data: data.field,
            success:function(data) {
                layer.msg(data.msg);
            }
        });
        return false;
    });
});




