$(function(){


  //请求载入学生列表
    $("#stulist").html('');
    $.ajax({
      url:baseUrl+"/student/list",
      dataType:'json',
      type:'POST',
      xhrFields: {withCredentials: true},
      success:function(data){
        if(data.flag == 'true'){
          for (var i in data.student){
            addStuList(data.student[i])
          }

        }else{
          alert(data.msg)
        }
      },
      error:function(data){
        alert("网络出现问题")
      }
    });
});

function addStuList(stu){
  // alert(stu.studentName)
  var addin = '<li onclick="loadinfo(this)"><span>'+ stu.studentName +'</span><input type="hidden" value="' + stu.studentId + '"></li>';

  $("#stulist").append(addin);
}

function loadinfo(stu){
  name = $(stu).children().eq(0).html();
  id = $(stu).children().eq(1).val();
  $("div li").css("background","rgba( 245,245,245,.5)")
  $(stu).css("background","rgb( 211,211,211)");

  sessionStorage.setItem("studentId", id);
  sessionStorage.setItem("studentName", name);

  $("tbody").html('');
  $.ajax({
    url:baseUrl+"/course/list/"+id,
    xhrFields: {withCredentials: true},
    success:function(data){
        if (data.flag == 'true') {
          for(var i in data.classList){
            addclass(data.classList[i]);
          }
        }
    },
    error:function(data){
      alert("网络出现问题");
    }
  });
}

function reloadinfo(id){
    $("tbody").html('');
    $.ajax({
    url:baseUrl+"/course/list/"+id,
    xhrFields: {withCredentials: true},
    success:function(data){
        if (data.flag == 'true') {
          for(var i in data.classList){
            addclass(data.classList[i]);
          }
        }
    },
    error:function(data){
      alert("网络出现问题");
    }
  });
}

function addclass(classlist){
  var addin = '<tr>'+
    // '<td>'+classlist.student+'</td>'+
    // '<td>'+classlist.studentId+'</td>'+
    '<td>'+classlist.courseName+'</td>'+
    '<td>'+classlist.courseId+'</td>'+
    '<td>'+classlist.teacher+'</td>'+
    '<td>'+classlist.teacherId+'</td>'+
    '<td>'+classlist.fee+'</td>'+
    '<td>'+classlist.startTime+'</td>'+
    '<td>'+classlist.endTime+'</td>'+
    '<td>'+classlist.period+'</td>'+
    '<td style="display:none"><input type="hidden" value="'+classlist.mark+'"/></td>'+
    '<td>'+classlist.type+'</td>'+
    '<td><button  type="button" class="btn btn-danger btn-xs" onclick="deleteclass(this)">删除</button>&nbsp;<button type="button" class="btn btn-success btn-xs" onclick="confirmclass(this)">确认</button></td>'+
  '</tr>';
  $("tbody").append(addin);
}


function deleteclass(cls){
  thiscls = $(cls).parents().parents();
  id = thiscls.children().eq(1).html();
  stuid = sessionStorage.getItem("studentId");
  // alert(id)
  if(confirm("确认删除该课程?删除后将不可恢复")){
    $.ajax({
      url:baseUrl+"/course/delete",
      type:"POST",
      dataType:'json',
      xhrFields: {withCredentials: true},
      data:JSON.stringify({
        'classId':parseInt(id),
        'studentId':stuid
      }),
      contentType: "application/json; charset=utf-8",
      success:function(data){
        if(data.flag == 'true'){
          alert('删除成功');
          reloadinfo(stuid);
        }else{
          alert(data.msg)
        }
      },
      error:function(data){
        alert("网络出现问题,删除失败")
      }
    });
  }
}


function confirmclass(cls){
  thiscls = $(cls).parents().parents();
  id = thiscls.children().eq(3).html();
  clskids = thiscls.children()
  stuid = sessionStorage.getItem("studentId");
  stuname = sessionStorage.getItem("studentName");
  // alert(id)
  if(confirm("确认该课程已经完成?确认后将不可修改")){
    $.ajax({
      url:baseUrl+"/course/confirm",
      type:"POST",
      dataType:'json',
      xhrFields: {withCredentials: true},
      data:JSON.stringify({
        'student':stuname,
        'studentId':stuid,
        'courseName':clskids.eq(0).html(),
        'courseId':parseInt(clskids.eq(1).html()),
        'teacher':clskids.eq(2).html(),
        'teacherId':parseInt(clskids.eq(3).html()),
        'fee':clskids.eq(4).html(),
        'startTime':clskids.eq(5).html(),
        'endTime':clskids.eq(6).html(),
        'period':clskids.eq(7).html(),
        'mark':clskids.eq(8).children().val(),
        'type':clskids.eq(9).html(),
      }),
      contentType: "application/json; charset=utf-8",
      success:function(data){
        if(data.flag == 'true'){
          alert('确认成功，消费记录已添加');
          reloadinfo(stuid);
        }else{
          alert(data.msg)
        }
      },
      error:function(data){
        alert("网络出现问题,确认失败")
      }
    });
  }

}
