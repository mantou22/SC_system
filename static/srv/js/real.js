layui.use(['form', 'layedit', 'laydate','jquery'], function () {
    const form = layui.form,
        $ = layui.$;

    form.on('radio', function (data) {
        let flag = data.elem.value;
        let name = data.elem.name;
        if(name==='is_reviewed'){
            if(flag==1){
                $('.dur').css('display','block');$('#duration').attr('lay-verify','required');
            }else{
                $('.dur').css('display','none');$('#duration').attr('lay-verify','');
            }
        }else if(name==='is_finished'){
            if(flag==1){
                $('.acc').css('display','block');$('#accuracy').attr('lay-verify','number');
                $('.ques').css('display','block');$('#question_number').attr('lay-verify','required');
            }else{
                $('.acc').css('display','none');$('#accuracy').attr('lay-verify','');
                $('.ques').css('display','none');$('#question_number').attr('lay-verify','');
            }
        }
    });

    //监听提交
    form.on('submit(*)', function (data) {
        let paramsData = $('#form-data').serialize();
        $.ajax({
            url: baseUrl + '/real/insert',
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
                $('#paper').empty();
                $('#paper').append(new Option('请选择', ''));//往下拉菜单里添加元素
                $.each(data.data, function (index, item) {
                    $('#paper').append(new Option(item.year, item.year));//往下拉菜单里添加元素
                });
                form.render();//菜单渲染 把内容加载进去
            }
        })
    });
});




