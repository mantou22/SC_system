 layui.use(['table', 'jquery', 'form', 'layer','laydate'], function () {
    const table = layui.table,$=layui.$
        ,router = layui.router()
        ,laydate = layui.laydate
        ,form = layui.form;


    //日期
     laydate.render({
         elem: '#date',
         trigger: 'click',//呼出事件改成click
         value: new Date()
     });

     //监听提交
     form.on('submit(*)', function (data) {
         const date = data.field.date;
         dataRender(router.search.id,date);
         return false;
     });

    dataRender(router.search.id,'');

    function dataRender(id,date) {
        table.render({
            elem: '#homework'
            ,url:`${baseUrl}/hw/get?id=${id}&date=${date}`
            ,cellMinWidth: 80
            ,cols: [[
            {field:'course_name',title: '科目',sort:true}
            ,{field:'finish_rate',title: '完成率%'}
            ,{field:'real',title: '正确率%'}
            ,{field:'comment',title: '备注'}
            ]]
        });
        table.render({
            elem: '#other'
            ,url:`${baseUrl}/daily/homework?id=${id}&date=${date}`
            ,cellMinWidth: 80
            ,cols: [[
             {field:'comment', title: '<span style="color:red">其他<span>', width: '100%'}
            ]]
        });
    }
});