layui.use(['form', 'layedit', 'laydate','jquery'], function () {
    const form = layui.form,
        $ = layui.$;
    form.on('radio', function (data) {
        let checked = data.value;
        if(checked==1){
            $('.paper').css('display','block');$('#paper_year').attr('lay-verify','paper');
            $('.quesion').css('display','block');$('#question_number').attr('lay-verify','required');
        }else{
            $('.paper').css('display','none');$('#paper_year').attr('lay-verify','');
            $('.quesion').css('display','none');$('#question_number').attr('lay-verify','');
        }
    });
    //监听提交
    form.on('submit(*)', function (data) {
        let paramsData = $('#form-data').serialize();
        $.ajax({
            url:  baseUrl + '/si/insert',
            type: 'POST',
            data: paramsData,
            success:function(data) {
                layer.msg(data.msg);
            }
        });
        return false;
    });

    form.on('select(course_id)', function(data){
        let id =  data.value;
        $.ajax({
            url: baseUrl + '/lev/list-of-cour?id='+id,
            dataType: 'json',
            type: 'GET',
            success: function (data) {
                $('#paper_year').empty();
                $('#paper_year').append(new Option('请选择', ''));//往下拉菜单里添加元素
                $.each(data.data, function (index, item) {
                    $('#paper_year').append(new Option(item.year, item.year));//往下拉菜单里添加元素
                });
                form.render();//菜单渲染 把内容加载进去
            }
        })
    });
});




