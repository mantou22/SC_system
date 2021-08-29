layui.use(['table','form', 'layedit','jquery'], function () {
    const form = layui.form,
        $ = layui.$,
        table = layui.table,
        router = layui.router();

    $.ajax({
        url: baseUrl + '/cur/s-course?id='+router.search.id,
        dataType: 'json',
        type: 'GET',
        success: function (data) {
            $('#cour').empty();
            $.each(data.data, function (index, item) {
                index===0 &&  dataRender(baseUrl + '/feedback/real?' +
                    'id='+router.search.id+'&' +
                    'cid='+item.cid);
                $('#cour').append(new Option(item.name, item.cid));//往下拉菜单里添加元素
            });
            form.render();//菜单渲染 把内容加载进去
        }
    });

    //监听提交
    form.on('submit(*)', function (data) {
        let cid = data.field.course_id;
        dataRender(baseUrl + '/feedback/real?id='+router.search.id+'&cid='+cid);
        return false;
    });

    function dataRender(url) {
        table.render({
            elem: '#test'
            ,url: url
            ,toolbar: true
            ,page: false
            ,cols: [[
                {field:'date', title:'日期'}
                ,{field:'paper_year', title:'试卷年份',sort:true}
                ,{field:'status', title:'试卷状态'}
                ,{field:'accuracy', title:'正确率(%)'}
                ,{field:'level', title:'等级' }
                ,{field:'questions', title:'错题题号' }
            ]]
        });
        return false;
    }
});




