<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file="/WEB-INF/views/common/meta.jsp" %>
	<title>치스토리-마이페이지</title>

<meta charset='utf-8' />
<!-- 화면 해상도에 따라 글자 크기 대응(모바일 대응) -->
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<!-- jquery CDN -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- fullcalendar CDN -->
<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
<!-- fullcalendar 언어 CDN -->
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
<style>
/* body 스타일 */
html, body {
	overflow: hidden;
	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	font-size: 14px;
}
/* 캘린더 위의 해더 스타일(날짜가 있는 부분) */
.fc-header-toolbar {
	padding-top: 1em;
	padding-left: 1em;
	padding-right: 1em;
}
.modal{ 
  position:absolute; width:100%; height:100%; background: rgba(0,0,0,0.8); top:0; left:0; display:none;
}

.modal_content{
  width:400px; height:200px;
  background:#fff; border-radius:10px;
  position:relative; top:30%; left:50%;
  margin-top:-100px; margin-left:-200px;
  text-align:center;
  box-sizing:border-box; padding:74px 0;
  line-height:23px; cursor:pointer;
}
</style>
</head>
	<body style="padding:30px;">
	<!-- calendar 태그 -->
	<div id='calendar-container'>
	<div id='calendar'></div>
</div>
 <div class="modal">
	  <div class="modal_content"><h5 id="content">text</h5>
	  </div>
	</div>
<script>
(function(){
	$(function(){
// calendar element 취득
		var calendarEl = $('#calendar')[0];
// full-calendar 생성하기
		var calendar = new FullCalendar.Calendar(calendarEl, {
		height: '700px', // calendar 높이 설정
		expandRows: true, // 화면에 맞게 높이 재설정
		slotMinTime: '08:00', // Day 캘린더에서 시작 시간
		slotMaxTime: '20:00', // Day 캘린더에서 종료 시간
// 해더에 표시할 툴바
		headerToolbar: {
			left: 'prev',
			center: 'title',
			right: 'next'
},

			initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
			navLinks: false, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
			editable: true, // 수정 가능?
			selectable: true, // 달력 일자 드래그 설정가능
			nowIndicator: true, // 현재 시간 마크
			dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
			locale: 'ko', // 한국어 설정
			eventAdd: function(obj) { // 이벤트가 추가되면 발생하는 이벤트
			console.log(obj);
			},
			eventChange: function(obj) { // 이벤트가 수정되면 발생하는 이벤트
			console.log(obj);
			},
			eventRemove: function(obj){ // 이벤트가 삭제되면 발생하는 이벤트
			console.log(obj);
			},
			select: function(arg) { // 캘린더에서 드래그로 이벤트를 생성할 수 있다.
			var title = prompt('Event Title:')
			if (title) {
			calendar.addEvent({
			title: title,
			start: arg.start,
			end: arg.end,
			allDay: arg.allDay
			})
			}
			calendar.unselect()
			},
			eventClick: function(info) {
			   
			    $(".modal").fadeIn();
				$("#content").text(info.event.title);
				

			    // change the border color just for fun
			    info.el.style.borderColor = 'red';
			    $(".modal_content").click(function(){
		   		    $(".modal").fadeOut();
		  		}); 
			  },
			  
			// 이벤트
			events: [
				{
					title: '임플란트',
					start: '2022-05-01',
					},
					{
						title: '치과 방문 치과 방문 치과 방문 치과 방문',
						start: '2022-05-02',
						}
			]
			});
			// 캘린더 랜더링
			calendar.render();
			});
			})();
			
</script>


	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>
