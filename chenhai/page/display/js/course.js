//注意：折叠面板 依赖 element 模块，否则无法进行功能性操作
layui.use(['element', 'jquery', 'layer'], function () {
    var element = layui.element
        , $ = layui.$
        , router = layui.router();

    function Node(name, percent) {
        return `
        <div>
            <div style='font-size: 17px;padding: 5px'>
                ${name}
            </div>
            <div class='layui-progress layui-progress-big' lay-showPercent='true'>
                <div class='layui-progress-bar layui-bg-blue' lay-percent='${percent}%'></div>
            </div>
        </div>
        `;
    }

    $.ajax({
        url: baseUrl + '/cv/get?id=' + router.search.id,
        type: 'GET',
        success: function (data) {
            data = data.data;
            if (data.length === 0) {
                $(".wrapper").append('暂无数据');
                return;
            }
            for (let i = 0; i < data.length; i++) {
                const total = data[i].total, consume = data[i].total - data[i].remain;
                if (total == 0) {
                    $(".wrapper").append(Node(
                        data[i].course_name,
                        100
                    )
                    )
                } else {
                    $(".wrapper").append(Node(
                        data[i].course_name,
                        parseInt(consume / total * 100)
                    )
                    )
                }
            }
            element.render('progress');
        },
        error: function () {
            layer.msg('操作失败');
        }
    })
});