layui.use(['form', 'layedit', 'laydate','jquery'], function () {
    var form = layui.form
        ,$ = layui.$
        laydate = layui.laydate;
    //根据选定日期自动匹配当前周的起始和结束时间
    laydate.render({
        elem: '#date_range',
        format: "yyyy-MM-dd~yyyy-MM-dd",
        trigger: 'click',
        btns: [],
        done: function(value, date, endDate){
            if(value!="" && value.length>0){
                 var today=new Date(value.substring(0,10));
                var weekday=today.getDay(); 
                var monday;  
                var sunday;
                if (weekday==0) {
                   monday=new Date(1000*60*60*24*(weekday-6) + today.getTime());
                }  else {
                    monday=new Date(1000*60*60*24*(1-weekday) + today.getTime());
                }
                if (weekday==0) {
                   sunday=today;
                }  else {
                   sunday=new Date(1000*60*60*24*(7-weekday) + today.getTime());
                }
                var month = monday.getMonth()+1;
                if(month<10)
                {
                    month = "0"+month;
                }
                var day1 = monday.getDate();
                if(day1<10)
                {
                    day1 = "0"+day1;
                }
                var start = ""+monday.getFullYear()+"-"+month+"-"+day1;
                var month2 = sunday.getMonth()+1;
                if(month2<10)
                {
                    month2 = "0"+month2;
                }
                var day2 = sunday.getDate();
                if(day2<10)
                {
                    day2 = "0" + day2;
                }
                var end = ""+sunday.getFullYear()+"-"+month2+"-"+day2;
                $("#date_range").val(start+"~"+end);
            }else{
                 $("#date_range").val('');
            }
          }
      });

    form.on('radio', function (data) {
        let flag = data.value;
        if(flag==1){
            $(".add-rec").css("display","block");
        }else{
            $(".add-rec").css("display","none");
        }
    });
    //监听提交
    form.on('submit(*)', function (data) {
        let paramsData = $('#form-data').serialize();
        $.ajax({
            url: baseUrl + '/hw/insert',
            type: 'POST',
            data: paramsData,
            success:function(data) {
                layer.msg(data.msg);
            }
        });
        return false;
    });
    var html='';
    form.on('select(course_id)', function(data){
        let id =  data.value;
        $(".real-list").empty();
        $.ajax({
            url: baseUrl + '/lev/list-of-cour?id='+id,
            dataType: 'json',
            type: 'GET',
            success: function (data) {
                let _items='';
                $.each(data.data, function (index, item) {
                    _items+=`<option value="${item.year}">${item.year}</option>`;
                });
                html = `
                 <div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">年份</label>
                        <div class="layui-input-inline">
                             <select id="paper" name="paper_year" lay-verify="required" lay-search>
                             <option value="">请搜索</option>
                             ${_items}
                            </select>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">正确率%</label>
                        <div class="layui-input-inline">
                            <input name="accuracy" class="layui-input" lay-verify="number">
                        </div>
                    </div>
                </div>
                `
            }
        })
    });

    $(".add-real-listinfo").bind("click",function(){
        $(".real-list").append(html);
        form.render();//菜单渲染 把内容加载进去
    });
});




