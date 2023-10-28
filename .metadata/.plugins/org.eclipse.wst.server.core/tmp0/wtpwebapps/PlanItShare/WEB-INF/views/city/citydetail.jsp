<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Plan It Share</title>
<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
<style>
#city-submenu {
      box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
      width: 1400px;
      height: 50px;
      display: flex;
      justify-content: space-around;
      align-items : center;
      font-size: 1.2rem;
   }
   
   h2, h3 {
      text-align: center;
      margin-bottom: 20px;
      margin-top: 120px;
   }
   
   #search-box {
      margin: 50px 0;
      text-align: center;
   }
   
   #search-box > * {
      display: inline-block;
      margin-right: 10px;
   }
   
   #search-box select {
      width: 100px;
   }
   
   #search-box input[type=text] {
      width: 300px;
   }
   
   #search-box input[type=button] { 
      width: 80px;
   }
   
   .fa-solid {
         margin-left: 7px;
   }

   
   .fa-solid.fa-heart {
        color: tomato;
   }
   
   #list {
   
         width: 1000px;
         margin: 0 auto;
         
   }
   
   .planlist {
         float: left;
         margin: 10px;
         text-align: center;
         cursor: pointer;
   }
   
   
   .planlist > img {
         width: 300px;
         height: 200px;
         background-size: contain;
            
         
   }
   
   .planlist::after {
        content: '';
        display: block;
        clear: both;
    }
   
   .btn-primary {
         margin-top: 30px;
         float: right;
         margin-right: 50px;
   }
   
   .CurrIcon > i{
         width: 65px;
         height: 65px;
   }
   
   .weather {
         height: 250px;
         width: 500px;
         text-align: center;
         margin-left: 470px;
         margin-top: 70px;
         margin-bottom: 50px;
   }
   
  
   .iconinfo {

         width: 250px;
        height: 250px;
        float: left;
   }
   
   .iconinfo > div{
         
         font-size: 1.5em;
         margin-top: 5px;
         text-align: center;
   
   }
   
   .info {
         width: 250px;
         height: 250px;
        float: left;
        
         
   }
   
   .info > div {
         font-size: 1.2em;
         text-align: left;
         margin-top: 15px;
         padding-left: 20px;
   }
   
   #planhead {
         
         text-align: center;
      margin-bottom: 20px;
      margin-top: 50px;
         clear: both;
   }
   
   #icon {
         padding-right: 40px;
   
   }
   

   
   
   
</style>
</head>
<body>
   <%@ include file="/WEB-INF/views/inc/header.jsp" %>
   
   <main>
      <section>
         <%@ include file="/WEB-INF/views/inc/citysubmenu.jsp" %>
         <input type="hidden" id="engname" value="${dto.engname}"/>
         
         <form method="POST" action="/planitshare/citydetail.do" >
         <div id="search-box">
            <select class="form-control">
               <option>음식점</option>
               <option>관광명소</option>
               <option>숙소</option>
            </select>
            <input type="text" name="keyword" id="" class="form-control" />
            <button class="btn btn-secondary"><i class="fa-solid fa-magnifying-glass"></i></button>
         </div>
         </form>
         
         <h2>오늘의 ${dto.name} 날씨</h2>
         <div class="weather">
           <div class="iconinfo">
           <div class="City"></div>
            <div class="CurrIcon" id="icon"></div>
            <div class="CurrWeather"></div>
            </div>
            <div class="info">
            <div class="CurrTemp"></div>
            <div class="CurrWind"></div>
            <div class="CurrHumi"></div>
            <div class="CurrCloud"></div>
            </div>
            
            
         </div>
         
         <h2 id="planhead">인기 ${dto.name} 여행 일정</h2>
         <div id="list">
          <c:forEach items="${list}" var="dto">
            <div class="planlist" onclick="location.href='/planitshare/plan/view.do?seq=${dto.seq}';">
               <img src="/planitshare/asset/image/${dto.image}">
               <div class="text">
                   <div>${dto.title}</div>
                   <span><i class="fa-solid fa-user"></i>${dto.author}</span>
                   <span><i class="fa-solid fa-eye"></i>${dto.readCount}</span>
                   <span><i class="fa-solid fa-heart"></i>${dto.likecnt}</span>
                   <c:if test="${dto.reviewcnt > 0}">
                   <span>(${dto.reviewcnt})</span>
                   </c:if>
               </div>
            </div>
            </c:forEach>
                    
        </div>
         
         
      </section>
   </main>
   
   <script>
   
   /* var engname = document.getElementById('engname').value;
   
   var apiURI = "https://api.openweathermap.org/data/2.5/weather?q=" + engname + "&appid=9a588fe3b2d8a1189848d1b398ad0c77";
    $.ajax({
        url: apiURI,
        dataType: "json",
        type: "GET",
        async: "false",
        success: function(resp) {
           /* console.log(engname);
            console.log(resp);
            console.log("현재온도 : "+ (resp.main.temp- 273.15) );
            console.log("현재습도 : "+ resp.main.humidity);
            console.log("날씨 : "+ resp.weather[0].main );
            console.log("상세날씨설명 : "+ resp.weather[0].description );
            console.log("날씨 이미지 : "+ resp.weather[0].icon );
            console.log("바람   : "+ resp.wind.speed );
            console.log("나라   : "+ resp.sys.country );
            console.log("도시이름  : "+ resp.name );
            console.log("구름  : "+ (resp.clouds.all) +"%" ); 
            
            document.getElementById("temp").innerHTML = (resp.main.temp- 273.15);
            document.getElementById("hum").innerHTML = (resp.main.humidity);
            document.getElementById("weather").innerHTML = (resp.weather[0].main);
            document.getElementById("disweather").innerHTML = (resp.weather[0].description);
            document.getElementById("wind").innerHTML = (resp.wind.speed);
            document.getElementById("country").innerHTML = (resp.name);
            document.getElementById("cloud").innerHTML = (resp.clouds.all) +"%";
            document.getElementById("image").innerHTML = resp.weather[0].icon;
            

        }
    }); */
    
    var engname = document.getElementById('engname').value;
    
    $(document).ready(function() {
        let weatherIcon = {
          '01' : 'fas fa-sun fa-5x',
          '02' : 'fas fa-cloud-sun fa-5x',
          '03' : 'fas fa-cloud fa-5x',
          '04' : 'fas fa-cloud-meatball fa-5x',
          '09' : 'fas fa-cloud-sun-rain fa-5x',
          '10' : 'fas fa-cloud-showers-heavy fa-5x',
          '11' : 'fas fa-poo-storm fa-5x',
          '13' : 'far fa-snowflake fa-5x',
          '50' : 'fas fa-smog fa-5x'
        };

      $.ajax({
      url:'http://api.openweathermap.org/data/2.5/weather?q=' + engname + '&APPID=9a588fe3b2d8a1189848d1b398ad0c77&units=metric',

      dataType:'json',
      type:'GET',
      success:function(data){
        var $Icon = (data.weather[0].icon).substr(0,2);
        var $Temp = '현재 온도: ' + Math.floor(data.main.temp) + 'º';
        var $city = data.name;
        var $wind = '현재 풍속: ' + data.wind.speed + 'm/s';
        var $humi = '현재 습도: ' + data.main.humidity + '%';
        var $cloud = '구름량: ' + data.clouds.all + '%';
        var $weather = data.weather[0].main;

        $('.CurrIcon').append('<i class="' + weatherIcon[$Icon] +'"></i>');
        $('.CurrTemp').prepend($Temp);
        $('.City').append($city);
        $('.CurrWind').append($wind);
        $('.CurrHumi').append($humi);
        $('.CurrCloud').append($cloud);
        $('.CurrWeather').append($weather);
        
        }
      })
      });

   </script>

</body>
</html>