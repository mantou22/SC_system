$(function(){


  // $(document).on('click','th',function(){
  //   var table = $(this).parents('table').eq(0);
  //   var rows = table.find('tr:gt(0)').toArray().sort(comparer($(this).index()));
  //   this.asc = !this.asc;
  //   if (!this.asc){rows = rows.reverse();}
  //   table.children('tbody').empty().html(rows);
  // });
  // function comparer(index) {
  //   return function(a, b) {
  //       var valA = getCellValue(a, index), valB = getCellValue(b, index);
  //       return $.isNumeric(valA) && $.isNumeric(valB) ?
  //           valA - valB : valA.localeCompare(valB);
  //   };
  // }
  // function getCellValue(row, index){
  //     return $(row).children('td').eq(index).text();
  // }

  //发起请求，获取所有学生列表
  sessionStorage.setItem("character_", 's');
  $.ajax({
    url:baseUrl+'/student/list',
    dataType:'json',
    type:'POST',
    xhrFields: {withCredentials: true}, 
    success:function(data){
      if(data.flag == 'true'){
        for (var i in data.student){
          addStu(data.student[i]);
        }

        $.tablesorter.addParser({  
         id: "num", //指定一个唯一的ID  
         is: function(s){  
             return false;  
             },  
         format: function(s){  
             // alert(s);
             // return s.substring(0,s.length-2);//去除后面的汉字
             // return s.toPinyin();
             // var pinyin=new Pinyin();
             // return pinyin.getFullChars(s);
             return pinyinUtil.getFirstLetter(s);
             },  
             type: "text" //按数值排序  
         });

        $("#stutable").tablesorter({
            theme: 'blue',
            // textSorter: function (a, b, asc, table) {
            //   return a.localeCompare(b);//jQuery.tablesorter 2.0中文排序解决办法
            //   },
            // sortList: [[0,0], [1,0]],
            headers: {0: {sorter: 'num'}, 3: {sorter: false}}
        });

      }else{
        alert(data.msg)
      }
    },
    error:function(data){
      alert("网络出现问题")
    }
  });

//确认充值，发起充值请求
  $("#confirmRecharge").click(function(){
    $.ajax({
      url:baseUrl+'/renew/recharge',
      type:'POST',
      xhrFields: {withCredentials: true}, 
      data:JSON.stringify({
        'studentId':$('input[name="id"]').val(),
        'charge':$('input[name="balance"]').val()
      }),
      contentType: "application/json; charset=utf-8",
      success:function(data){
        if(data.flag == 'true'){
          alert("充值成功")
          $("#recharge").css("display","none")
          location.replace(location.href);
        }else{
          alert(data.msg)
        }
      },
      error:function(){
        alert("由于网络错误，充值失败!")
      }
    })
  });
  $("#closeRecharge").click(function(){
    $("#recharge").css("display","none")
  });

  $("#closeHome").click(function(){
    $("#addHome").css("display","none")
  });

  $("#addpic").click(function(){
    $("#picture").click();
  })

  $("#closeAddStu").click(function(){
    $("#addstudent").css("display","none")
  })

  $("#closeclass").click(function(){
    $("#addclass").css("display","none")
  })


  $("#postHome").click(function(){
    var formData = new FormData();
    formData.append('pics', $('input[name=pic]')[0].files[0]);
    formData.append('content', $("textarea").val());
    //alert($("textarea").val());
	    formData.append('date', $("#datetime").val());
    formData.append('studentIds', sessionStorage.getItem("studentIds"));
    formData.append('name', $("#homeworkname").val());
    
    var ev = eval(sessionStorage.getItem('studentIds'));
    if(ev.length == 0){
    	alert("请勾选学生！");
    }else{
    $.ajax({
             url: baseUrl+'/homework/add',
             type: 'POST',
             data: formData,
             contentType: false, // 注意这里应设为false
             processData: false,
             cache: false,
             dataType:'json',
             xhrFields: {withCredentials: true}, 
             // contentType: "multipart/form-data; charset=utf-8",
             // beforeSend: function(){
             //   $("#p1").css("display", "inline");
             //  },
            success: function(data) {
              if(data.flag == 'true'){
                alert("上传成功")
                $("#addHome").css("display","none")
              }else{
                alert(data.msg)
              }
           },
           error: function (jqXHR) {
             alert("网络出现错误")
           }
         });
  }
  });
//添加用户
  $("#postAddStu").click(function(){
    cha = sessionStorage.getItem("character_");
    // alert(cha)
    if (cha == 'p'){
      tosend = {
        'name':$("#addname").val(),
        'tel':$("#addphone").val(),
        'studentId':$("#stuidToBind").val(),
        'character':cha
      };
    }else{
      tosend = {
        'name':$("#addname").val(),
        'tel':$("#addphone").val(),
        'character':cha
      };
    }
    $.ajax({
      url:baseUrl+'/user/add',
      type:'POST',
      data:JSON.stringify(tosend),
      dataType:'json',
      xhrFields: {withCredentials: true}, 
      contentType: "application/json; charset=utf-8",
      success: function(data) {
        if(data.flag == 'true'){
          alert("添加成功")
          location.replace(location.href);
        }else{
          alert(data.msg)
        }
     },
     error: function (jqXHR) {
       alert("网络出现错误")
     }

    })
  });

//添加课程
  $("#postclass").click(function(){
    // alert($('#teacher option:selected').val())
	  
	 var ev = eval(sessionStorage.getItem('studentIds'));
    if($('#selectteacher').val() == '' || ev.length == 0){
      alert("请输入老师id号码或者检查是否勾选学生！");
    }else{
      toSent = {
        'courseName':$("#course_Name").val(),
        'teacherId':$('#selectteacher').val(),
        'startTime':$("#sttime").val(),
        'endTime':$("#edtime").val(),
        'mark':$("#mark").val(),
        'cost':$("#cost").val(),
        'studentIds':eval(sessionStorage.getItem('studentIds'))
      };
      $.ajax({
        url:baseUrl+'/course/add',
        data:JSON.stringify(toSent),
        type:'POST',
        dataType:'json',
        xhrFields: {withCredentials: true}, 
        contentType: "application/json; charset=utf-8",
        success: function(data) {
          if(data.flag == 'true'){
            alert("添加成功")
            $("#addclass").css("display","none")
          }else{
            alert(data.msg)
          }
       },
       error: function (jqXHR) {
         alert("网络出现错误")
       }

     });
    }
 });

});


//讲返回的学生数据打印在屏幕上
function addStu(stuinfo){

  var addinfo = '<tr>'+
    '<td>'+ stuinfo.studentName +'</td>'+
    '<td>'+ stuinfo.remaining +'</td>'+
    '<td>'+ stuinfo.studentId +'</td>'+
    '<td><input type="checkbox"><button class="btn btn-info btn-xs" type="button" onclick="recharge(this)">&nbsp;&nbsp;充&nbsp;&nbsp;值&nbsp;&nbsp;</button>&nbsp;<button type="button" class="btn btn-danger btn-xs" onclick="deleteStu(this)">&nbsp;&nbsp;删除学生&nbsp;&nbsp;</button></td>'+
  '</tr>';

  $("tbody").append(addinfo);
};
//
// testdata = {
//   'name':"llll",
//   "balance":4,
//   'studentId':23
// }
//
// addStu(testdata)
function deleteStu(stu){
  stuinfo = $(stu).parents().parents()
  id = stuinfo.children().eq(2).html()
  name = stuinfo.children().eq(0).html()
  //发送删除请求
  if(confirm("确认删除学生: "+name+" 学号: "+id+"吗?")){
    $.ajax({
      url:baseUrl+'/student/delete',
      data:JSON.stringify({
        'studentId':id
      }),
      type:'POST',
      xhrFields: {withCredentials: true},
      contentType: "application/json; charset=utf-8",
      dataType:'json',
      success:function(data){
        if(data.flag == 'true'){
          alert("删除成功");
          location.replace(location.href);
        }else{
          alert(data.msg)
        }
      },
      error:function(){
        alert("删除失败,网络出现错误")
      }
    });
  }

}

function recharge(stu){
  stuinfo = $(stu).parents().parents()
  id = stuinfo.children().eq(2).html()
  name = stuinfo.children().eq(0).html()
  $('input[name="name"]').val(name)
  $('input[name="id"]').val(id)
  $("#recharge").css("display","block")
  //发送删除请求
}

/**
 * 学生id,添加作业时使用
 * @returns
 */
function addHomework(){
  sessionStorage.removeItem('studentIds');
  $("#addHome").css("display", "block")
  var studentIds = new Array()
  trs = $("tbody").children()
  for (var i in trs){
    if(trs.eq(i).children().eq(3).children().eq(0).is(":checked")){
      studentIds.push( parseInt(trs.eq(i).children().eq(2).html()))
    }
  }
  sessionStorage.setItem('studentIds','['+ studentIds+']')
}

function changename(){
  $("#filename").val($("#picture").val())
}

function addstudent(){
  $("#addstudent").css("display", "block")
}

/**
 * 学生id，添加课程
 * @returns
 */
function addclass(){
  sessionStorage.removeItem('studentIds');
  $("#addclass").css("display", "block")
  var studentIds = new Array()
  trs = $("tbody").children()
  for (var i in trs){
    if(trs.eq(i).children().eq(3).children().eq(0).is(":checked")){
      studentIds.push(parseInt(trs.eq(i).children().eq(2).html()))
    }
  }
  // alert(studentIds)
  sessionStorage.setItem('studentIds', '['+ studentIds+']')
}

function checkclass(){
  window.location.href = 'pages/allclass.html'
}
function checktotal(){
  window.location.href = 'pages/total.html'
}

function showornot(){
  num = $("#dentifyList option:selected").val();
  // alert(num);
  sessionStorage.setItem("character_", num);
  if(num == 'p'){
    $("#kk").css("display","block")
  }else{
    $("#kk").css("display","none")
  }
}

function myFunction() {
  // 声明变量
  var input, filter, table, tr, td, i;
  input = document.getElementById("searchstu");
  filter = input.value.toUpperCase();
  table = document.getElementById("stutable");
  tr = table.getElementsByTagName("tr");

  // 循环表格每一行，查找匹配项
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[0];
    if (td) {
      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    } 
  }
}
