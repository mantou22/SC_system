layui.use(['element','jquery', 'layer','form'], function () {
    const $ = layui.$
        ,form = layui.form
        ,router = layui.router();

    dataRender(baseUrl + '/display/normal?id='+router.search.id,1);

    form.on('radio', function(data){
        const f = data.value;
        if(f==1){
            dataRender(baseUrl + '/display/normal?id='+router.search.id,1)
        }else if(f==2){
            dataRender(baseUrl + '/display/special?id='+router.search.id,1)
        }else {
            dataRender(baseUrl + '/display/real?id='+router.search.id,2)
        }
    });

    function dataRender(url,type) {
        $.ajax({
            url: url,
            type: 'GET',
            success:function(data){
                let list = data.data;
                $('#chartWrapper').empty();
                if(list.length===0) {
                    return;
                }
                for(let i=0;i<list.length;i++) {
                    if(list[i].xdata.length === 0) continue;
                    renderChart(i,list[i].name,list[i].xdata,list[i].ydata,list[i].markPoints,type);
                }
            },
            error: function() {
                layer.msg('error');
            }
        });
    };


    function renderChart(index,title,xdata,ydata,markPoint,type) {
        // 基于准备好的dom，初始化echarts实例
        const _html = `<div style='text-align:center;font-size:4vmin'>
                            <div style='color: #0c7fd1'>${title}</div>
                            <canvas id='main${index}' width='411' height='350' style='margin: 0 0'></canvas>
                       </div>`;
        $('#chartWrapper').append(_html);
        const myChart = echarts.init(document.getElementById('main'+index));
        // 指定图表的配置项和数据
        let option;
        if(type===1){
            option = {
                xAxis:  {
                    type: 'category',
                    boundaryGap: false,
                    data: xdata,
                },
                yAxis : {
                    type : 'value',
                    axisLabel : {
                        formatter: '{value}',
                    },
                    splitNumber: 10,
                },
                series: [
                    {
                        type:'line',
                        data: ydata,
                        markPoint: {
                            data: markPoint
                        }
                    }
                ]
            }
        }else {
            option = {
                xAxis:  {
                    type: 'category',
                    boundaryGap: false,
                    data: xdata,
                },
                yAxis : {
                    type : 'value',
                    min:0,
                    max:16,
                    splitNumber:16,
                    axisLabel:{
                        formatter: function (value) {
                            var texts = [];
                            if (value===16){
                                texts.push('A+');
                            }
                            else if (value===15) {
                                texts.push('A');
                            }
                            else if (value===14) {
                                texts.push('A-');
                            }
                            else if(value===13){
                                texts.push('B+');
                            }
                            else  if(value===12){
                                texts.push('B');
                            }
                            else  if(value===11){
                                texts.push('B-');
                            }
                            else  if(value===10){
                                texts.push('C+');
                            }
                            else  if(value===9){
                                texts.push('C');
                            }
                            else  if(value===8){
                                texts.push('C-');
                            }
                            else  if(value===7){
                                texts.push('D+');
                            }
                            else  if(value===6){
                                texts.push('D');
                            }
                            else  if(value===5){
                                texts.push('D-');
                            }
                            else  if(value===4){
                                texts.push('E+');
                            }
                            else  if(value===3){
                                texts.push('E');
                            }
                            else  if(value===2){
                                texts.push('E-');
                            }
                            else  if(value===1){
                                texts.push('U');
                            }else  if(value===0){
                                texts.push('#');
                            }
                            return texts;
                        }
                    },

                },
                series: [
                    {
                        type:'line',
                        data: ydata,
                        markPoint: {
                            data: markPoint
                        }
                    }
                ]
            }
        }
        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
    }   
});