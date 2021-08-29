 //注意：折叠面板 依赖 element 模块，否则无法进行功能性操作
layui.use(['table', 'jquery', 'form', 'layer','laydate'], function () {
    const $ = layui.$
        ,router = layui.router()
        ,form = layui.form
        ,laydate = layui.laydate;


    ajaxRequest(`${baseUrl}/si/get?id=${router.search.id}`);
    function ajaxRequest(url) {
        $.ajax({
            url: url,
            type: 'get',
            success: function(data) {
                data = data.data;
                $('#content').empty();
                if (data.length==0)  $('#content').append('暂无数据');
                data.forEach(item => {
                    let title = item.course_name+item.t+'试卷分析';
                    let detail = '';
                    item.question_details.forEach(q => {
                        detail += ` <tr><th colspan="2">${q.point}</th>
                                <th colspan="2">${q.detail}</th>
                                <th colspan="2">${q.advise}</th></tr>`
                    });
                    dataRender(title,item.create_time,item.accuracy,item.goal_score,item.comment,detail);
                });
            }
        });
    }

    function dataRender(title,date,accuracy,goal,comment,detail) {
        const _content = `
        <div style="margin: 0 10px">
        <table  border="1" cellspacing="0" style="margin:10vmin 0;width: 100%" >
            <caption style="font-size: 3vmin">${title}</caption>
            <tr>
                <th style="color:#2299ee;">测评日期</th>
                <td>${date}</td>
                <th style="color:#2299ee;">正确率(%)</th>
                <td>${accuracy}</td>
                <th style="color:#2299ee;">目标分数</th>
                <td>${goal}</td>
            </tr>
            <tr>
                <th style="color:#2299ee;">整体反馈</th>
                <td colspan="5">${comment}</td>
            </tr>
            <tr>
                <th colspan="2" style="color:#2299ee;">问题知识点</th>
                <th colspan="2" style="color:#2299ee;">问题反馈</th>
                <th colspan="2" style="color:#2299ee;">建议</th>
            </tr>
            ${detail}
        </table>
        </div>
        `
        $('#content').append(_content);
    }
});