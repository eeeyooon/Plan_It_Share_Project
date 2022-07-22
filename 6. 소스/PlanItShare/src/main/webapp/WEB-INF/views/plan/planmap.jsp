<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Plan It Share</title>
<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=45bff8e1f05130c0cfcaa2b32275bf5e"></script>
<style>

	#header-menu li:nth-child(3) a {
		color : #6DA2DF;
	}

	#map {
		width: 1500px;
		height: 800px;
		margin: 0 auto;
	}
	
	.info-title {
	    display: block;
	    background: #50627F;
	    color: #fff;
	    text-align: center;
	    height: 24px;
	    line-height:22px;
	    border-radius:4px;
	    padding:0px 10px;
	}
	
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/inc/header.jsp" %>
	<main>
		<section>
			<div id="map"></div>
		</section>
	</main>

	<script type="text/javascript">
	
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	    mapOption = { 
	        center: new kakao.maps.LatLng(33.37916416181665, 126.52760537009773), // 지도의 중심좌표
	        level: 9 // 지도의 확대 레벨
	    };
	
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
		var infos = [];
		
		// 마커를 표시할 위치와 title 객체 배열입니다 
		<c:forEach var="m" begin="1" end="${lastDay}">
		var position${m} = [
		    <c:forEach items="${planList}" var="tour">
		   	<c:if test="${tour.day == m}">
			{
				
		        content: '<div class ="info-title">${tour.name} ${tour.day}일차</div>',
		        latlng: new kakao.maps.LatLng(${tour.lat}, ${tour.lng})
		    },
		    </c:if>
			</c:forEach>
		];
				
		// 마커 이미지의 이미지 주소입니다
		var imageSrc = "/planitshare/asset/image/placeholder${m}.png";   
		for (var i = 0; i < position${m}.length; i ++) {
		    
		    // 마커 이미지의 이미지 크기 입니다
		    var imageSize = new kakao.maps.Size(24, 35); 
		    
		    // 마커 이미지를 생성합니다    
		    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
		    
		    // 마커를 생성합니다
		    var marker = new kakao.maps.Marker({
		        map: map, // 마커를 표시할 지도
		        position: position${m}[i].latlng, // 마커를 표시할 위치
		        title : position${m}[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
		        image : markerImage // 마커 이미지 
		    });
		     
		    var infowindow = new kakao.maps.InfoWindow({
		        content: position${m}[i].content // 인포윈도우에 표시할 내용
		    });
		    
			infos.push(infowindow);
			infowindow.open(map, marker);

		    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
		    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));

		}
		
	
		// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
		function makeOverListener(map, marker, infowindow) {
		    return function() {
		        infowindow.open(map, marker);
		    };
		}

		// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
		function makeOutListener(infowindow) {
		    return function() {
		        infowindow.close();
		    };
		}
		

		// 선을 구성하는 좌표 배열입니다. 이 좌표들을 이어서 선을 표시합니다
		var linePath${m} = [
			<c:forEach items="${planList}" var="tour">
			<c:if test="${tour.day == m}">
		    	new kakao.maps.LatLng(${tour.lat}, ${tour.lng}),
			</c:if>
		    </c:forEach>
		];
		
		// 지도에 표시할 선을 생성합니다
		var polyline${m} = new kakao.maps.Polyline({
		    path: linePath${m}, // 선을 구성하는 좌표배열 입니다
		    strokeWeight: 5, // 선의 두께 입니다
		    strokeColor: getRandomColor(${m}), // 선의 색깔입니다
		    strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
		    strokeStyle: 'solid' // 선의 스타일입니다
		});
		
		// 지도에 선을 표시합니다 
		polyline${m}.setMap(map);  

		</c:forEach>
		

		var infoTitle = document.querySelectorAll('.info-title');
		infoTitle.forEach(function(e) {
		    var w = e.offsetWidth + 10;
		    var ml = w/2;
		    e.parentElement.style.top = "82px";
		    e.parentElement.style.left = "50%";
		    e.parentElement.style.marginLeft = -ml+"px";
		    e.parentElement.style.width = w+"px";
		    e.parentElement.previousSibling.style.display = "none";
		    e.parentElement.parentElement.style.border = "0px";
		    e.parentElement.parentElement.style.background = "unset";
			
		});

		// All random
		/* function getRandomColor() {
		    var letters = '0123456789ABCDEF'.split('');
		    var color = '#';
		    for (var i = 0; i < 6; i++ ) {
		        color += letters[Math.floor(Math.random() * 16)];
		    }
		    return color;
		} */
		
		function getRandomColor(m) {
			var color = '#';
			var letters = ['FF9B00', '0A82FF', '2C952C', '6ED746', '9E37D1', '6ED746'];

			color += letters[m-1];
		    return color;
		}
		
		$(document).ready(function () {
				infos.forEach(function(each) { each.close(); }); // close all infos
		    
		});
		
	</script>

</body>
</html>