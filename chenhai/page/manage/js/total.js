$(function(){


  //请求载入学生列表
  $("#stu").click(function(){
    $("#stu").css('background',"rgb(	255,165,0)");
    $("#tea").css('background','rgb(	220,220,220)');
    $("#par").css('background','rgb(  220,220,220)');
    $("#hmw").css('background','rgb(  220,220,220)');
    $("#stuinfo").css('display', "block");
    $('#teainfo').css('display', "none");
    $('#parinfo').css('display', "none");
    $('#hmwinfo').css('display', "none");
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

//请求载入老师列表
  $("#tea").click(function(){
    $("#tea").css('background',"rgb(	255,165,0)");
    $("#stu").css('background','rgb(	220,220,220)');
    $("#par").css('background','rgb(  220,220,220)');
    $("#hmw").css('background','rgb(  220,220,220)');
    $("#stuinfo").css('display', "none");
    $('#teainfo').css('display', "block");
    $('#parinfo').css('display', "none");
    $('#hmwinfo').css('display', "none");
    $("#tealist").html('');
    // $("#remid").remove();
    $.ajax({
      url:baseUrl+"/teacher/list",
      dataType:'json',
      type:'POST',
      xhrFields: {withCredentials: true},
      success:function(data){
        if(data.flag == 'true'){
          for (var i in data.teachers){
            addTeaList(data.teachers[i])
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

  //请求载入家长列表
  $("#par").click(function(){
    $("#tea").css('background',"rgb(  220,220,220)");
    $("#stu").css('background','rgb(  220,220,220)');
    $("#par").css('background','rgb(  255,165,0)');
    $("#hmw").css('background','rgb(  220,220,220)');
    $("#stuinfo").css('display', "none");
    $('#teainfo').css('display', "none");
    $('#parinfo').css('display', "block");
    $('#hmwinfo').css('display', "none");
    $("#tealist").html('');

    $("#parrecord").html('');

    loadpar();


  });

  function loadpar(){
    $.ajax({
      url:baseUrl+"/parent/list",
      xhrFields: {withCredentials: true},
      success:function(data){
        for (var i in data.parentList){
            addParList(data.parentList[i])
          }
      },
      error:function(data){
        alert("网络出现问题");
      }
    });
  }

  //请求载入作业列表
  $("#hmw").click(function(){
    $("#tea").css('background',"rgb(  220,220,220)");
    $("#stu").css('background','rgb(  220,220,220)');
    $("#par").css('background','rgb(  220,220,220)');
    $("#hmw").css('background','rgb(  255,165,0)');
    $("#stuinfo").css('display', "none");
    $('#teainfo').css('display', "none");
    $('#parinfo').css('display', "none");
    $('#hmwinfo').css('display', "block");
    $("#tealist").html('');

    $("#hmwstulist").html('');
    $("#hmwrecord").html('');
    $.ajax({
      url:baseUrl+"/student/list",
      dataType:'json',
      type:'POST',
      xhrFields: {withCredentials: true},
      success:function(data){
        if(data.flag == 'true'){
          for (var i in data.student){
            addParStuList(data.student[i])
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


//请求学生在某段时间内的总课时
  $("#search1").click(function(){
    st = $("#starttime1").val()
    et = $("#endtime1").val()
    id = sessionStorage.getItem("studentId")
    tosend = {
      'studentId':id,
      'startTime':st,
      'endTime':et
    }

    $.ajax({
      url:baseUrl+"/student/fee",
      dataType:'json',
      type:'POST',
      xhrFields: {withCredentials: true},
      data:JSON.stringify(tosend),
      contentType: "application/json; charset=utf-8",
      success:function(data){
        if(data.flag == 'true'){
          $("#rangetotaltime1").val(data.total)
        }else{
          alert(data.msg)
        }
      },
      error:function(data){
        alert("网络出现问题")
      }
    });
  });

//请求老师在某段时间内的总课时
  $("#search2").click(function(){
    st = $("#starttime2").val()
    et = $("#endtime2").val()
    id = sessionStorage.getItem("teacherId")
    tosend = {
      'teacherId':id,
      'startTime':st,
      'endTime':et
    };

    $.ajax({
      url:baseUrl+"/teacher/totalclasshour/interval",
      dataType:'json',
      type:'POST',
      xhrFields: {withCredentials: true},
      data:JSON.stringify(tosend),
      contentType: "application/json; charset=utf-8",
      success:function(data){
        if(data.flag == 'true'){
          $("#rangetotaltime2").val(data.total)
        }else{
          alert(data.msg)
        }
      },
      error:function(data){
        alert("网络出现问题")
      }
    });
  });

//载入页面时，跳转学生界面，并加载学生列表
    $("#stu").click()
})

//加载点击学生的信息，
//充值
function loadinfo(stu){
  id = $(stu).children().eq(1).val();
  $("div li").css("background","rgba(	245,245,245,.5)")
  $(stu).css("background","rgb(	211,211,211)");
  // alert(id);
  sessionStorage.setItem("studentId", id);
  $("#sturecord").html('');
  $("#stucharge").html('');
  $.ajax({
    url:baseUrl+"/renew/list",
    type:'POST',
    xhrFields: {withCredentials: true},
    dataType:'json',
    contentType: "application/json; charset=utf-8",
    data:JSON.stringify({
      'studentId':id
    }),
    success:function(data){
      if(data.flag == 'true'){
        for (var i in data.renew){
          addcharge(data.renew[i])
        }
      }else{
        alert(data.msg)
      }
    },
    error:function(){
      alert("由于网络错误，查询失败!")
    }

  });

  //课程
  $.ajax({
    url:baseUrl+"/consumption/list",
    type:'POST',
    xhrFields: {withCredentials: true},
    dataType:'json',
    contentType: "application/json; charset=utf-8",
    data:JSON.stringify({
      'studentId':id
    }),
    success:function(data){
      if(data.flag == 'true'){
        for (var i in data.consumption){
          addrecord(data.consumption[i])
        }
      }else{
        alert(data.msg)
      }
    },
    error:function(){
      alert("由于网络错误，查询失败!")
    }
  });

  // var rem = "暂无";

  // $.ajax({
  //   url:baseUrl+'/student/rem/'+id,
  //   success:function(data){
  //     rem=data.remaining;

  //     // $("#remid").remove();

  //     var btn = "<button id=\"remid\" type=\"button\" class=\"rem btn btn-default\">余额："+rem+"</button>";
  //     $('body').append(btn);

  //   },
  //   error:function(){
  //     alert("未获取到学生余额！");
  //   }
  // });

  

}

//加载学生作业数据
function loadhmw(stu){
  id = $(stu).children().eq(1).val();
  $("div li").css("background","rgba( 245,245,245,.5)")
  $(stu).css("background","rgb( 211,211,211)");
  // alert(id);
  sessionStorage.setItem("studentId", id);
  $("#hmwrecord").html('');
  $.ajax({
    url:baseUrl+"/homework/list/"+id,
    xhrFields: {withCredentials: true},
    success:function(data){
      if(data.flag == 'true'){
        // alert(134)
        for (var i in data.homeworks){
          addhmw(data.homeworks[i]);
        }
      }else{
        alert(data.msg)
      }
    },
    error:function(){
      alert("由于网络错误，查询失败!")
    }

  });
}

//逐条添加学生充值信息
function addcharge(stu){
  var addin = '<tr>'+
    '<td>'+stu.date+'</td>'+
    '<td>'+stu.figure+'</td>'+
    // '<td>'+stu.remain+'</td>'+
    '<td>'+'<button class="btn btn-danger btn-xs" id="deletecharge" charge="'+stu.figure+'" data-id="'+stu.id+'">删除</button>'+'</td>'+
  '</tr>';

  $("#stucharge").append(addin);
}

//逐条添加学生作业信息
function addhmw(hmw){
  var addin = '<tr>'+
    '<td>'+hmw.date+'</td>'+
    '<td><a href="'+hmw.pics+'">'+hmw.name+'</a></td>'+
    '<td>'+hmw.content+'</td>'+
    // '<td>'+hmw.pics+'</td>'+
    // '<td>'+stu.remain+'</td>'+
    '<td>'+'<button class="btn btn-danger btn-xs" id="deletehmw" hmwid="'+hmw.id+'">删除</button>'+'</td>'+
  '</tr>';

  $("#hmwrecord").append(addin);
}

//逐条添加学生学习记录信息
function addrecord(stu){
  var addin = '<tr>'+
    '<td>'+stu.date+'</td>'+
    '<td>'+stu.type+'</td>'+
    '<td>'+stu.period+'</td>'+
    '<td>'+stu.cost+'</td>'+
    '<td>'+stu.teacherName+'</td>'+
    '<td>'+'<button class="btn btn-danger btn-xs" id="deleterecord" period="'+stu.period+'" cost="'+stu.cost+'" data-id="'+stu.id+'">删除</button>'+'</td>'+
  '</tr>';

  $("#sturecord").append(addin);
}

//添加学生列表
function addStuList(stu){
  // alert(stu.studentName)
  var addin = '<li onclick="loadinfo(this)"><span>'+ stu.studentName +'</span><input type="hidden" value="' + stu.studentId + '"></li>';

  $("#stulist").append(addin);
}
//添加学生列表
function addParStuList(stu){
  // alert(stu.studentName)
  var addin = '<li onclick="loadhmw(this)"><span>'+ stu.studentName +'</span><input type="hidden" value="' + stu.studentId + '"></li>';

  $("#hmwstulist").append(addin);
}
//添加老师列表
function addTeaList(tea){
  var addin = '<li onclick="loadteacherinfo(this)"><span>'+ tea.teacherName +'</span> id:<input style="width:30px;padding-left:10px;border-radius:15px;margin-left:5px;border:none" value="' + tea.teacherId + '"></li>';
  $("#tealist").append(addin);
}
//添加家长列表
function addParList(par){
  var addin = '<tr>'+
    '<td>'+par.name+'</td>'+
    '<td>'+par.mark+'</td>'+
    '<td>'+'<button class="btn btn-danger btn-xs" id="deletepar" parid="'+par.id+'">删除</button>'+'</td>'+
  '</tr>'
  $("#parrecord").append(addin);
}

//加载点击的老师信息
function loadteacherinfo(tea){
  id = $(tea).children().eq(1).val();
  $("#tearecord").html('')
  sessionStorage.setItem("teacherId", id)
  $("div li").css("background","rgba(	245,245,245,.5)")
  $(tea).css("background","rgb(	211,211,211)");
  $.ajax({
    url:baseUrl+"/teacher/classhour",
    type:'POST',
    xhrFields: {withCredentials: true},
    dataType:'json',
    contentType: "application/json; charset=utf-8",
    data:JSON.stringify({
      'teacherId':id
    }),
    success:function(data){
      if(data.flag == 'true'){
        for (var i in data.classhour){
          addtearecord(data.classhour[i])
        }
      }else{
        alert(data.msg)
      }
    },
    error:function(){
      alert("由于网络错误，查询失败!")
    }

  });
}
//显示老师上课记录
function addtearecord(cls){
  var addin = '<tr>'+
    '<td>'+cls.date+'</td>'+
    '<td>'+cls.type+'</td>'+
    '<td>'+cls.period+'</td>'+
    '<td>'+cls.student+'</td>'+
    '<td>'+cls.mark+'</td>'+
  '</tr>';

  $("#tearecord").append(addin);
}
//查询不同类型的课时费用
function postfortype(){
  tp = $('#selectway option:selected').val();
  tosend = {
    'teacherId':parseInt(sessionStorage.getItem('teacherId')),
    'type':tp
  };
  $.ajax({
    url:baseUrl+"/teacher/totalclasshour/type",
    type:'POST',
    xhrFields: {withCredentials: true},
    dataType:'json',
    contentType: "application/json; charset=utf-8",
    data:JSON.stringify(tosend),
    success:function(data){
      if(data.flag == 'true'){
        $("#allTime").val(data.total);
      }else{
        alert(data.msg);
      }
    },
    error:function(){
      alert("由于网络错误，查询失败!")
    }

  });
}

$(document).delegate('#deletecharge','click',function(){    //由费用table里的删除button触发
        //alert(0000);
        // document.getElementById("deleteid").innerHTML=$(this).attr("data-id");
        // alert("record id:"+$(this).attr("data-id"));
        // alert("续费金额:"+$(this).attr("charge"));
        data_id=$(this).attr("data-id");
        charge=$(this).attr("charge");

        $('#delcModal').attr("data-id",data_id);
        $('#delcModal').attr("charge",charge);
        // alert(data_id+"   "+charge);
        $('#delcModal').modal('show');
        // $('#delModal').modal('show');

    })

$(document).delegate('#delchargebtn','click',function(){
        data_id=$('#delcModal').attr("data-id");
        charge=$('#delcModal').attr("charge");
        // alert(data_id+'  '+charge);

        id = sessionStorage.getItem("studentId");
        
        $.ajax({
          url:baseUrl+"/renew/del/"+id+"/"+charge+"/"+data_id,
          xhrFields: {withCredentials: true},
          success:function(data){
            $('#delcModal').modal('hide');
            // alert("删除成功！");
            $("#stucharge").html('');

            $.ajax({
              url:baseUrl+"/renew/list",
              type:'POST',
              xhrFields: {withCredentials: true},
              dataType:'json',
              contentType: "application/json; charset=utf-8",
              data:JSON.stringify({
                'studentId':id
              }),
              success:function(data){
                if(data.flag == 'true'){
                  for (var i in data.renew){
                    addcharge(data.renew[i])
                  }
                }else{
                  alert(data.msg)
                }
              },
              error:function(){
                alert("由于网络错误，查询失败!")
              }

            });

            // addrem(id);

          },
          error:function(){
            alert("由于网络错误，查询失败!");
          }
        });

        
    })

$(document).delegate('#deleterecord','click',function(){    //由费用table里的删除button触发

        data_id=$(this).attr("data-id");
        cost=$(this).attr("cost");

        $('#delrModal').attr("data-id",data_id);
        $('#delrModal').attr("cost",cost);
        // alert(data_id+"   "+charge);
        $('#delrModal').modal('show');
        
    })

 $(document).delegate('#delrecordbtn','click',function(){

        data_id=$('#delrModal').attr("data-id");
        cost=$('#delrModal').attr('cost');

        id = sessionStorage.getItem("studentId");

        $.ajax({
          url:baseUrl+"/consumption/del/"+id+"/"+cost+"/"+data_id,
          xhrFields: {withCredentials: true},
          success:function(data){
            $('#delrModal').modal('hide');
            $('#sturecord').html('');

            //课程
            $.ajax({
              url:baseUrl+"/consumption/list",
              type:'POST',
              xhrFields: {withCredentials: true},
              dataType:'json',
              contentType: "application/json; charset=utf-8",
              data:JSON.stringify({
                'studentId':id
              }),
              success:function(data){
                if(data.flag == 'true'){
                  for (var i in data.consumption){
                    addrecord(data.consumption[i])
                  }
                }else{
                  alert(data.msg)
                }
              },
              error:function(){
                alert("由于网络错误，查询失败!")
              }
            });

            // addrem(id);

          },
          error:function(){
            alert("由于网络错误，查询失败!");
          }
        });

 })

 $(document).delegate('#deletepar','click',function(){
    parid=$(this).attr("parid");
    $('#delparModal').attr("parid",parid);
    // alert(parid);
    $('#delparModal').modal('show');
 })
 $(document).delegate('#delparbtn','click',function(){
    parid=$('#delparModal').attr("parid");
    // alert(parid);

    $.ajax({
      url:baseUrl+"/parent/del/"+parid,
      xhrFields: {withCredentials: true},
      success:function(data){
        $('#parrecord').html('');
        $.ajax({
          url:baseUrl+"/parent/list",
          xhrFields: {withCredentials: true},
          success:function(data){
            for (var i in data.parentList){
                addParList(data.parentList[i])
              }
          },
          error:function(data){
            alert("网络出现问题");
          }
        });
        $('#delparModal').modal('hide');
      },
      error:function(){
        alert("网络错误，删除失败！");
        $('#delparModal').modal('hide');
      }
    })
 })

$(document).delegate('#deletehmw','click',function(){
    // alert(23)
    hmwid=$(this).attr("hmwid");
    $('#delhmwModal').attr("hmwid",hmwid);
    // alert(hmwid);
    $('#delhmwModal').modal('show');
})

$(document).delegate('#delhmwbtn','click',function(){
    hmwid=$("#delhmwModal").attr("hmwid");
    // alert(hmwid);

    $.ajax({
      url:baseUrl+"/homework/del/"+hmwid,
      xhrFields: {withCredentials: true},
      success:function(data){
        // $('#parrecord').html('');
        $("#hmwrecord").html('');
        id=sessionStorage.getItem("studentId");
        $.ajax({
          url:baseUrl+"/homework/list/"+id,
          xhrFields: {withCredentials: true},
          success:function(data){
            if(data.flag == 'true'){
              // alert(134)
              for (var i in data.homeworks){
                addhmw(data.homeworks[i]);
              }
            }else{
              alert(data.msg)
            }
          },
          error:function(){
            alert("由于网络错误，查询失败!")
          }

        });
        $('#delhmwModal').modal('hide');
      },
      error:function(){
        alert("网络错误，删除失败！");
        $('#delhmwModal').modal('hide');
      }
    })

})
 // function addrem(id){
 //  var rem = "暂无";

 //  $.ajax({
 //    url:baseUrl+'/student/rem/'+id,
 //    success:function(data){
 //      rem=data.remaining;

 //      // $("#remid").remove();

 //      var btn = "<button id=\"remid\" type=\"button\" class=\"rem btn btn-default\" disabled=\"disabled\">余额："+rem+"</button>";
 //      $('body').append(btn);

 //    },
 //    error:function(){
 //      alert("未获取到学生余额！");
 //    }
 //  });
 // }
