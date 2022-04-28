<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>  
<style>

</style>

   
<div id="map" style="width:100%;height:400px; margin-bottom:1rem;"></div>
</section>
</div>


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4b29a2d04639a115f1a9cea4ad69f3b9"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  

mapOption = { 
    center: new kakao.maps.LatLng(37.567940,126.828883), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
};

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

//마커를 표시할 위치와 title 객체 배열입니다 
var positions = [
{
    title: '카카오', 
    latlng: new kakao.maps.LatLng(33.450701, 126.570667)
},
{
    title: '오스템 임플란트', 
    latlng: new kakao.maps.LatLng(37.567941,126.828883)
}
];

//마커 이미지의 이미지 주소입니다
var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 

for (var i = 0; i < positions.length; i ++) {

// 마커 이미지의 이미지 크기 입니다
var imageSize = new kakao.maps.Size(24, 35); 

// 마커 이미지를 생성합니다    
var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    map: map, // 마커를 표시할 지도
    position: positions[i].latlng, // 마커를 표시할 위치
    title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
    image : markerImage // 마커 이미지 
});
}

var iwContent = '<h5 align="center">오스템 임플란트</h5>';

//인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({
 content : iwContent
});

//마커에 마우스오버 이벤트를 등록합니다
kakao.maps.event.addListener(marker, 'mouseover', function() {
 infowindow.open(map, marker);
});

//마커에 마우스아웃 이벤트를 등록합니다
kakao.maps.event.addListener(marker, 'mouseout', function() {
 infowindow.close();
});


//마커 클릭시 해당 치과 이동
kakao.maps.event.addListener(marker, 'click', function() {
	window.location.href = '/springframework-mini-project/reservation/dentistDetail/';
});
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>