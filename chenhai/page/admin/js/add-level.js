layui.use(['form', 'layedit', 'laydate', 'jquery'], function () {
    const form = layui.form,
        $ = layui.$;
    form.verify({
        paper: [
            /^[0-9]{6}[a-zA-Z0-9]{1,}$/
            , '试卷编号格式不对'
        ]
    });
    const _html = `
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">分数</label>
                <div class="layui-input-inline">
                    <input type="text" name="score" lay-verify='number' class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">等级</label>
                <div class="layui-input-inline">
                    <select name="value" lay-verify='required'>
                        <option value="">请选择</option>
                        <option value="16">A+</option>
                        <option value="15">A</option>
                        <option value="14">A-</option>
                        <option value="13">B+</option>
                        <option value="12">B</option>
                        <option value="11">B-</option>
                        <option value="10">C+</option>
                        <option value="9">C</option>
                        <option value="8">C-</option>
                        <option value="7">D+</option>
                        <option value="6">D</option>
                        <option value="5">D-</option>
                        <option value="4">E+</option>
                        <option value="3">E</option>
                        <option value="2">E-</option>
                        <option value="1">U</option>
                    </select>
                </div>
            </div>
        </div>
    `;
    $(".add-level-list").click(function () {
        $("#level-list").append(_html);
        form.render();
    });

    $(".remove-level-list").click(function () {
        $("#level-list .layui-form-item:last").remove();
    });

    //监听提交
    form.on('submit(*)', function () {
        const levels = $("#form-data").serialize();
        $.ajax({
            url: baseUrl + '/lev/insert?' + levels,
            type: 'POST',
            success: function (data) {
                layer.msg(data.msg);
            }
        });
        return false;
    });
    //科目下拉
    $.ajax({
        url: baseUrl + '/cur/courseList',
        dataType: 'json',
        type: 'GET',
        success: function (data) {
            $.each(data.data, function (index, item) {
                $('#cour').append(new Option(item.name, item.cid));//往下拉菜单里添加元素
            });
            form.render();//菜单渲染 把内容加载进去
        }
    });
    //1.返回键绑定
    $(".back").bind("click", function () {
        history.back();
    });
});