 layui.use(['table', 'form', 'layer','laydate','jquery'], function () {
    const table = layui.table
            ,router = layui.router()
            ,form = layui.form
            ,$=layui.$
            ,laydate = layui.laydate;

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

    dataRender(router.search.id,null);

    function dataRender(id,date) {
        if(date==null) date='';
        const types = {'morn':'上午','after': '下午','even':'晚上','note':'备注','daily':'其他情况'};
        Object.keys(types).forEach(key => {
            key!=='daily' && table.render({
                elem: `#${key}`
                ,url: `${baseUrl}/daily/${key}?id=${id}&date=${date}`
                ,cols: [[
                    {field:'task', title: `<span style="color:red">${types[key]}<span>`, width: '50%'}
                    ,{field:'detail', width: '50%'}
                ]]
            });
            key ==='daily' && table.render({
                elem: `#${key}`
                ,url: `${baseUrl}/daily/${key}?id=${id}&date=${date}`
                ,cols: [[
                    {field:'comment', title: '<span style="color:red">其他<span>', width: '100%'}
                ]]
            });
        });
        return false;
    }
    $('#back').click(function () {
        history.back();
    })
});