layui.use(['jquery'], function () {
    const $ = layui.$;
    //计划表单
    function addMorn() {
        return `
                <div class="layui-form-item">
                    <label class="layui-form-label">计划内容</label>
                    <div class="layui-input-block">
                        <input name="plan_morn" class="layui-input">
                    </div>
                </div>
            `
    }
    function addAfter() {

        return `
                <div class="layui-form-item">
                    <label class="layui-form-label">计划内容</label>
                    <div class="layui-input-block">
                        <input name="plan_after" class="layui-input">
                    </div>
                </div>
            `
    }

    function addEven() {
        return `
                    <div class="layui-form-item">
                        <label class="layui-form-label">计划内容</label>
                        <div class="layui-input-block">
                            <input name="plan_even" class="layui-input">
                        </div>
                    </div>
                `
    }
    $(".add-morn").bind("click", function () {
        $(".plan-morn").append(addMorn());
    });
    $(".add-after").bind("click", function () {
        $(".plan-after").append(addAfter());
    });
    $(".add-even").bind("click", function () {
        $(".plan-even").append(addEven());
    });
});




