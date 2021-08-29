layui.use(['jquery', 'form'], function () {
    const $ = layui.$, form = layui.form;
    function addNodeThr() {
        return `
                    <div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">问题知识点</label>
                            <div class="layui-input-block">
                                <input name="point" class="layui-input" lay-verify="paper">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">问题详情</label>
                            <div class="layui-input-block">
                                <input name="detail" class="layui-input" lay-verify="paper">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">建议</label>
                            <div class="layui-input-block">
                                <input name="advise" class="layui-input" lay-verify="paper">
                            </div>
                        </div>
                    </div>
                    `
    }
    function addNodeOne() {
        return `
                    <div class="layui-form-item">
                        <label class="layui-form-label">问题知识点</label>
                        <div class="layui-input-block">
                            <input name="point" class="layui-input">
                        </div>
                    </div>
                `
    }

    $(".add-rec").bind("click", function () {
        $(".question-rec").append(addNodeThr());
    });
    $(".add-klg").bind("click", function () {
        $(".question-klg").append(addNodeOne());
    });

});




