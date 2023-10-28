<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Plan It Share</title>
<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<style>

   
   #board {
   
      width: 800px;
      height: 1000px;
      display: flex;
      justify-content: center;      
      margin-top: 80px;
      
   }
   
   
   section {
   
      margin-top: 100px;
   }
   
   
   #board > form > div {
   
      margin-bottom: 20px;
   }
   
   
   #city-box {
      
      width: 250px;
   }
   
   #city-btn {
   
      width: 53px;
      height: 30px;
      font-size: 14px;
   
   }
   
   #date-box {
      
      width: 200px;
   
   }
   
   #title-box {
   
      width: 600px;
      
   }
   
   #content-box {
   
      width: 600px;
      
   }
   
   
   .search {
   
      margin-bottom: 50px;
      width: 740px;
      
   }
   
   
   .city {
   
      width: 590px;
   }
   
   .date {
   
      width: 600px;
   }
   
   #startdate, #enddate {
   
      width: 200px;
   }
   
   
   #plan-box {
   
      margin-top: 100px;
   }
   
   #city-box > table > tbody > tr > td:nth-child(1) {
      
      width: 55px;
      text-align: center;
      padding-right: 5px;
   }
   
   #plan-box > table > tbody > tr > td:nth-child(1) {
   
      width: 100px;
   }
   
   h3 {
   
      margin-bottom: 20px;
   
   }
   
   #planadd-btn {
   
      margin-top: 150px;
      margin-bottom: 100px;
      margin-left: 0;
   }
   
   #title-box > label, #content-box > label {
      
      font-weight: bold;
   }
   
   
   #plan-box > table > tbody > tr > th:nth-child(3),
   #city-box > table > tbody > tr > th:nth-child(3) {
   
      width: 60px;
      text-align: center;
   }

   .card {
      width: 350px;
      height: 80px;
      margin-bottom: 15px;
   }
   
   .img {
      float: left;
      width: 80px;
      height: 80px;
      margin-right: 20px;
   }
   
   
   .card-title, .card-content {
      margin : 2px 0;
   }
   
   
   #distinct {
      
      width: 140px;
   
   }
   
   
    
   #plan-box > table > tbody > tr > th:nth-child(5) {
   
      width: 50px;
      text-align: center;
      
   }
   
   #plan-box > table > tbody > tr > th:nth-child(3) {
   
      width: 70px;
      text-align: center;
   }

   
</style>
</head>
<body>
   
   <main>
      <%@ include file="/WEB-INF/views/inc/header.jsp" %>
      <section>


         <div id="board">
            <form action="/planitshare/plan/add.do" method="post">
               
               
               <div id="city-box">
                  <table class="city">
                     <tr>
                        <th>지역 분류</th>
                        <td>
                           <select class="form-control" name="distrinct" id="distrinct">
                              <option value="" selected disabled>지역 분류를 선택하세요.</option>
                              <c:forEach var="distrincts" items="${distrincts}">
                              <option value="${distrincts}">${distrincts}</option>
                              </c:forEach>
                           </select>
                        </td>
                        <th>지역</th>
                        <td>
                           <select class="form-control" name="city" id="city" required>
                              <option value="" selected disabled>지역을 선택하세요.</option>
                           </select>
                        </td>
                     </tr>
                  </table>
               </div>
               
               
               
               
               <div id="date-box">
                  <table class="date">
                     <tr>
                        <th>
                           <label for="startdate">여행시작날짜</label>               
                        </th>
                        <td>
                           <input type="text" class="form-control" id="startdate" name="startdate" required>
                        </td>
                        <th>
                           <label for="enddate"> 여행종료날짜</label>
                        </th>
                        <td>
                           <input type="text" class="form-control" id="enddate" name="enddate" required>
                        </td>
                     </tr>
                  </table>
               </div>
               
               
               
               
               <div id="title-box">
                  <label for="title">제목</label>
                  <input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력해주세요." required>
               </div>
               
               <div id="content-box">
                  <label for="content">내용</label>
                  <textarea class="form-control" cols="15" rows="10" id="content" name="content" placeholder="내용을 입력해주세요." required></textarea>
               </div>
               
               
               <!-- 여행일차 -->
               <input type="hidden" id="day" name="day">
               
               
               <div id="plan-box"></div>
               
                 <input type="submit" value="일정 등록하기" id="planadd-btn" class="btn btn-secondary">
                       
            </form>
         </div>
               
      </section>
   </main>
   
<script>
   

   
    //여행 기간 받기 
    $( function() {
          var dateFormat = "mm/dd/yy",
            from = $( "#startdate" )
              .datepicker({
                defaultDate: "+1w",
                changeMonth: true,
                numberOfMonths: 3
              })
              .on( "change", function() {
                to.datepicker( "option", "minDate", getDate( this ) );
              }),
            to = $( "#enddate" ).datepicker({
              defaultDate: "+1w",
              changeMonth: true,
              numberOfMonths: 3
            })
            .on( "change", function() {
              from.datepicker( "option", "maxDate", getDate( this ) );
            });
       
          function getDate( element ) {
            var date;
            try {
              date = $.datepicker.parseDate( dateFormat, element.value );
            } catch( error ) {
              date = null;
            }
       
            return date;
          }
        } );
    
      
    //행정 구역을 보내면 > 그 행정 구역에 해당하는 도시들 가져오기
    $('#distrinct').change(function() {
       
      
       $.ajax({
             type: 'GET',
             url: '/planitshare/plan/add/distrinct.do',
             data: 'distrinct=' + $('#distrinct').val(),
             dataType: 'json',
             success: function(result) {
                
                $('#city').html('');
               $('#city').append('<option value="" selected disabled>지역을 선택하세요.</option>');
               
               $.each(result, function(index, item) {
                  $('#city').append('<option value="' + item.seq + '">' + item.name + '</option>');
               });
                
             },
            error: function(a, b, c) {
                  console.log(a, b, c)
            }
          
       });
       
    });
    
    
    function init() {
    //장소분류를 보내면 카테고리를 가져옴
    $('.distinct').change(function() {
       
          let tempCategory = $(this).parent().parent().find('.category');
         let tempValue = $(this).val();
          
         $.ajax({
            type: 'GET',
            url: '/planitshare/plan/add/distinct.do',
            data: 'distinct=' + tempValue,
            dataType: 'json',
            success: function(result) {
               
               tempCategory.html('');
               tempCategory.append('<option value="" selected disabled>카테고리</option>');
               
               $.each(result, function(index, item) {
                  tempCategory.append('<option value="' + item.category + '">' + item.category + '</option>');
               });
               
            },
            error: function(a, b, c) {
               console.log(a, b, c)
            }
         });
      });
    
    
    
    //장소분류와 카테고리 보내고 둘 모두에 해당하는 장소리스트 가져오기.
    $('.category').change(function() {
       
          let tempDistinct = $(this).parent().parent().find('.distinct');
         let tempCategory = $(this).parent().parent().find('.category');
          let tempPlace = $(this).parent().parent().find('.place');
         let tempValue = $(this).val();
         
         $.ajax({
            type: 'GET',
            url: '/planitshare/plan/add/place.do',
            data: 'category=' + tempCategory.val() + '&distinct=' + tempDistinct.val(),
            dataType: 'json',
            success: function(result) {
               
               tempPlace.html('');
               tempPlace.append('<option value="" selected disabled>장소를 선택하세요.</option>');
               
               
               $.each(result, function(index, item) {
                  tempPlace.append('<option value="' + item.seq + '">' + item.place + '</option>');
               });
               
            },
            error: function(a, b, c) {
               console.log(a, b, c)
            }
         });
      });
   
    }
    
    
    //시작날짜, 종료날짜 보내서 기간가져오기
    $('#enddate').change(function() {
         
         $.ajax({
            type: 'GET',
            url: '/planitshare/plan/add/date.do',
            data: 'startdate=' + $('#startdate').val() + '&enddate=' + $('#enddate').val(),
            dataType: 'json',
            success: function(result) {
               
               
               $('#day').html('');
               
               $.each(result, function(index, item) {
                  $('#day').val(item.day);
                  
                  $('#plan-box').html('');
                  
                  for (let i=0; i<item.day; i++) {
                     $('#plan-box').append(`
                           <h3>Day \${i+1}</h3>
                           
                                 <table class="search">
                                     <tr>
                                        <th>장소분류</th>
                                            <td>
                                            
                                             <select name="distinct\${i+1}" id="distinct\${i+1}" class="distinct form-control" required>
                                                 <option value="" selected disabled>장소분류</option>
                                                 <option value="food">음식점</option>
                                                 <option value="tour">관광명소</option>
                                                 <option value="lodging">숙소</option>
                                             </select>
                                            
                                            </td>
                                         <th>카테고리</th>
                                         <td>
                                            <select name="category\${i+1}" id="category\${i+1}" class="category form-control" required>
                                               <option value="" selected disabled>카테고리</option>
                                            </select>
                                         </td>   
                                         <th>장소</th>
                                         <td>
                                             <select name="place\${i+1} id="place\${i+1}" class="place form-control" required>
                                                <option value="" selected disabled>장소를 선택하세요.</option>
                                             </select>
                                         </td>
                                         <td>
                                             <button class="btn btn-secondary" type="button" onclick="addCard();">
                                                 추가
                                             </button>
                                         </td>
                                     </tr>
                                 </table>
                                 
                                 <div class="cardContainer"></div>
                                 `);
                  }
                  
                  
               }); 
               
               init();
         
            },
            error: function(a, b, c) {
               console.log(a, b, c)
            }
         });
      });
    
   let no = 1;
    
   function addCard() {
      
      let btn = $(event.target);

      let tempDistinct = $(event.target).parent().parent().find('.distinct');
      let tempCategory = $(event.target).parent().parent().find('.category');
       let tempPlace = $(event.target).parent().parent().find('.place option:selected').text();
       let tempPlaceSeq = $(event.target).parent().parent().find('.place');
       let tempDay = btn.parent().parent().parent().parent().prev().text(); 
      
      //alert(btn.parent().parent().parent().next());
      //btn.parent().parent().parent().next().hide();
      
      btn.parent().parent().parent().parent().next().append(`<div class="card">
               <div class="card-box">
              <img src="/planitshare/asset/image/\${tempPlace}.png" class="img">
              <div id="info">
                 <h5 class="card-title">\${tempPlace}</h5>
                 <p class="card-content">\${tempCategory.val()}</p>
              </div>
              <input type="hidden" name="\${tempDay}_\${no}_distinct" value="\${tempDistinct.val()}">
              <input type="hidden" name="\${tempDay}_\${no}_placeSeq" value="\${tempPlaceSeq.val()}">
           </div>
        </div>`);
      
      no++;
      
   }
    

    
    
       
    
    
    
    
    
    
</script>   
</body>
</html>













