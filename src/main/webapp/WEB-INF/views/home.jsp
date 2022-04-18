<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<style>
    * {
      border: 1px solid black;
    }
</style>

  <div class="d-flex flex-row">
    <div style="width: 10rem; margin-right: 10rem;">
		<img src="${pageContext.request.contextPath}/resources/images/iloveosstem.png" width="600px">
	</div>
    
    <div class="flex-grow-1">
      <div style="text-align: center; margin-top: 50px;">
        <span style="font-size: xx-large; ">햇살 치과</span>
      </div>
      <div style="text-align: right">
      	<button class="btn btn-primary btn-sm mr-5 mb-5" >예약하기</button>
      </div>
      <div class="d-flex flex-row ml-5" style="margin-bottom: 50px;">
        <div style="width: 200px; height: auto;">
			<img src="${pageContext.request.contextPath}/resources/images/logo-spring.png" width="100px">
		</div>
        <div class="mr-3">
			<div class="mb-2"><i class="fa-solid fa-phone"></i></div>
			<div class="mb-2"><i class="fa-regular fa-clock"></i></div>
		</div>
		<div>
			<div class="mb-2">010-8424-5518</div>
			<div class="mb-2">진료시간</div>
			<div>평일 09:00~18:00 점심시간 13시 ~ 14시</div>
			<div>토요일 09:00~13:00 점심시간 없음</div>
			<div>일요일 휴무</div>
		</div>
      </div>
      <div class="list-group ml-5 mr-5">

        <a href="#" class="list-group-item list-group-item-action">
          <div class="d-flex">
            <small class="mr-1">
				<i class="fa-regular fa-star"></i>
				<i class="fa-regular fa-star"></i>
				<i class="fa-regular fa-star"></i>
				<i class="fa-regular fa-star"></i>
				<i class="fa-regular fa-star"></i>
			</small>
            <small>5</small>
          </div>
          <div class="mb-1">
          	스케일링도 꼼꼼하게 잘해주십니다^^
          </div>
          <div>
            <small><img src="/images/submit.png" style="width: 10px;"></small>
            <small>roketmissile</small>
            <small>NaN NaN NaN</small>
            <small>NAVER</small>
          </div>
        </a>
        
        <a href="#" class="list-group-item list-group-item-action">
          <div class="d-flex">
            <small class="mr-1">
				<i class="fa-regular fa-star"></i>
				<i class="fa-regular fa-star"></i>
				<i class="fa-regular fa-star"></i>
				<i class="fa-regular fa-star"></i>
				<i class="fa-regular fa-star"></i>
			</small>
            <small>5</small>
          </div>
          <div class="mb-1">
          	의사선생님 최고에요!!!! 광고 좀 하셨으면 좋겠는데 ㅠ.ㅠ 치료때문에 계속 다니고 있는데 늘 만족합니다:)
          </div>
          <div>
            <small><img src="/images/submit.png" style="width: 10px;"></small>
            <small>roketmissile</small>
            <small>NaN NaN NaN</small>
            <small>NAVER</small>
          </div>
        </a>

        <a href="#" class="list-group-item list-group-item-action">
          <div class="d-flex">
            <small class="mr-1">
				<i class="fa-regular fa-star"></i>
				<i class="fa-regular fa-star"></i>
				<i class="fa-regular fa-star"></i>
				<i class="fa-regular fa-star"></i>
				<i class="fa-regular fa-star"></i>
			</small>
            <small>5</small>
          </div>
          <div class="mb-1">
          	친절하고 치료진심으로 잘하심. 실력하고
          </div>
          <div>
            <small><img src="/images/submit.png" style="width: 10px;"></small>
            <small>roketmissile</small>
            <small>NaN NaN NaN</small>
            <small>NAVER</small>
          </div>
        </a>

      </div>
    </div>
    
    <div style="width: 10rem; margin-left: 10rem;">
    	<img src="${pageContext.request.contextPath}/resources/images/iloveosstem.png" width="600px">
    </div>
  </div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>