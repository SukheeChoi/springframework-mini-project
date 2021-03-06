<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file="/WEB-INF/views/common/meta.jsp" %>
	<title>치스토리 - 상세내용</title>
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/appIcon.png">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/treatment/details.css" />
</head>
<body>
	<%@ include file="/WEB-INF/views/common/loading.jsp" %>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>

	<main class="main located-at-bottom-of-header">
	
		<h1 class="page-title" id="treatment-type">충치 치료</h1>
	    <section class="mouth-section">
	        <div class="mouth">
	            <div class="mouth__upper-jaw">
	              <div class="upper-jaw__upper-gum">
	                <img
	                  src="${pageContext.request.contextPath}/resources/images/teethAndGums/upper_jaw.png"
	                  alt="upper gum"
	                />
	              </div>
	              <div class="upper-jaw__upper-teeth">
	                <!-- 각 이빨 img태그의 title 속성은 툴팁에 들어가는 html임. -->
	                <img
	                  class="tooth"
	                  title="<b id='toothNum'>18번<br/>치아</b>"
	                  style="top: 69%; left: 5.6%; width: 5.8%"
	                  src="${pageContext.request.contextPath}/resources/images/teethAndGums/upperTeeth/18.png"
	                />
	                <img
	                  class="tooth"
	                  title="<b id='toothNum'>17번<br/>치아</b>"
	                  style="top: 58.4%; left: 11.4%; width: 6.82333154%"
	                  src="${pageContext.request.contextPath}/resources/images/teethAndGums/upperTeeth/17.png"
	                />
	                <img
	                  class="tooth"
	                  title="<b id='toothNum'>16번<br/>치아</b>"
	                  style="top: 48.5%; left: 17.8%; width: 6.82333154%"
	                  src="${pageContext.request.contextPath}/resources/images/teethAndGums/upperTeeth/16.png"
	                />
	                <img
	                  class="tooth"
	                  title="<b id='toothNum'>15번<br/>치아</b>"
	                  style="top: 41%; left: 24.1%; width: 4.9%"
	                  src="${pageContext.request.contextPath}/resources/images/teethAndGums/upperTeeth/15.png"
	                />
	                <img
	                  class="tooth"
	                  title="<b id='toothNum'>14번<br/>치아</b>"
	                  style="top: 33.6%; left: 28.5%; width: 5.59%"
	                  src="${pageContext.request.contextPath}/resources/images/teethAndGums/upperTeeth/14.png"
	                /> 
	                <img
	                  class="tooth"
	                  title="<b id='toothNum'>13번<br/>치아</b>"
	                  style="top: 28%; left: 33.4%; width: 5.3%"
	                  src="${pageContext.request.contextPath}/resources/images/teethAndGums/upperTeeth/13.png"
	                />
	                <img
	                  class="tooth"
	                  title="<b id='toothNum'>12번<br/>치아</b>"
	                  style="top: 29.5%; left: 38.5%; width: 5.03%"
	                  src="${pageContext.request.contextPath}/resources/images/teethAndGums/upperTeeth/12.png"
	                />
	                <img
	                  class="tooth"
	                  title="<b id='toothNum'>11번<br/>치아</b>"
	                  style="top: 24.3%; left: 43.2%; width: 6.77%"
	                  src="${pageContext.request.contextPath}/resources/images/teethAndGums/upperTeeth/11.png"
	                />
	                <img
	                  class="tooth"
	                  title="<b id='toothNum'>21번<br/>치아</b>"
	                  style="top: 24.3%; left: 49.9%; width: 6.45%"
	                  src="${pageContext.request.contextPath}/resources/images/teethAndGums/upperTeeth/21.png"
	                />
	                <img
	                  class="tooth"
	                  title="<b id='toothNum'>22번<br/>치아</b>"
	                  style="top: 30.5%; left: 56%; width: 5.02%"
	                  src="${pageContext.request.contextPath}/resources/images/teethAndGums/upperTeeth/22.png"
	                />
	                <img
	                  class="tooth"
	                  title="<b id='toothNum'>23번<br/>치아</b>"
	                  style="top: 27.57%; left: 60.9%; width: 5%"
	                  src="${pageContext.request.contextPath}/resources/images/teethAndGums/upperTeeth/23.png"
	                />
	                <img
	                  class="tooth"
	                  title="<b id='toothNum'>24번<br/>치아</b>"
	                  style="top: 34.9%; left: 65.6%; width: 5.02%"
	                  src="${pageContext.request.contextPath}/resources/images/teethAndGums/upperTeeth/24.png"
	                />
	                <img
	                  class="tooth"
	                  title="<b id='toothNum'>25번<br/>치아</b>"
	                  style="top: 42.5%; left: 70.5%; width: 5.15%"
	                  src="${pageContext.request.contextPath}/resources/images/teethAndGums/upperTeeth/25.png"
	                />
	                <img
	                  class="tooth"
	                  title="<b id='toothNum'>26번<br/>치아</b>"
	                  style="top: 47.8%; left: 75.24%; width: 6.80%;"
	                  src="${pageContext.request.contextPath}/resources/images/teethAndGums/upperTeeth/26.png"
	                />
	                <img
	                  class="tooth"
	                  title="<b id='toothNum'>27번<br/>치아</b>"
	                  style="top: 59.1%; left: 81.75%; width: 6.5%;"
	                  src="${pageContext.request.contextPath}/resources/images/teethAndGums/upperTeeth/27.png"
	                />
	                <img
	                  class="tooth"
	                  title="<b id='toothNum'>28번<br/>치아</b>"
	                  style="top: 68.4%; left: 88%; width: 6.55%;"
	                  src="${pageContext.request.contextPath}/resources/images/teethAndGums/upperTeeth/28.png"
	                />
	              </div>
	            </div>
	            <div class="mouth__lower-jaw">
	              <div class="lower-jaw__lower-gum">
	                <img
	                  src="${pageContext.request.contextPath}/resources/images/teethAndGums/lower_jaw.png"
	                  alt="lower gum"
	                />
	              </div>
	              <div class="lower-jaw__lower-teeth">
	              	<img
	                	class="tooth"
	                  title="<b id='toothNum'>48번<br/>치아</b>"
	                  style="top: 7.4%; left: 5.4%; width: 7.75%;"
	                  src="${pageContext.request.contextPath}/resources/images/teethAndGums/lowerTeeth/48.png"
	                />
	              	<img
	                	class="tooth"
	                  title="<b id='toothNum'>47번<br/>치아</b>"
	                  style="top: 19.1%; left: 12.8%; width: 6.55%;"
	                  src="${pageContext.request.contextPath}/resources/images/teethAndGums/lowerTeeth/47.png"
	                />
	              	<img
	                	class="tooth"
	                  title="<b id='toothNum'>46번<br/>치아</b>"
	                  style="top: 26.8%; left: 19.1%; width: 8.35%;"
	                  src="${pageContext.request.contextPath}/resources/images/teethAndGums/lowerTeeth/46.png"
	                />
	              	<img
	                	class="tooth"
	                  title="<b id='toothNum'>45번<br/>치아</b>"
	                  style="top: 33.3%; left: 27.2%; width: 5.45%;"
	                  src="${pageContext.request.contextPath}/resources/images/teethAndGums/lowerTeeth/45.png"
	                />
	              	<img
	                	class="tooth"
	                  title="<b id='toothNum'>44번<br/>치아</b>"
	                  style="top: 37.1%; left: 32.6%; width: 4.15%;"
	                  src="${pageContext.request.contextPath}/resources/images/teethAndGums/lowerTeeth/44.png"
	                />
	              	<img
	                	class="tooth"
	                  title="<b id='toothNum'>43번<br/>치아</b>"
	                  style="top: 35.6%; left: 36.5%; width: 5.05%;"
	                  src="${pageContext.request.contextPath}/resources/images/teethAndGums/lowerTeeth/43.png"
	                />
	              	<img
	                	class="tooth"
	                  title="<b id='toothNum'>42번<br/>치아</b>"
	                  style="top: 39.3%; left: 41.4%; width: 4.75%;"
	                  src="${pageContext.request.contextPath}/resources/images/teethAndGums/lowerTeeth/42.png"
	                />
	              	<img
	                	class="tooth"
	                  title="<b id='toothNum'>41번<br/>치아</b>"
	                  style="top: 41.1%; left: 45.9%; width: 4.05%;"
	                  src="${pageContext.request.contextPath}/resources/images/teethAndGums/lowerTeeth/41.png"
	                />
	              	<img
	                	class="tooth"
	                  title="<b id='toothNum'>31번<br/>치아</b>"
	                  style="top: 40.4%; left: 50%; width: 3.75%;"
	                  src="${pageContext.request.contextPath}/resources/images/teethAndGums/lowerTeeth/31.png"
	                />
	              	<img
	                	class="tooth"
	                  title="<b id='toothNum'>32번<br/>치아</b>"
	                  style="top: 40%; left: 53.4%; width: 4.75%;"
	                  src="${pageContext.request.contextPath}/resources/images/teethAndGums/lowerTeeth/32.png"
	                />
	              	<img
	                	class="tooth"
	                  title="<b id='toothNum'>33번<br/>치아</b>"
	                  style="top: 36%; left: 58%; width: 5.25%;"
	                  src="${pageContext.request.contextPath}/resources/images/teethAndGums/lowerTeeth/33.png"
	                />
	              	<img
	                	class="tooth"
	                  title="<b id='toothNum'>34번<br/>치아</b>"
	                  style="top: 36.4%; left: 62.9%; width: 4.45%;"
	                  src="${pageContext.request.contextPath}/resources/images/teethAndGums/lowerTeeth/34.png"
	                />
	              	<img
	                	class="tooth"
	                  title="<b id='toothNum'>35번<br/>치아</b>"
	                  style="top: 31.9%; left: 67.1%; width: 5.15%;"
	                  src="${pageContext.request.contextPath}/resources/images/teethAndGums/lowerTeeth/35.png"
	                />
	              	<img
	                	class="tooth"
	                  title="<b id='toothNum'>36번<br/>치아</b>"
	                  style="top: 28.2%; left: 71.8%; width: 9.05%;"
	                  src="${pageContext.request.contextPath}/resources/images/teethAndGums/lowerTeeth/36.png"
	                />
	              	<img
	                	class="tooth"
	                  title="<b id='toothNum'>37번<br/>치아</b>"
	                  style="top: 19.9%; left: 80.2%; width: 6.55%;"
	                  src="${pageContext.request.contextPath}/resources/images/teethAndGums/lowerTeeth/37.png"
	                />
	              	<img
	                	class="tooth"
	                  title="<b id='toothNum'>38번<br/>치아</b>"
	                  style="top: 6.3%; left: 86.3%; width: 7.85%;"
	                  src="${pageContext.request.contextPath}/resources/images/teethAndGums/lowerTeeth/38.png"
	                />
	              </div>
	            </div>
	          </div>
	    </section>
	    <section class="treatment-desc-section">
	      <ul>
	        <li class="desc-item">
	            <h6 class="desc-item__title">치료일</h6>
	            <p class="desc-item__content"><span id="treatment-date">2022. 01. 03. (금)</span></p>
	        </li>
	        <li class="desc-item">
	            <h6 class="desc-item__title">치료한 치아</h6>
	            <p class="desc-item__content"><span id="teeth-numbers">-</span></p>
	        </li>
	        <li class="desc-item">
	            <h6 class="desc-item__title">소견 내용</h6>
	            <p class="desc-item__content"><span id="doctor-comment">교정 장치 부착 2개월 이후 #16, 17 치아 시림증상 호소. 두 치아 모두 레진치료 진행함.</span></p>
	        </li>
	        <li class="desc-item">
	            <h6 class="desc-item__title">촬영 이미지</h6>
	            <p class="desc-item__content">치료 전</p>
	            <!-- tbd -->
	            <div class="before-imgs-wrapper">
	              	<!-- 치료 전 이미지들 display -->
	            </div>
	            <p class="desc-item__content">치료 후</p>
	            <div class="after-imgs-wrapper">
					<!-- 치료 후 이미지들 display -->
	            </div>
	        </li>
	        <li class="desc-item">
	            <h6 class="desc-item__title">치료기구 제조사</h6>
	            <p class="desc-item__content"><span id="equipment-company">오스템 임플란트</span></p>
	        </li>
	        <li class="desc-item">
	            <h6 class="desc-item__title">의사</h6>
	            <p class="desc-item__content">
	            	<span id="doctor-name">
	            		김긍정<span id="dentist-name">(Ant 치과)</span>
	            	</span>
	            </p>
	        </li>
	        <li class="desc-item">
	            <h6 class="desc-item__title">치료비</h6>
	            <p class="desc-item__content"><span id="cost">60,000</span>원</p>
	        </li>
	      </ul>
	      
	      <a href="reviewForm?treatno=${treatno}&dendomain=${dendomain}" id="reviewFormBtn" class="btn-large-solid">
	      	치료 후기 작성하기
	      </a>
	      <a href="${pageContext.request.contextPath}/reservation/dentistDetail?dendomain=${dendomain}" class="btn-large-hollow">이 치과 진료 예약하기</a>
	    </section>
	</main>

	<%-- 변수 선언 --%>
	<c:set var="treatno" value="${treatno}" />
	<c:set var="dendomain" value="${dendomain}" />

	<script>
		function getToothId(toothEl) {
			const srcList = toothEl.src.split("/");
			const toothId = srcList[srcList.length-1].split(".")[0];
			return toothId;
		}

		function getNewSrc(toothno) {
			const splitSrc = $('#'+toothno).attr('src').split('/');
			const extension = splitSrc.at(-1).split('.').at(-1); // 치아 이미지파일 확장자
			const originalToothFilename = splitSrc.at(-1).split('.').at(0); // 일반치아 이미지파일명
			const markedToothFilename = originalToothFilename + '_marked' + '.' + extension; // 색칠된치아 이미지파일명
			splitSrc[splitSrc.length - 1] = markedToothFilename;
			const markedSrc = splitSrc.join('/');
			return markedSrc;
		}

	  $(function(){
	    // 각 치아에 id 동적으로 부여
	    document.querySelectorAll(".mouth .tooth").forEach((toothEl) => {
	      toothEl.id = getToothId(toothEl);
	    });

			// treatno에 해당되는 treatment 객체 받아오기
			const treatno = '${treatno}';
			console.log(${dendomain});
			$.ajax({
				type:"POST",
				url: "http://localhost:" + ${dendomain} + "/springframework-mini-project-dentist/treatment/getTreatmentBytreatno?treatno=" + treatno,
				//async: false,
				data: {} // 전송할 데이터
			}).done((data) => {
				console.log(data);

				const treattype = data.treattype;
				const treatno = data.treatno;
				$("#treatment-type").html(treattype);
				$("#treatment-type").append(`<span>  #<span id="treatno">` + treatno + `</span></span>`);
				

				// 동적으로 표시해야 할 치아들을 각각 색깔로 표시하기
				const teeth = data.teeth;
				teeth.map(({toothno}) => {
					$('#'+toothno).addClass('marked-tooth');
					const newSrc = getNewSrc(toothno);
					$('#'+toothno).attr('src', newSrc);
				});
				// '치료한 치아' 항목에 줄글로 치아 표시하기
				const teethWithPrefix = teeth.map(({toothno}) => ("#" + toothno));
				$("#teeth-numbers").html(teethWithPrefix.join(", "));

				const treatdate = data.treatdate;
				$("#treatment-date").html(treatdate);

				const doctorcomment = data.doctorcomment;
				$("#doctor-comment").html(doctorcomment);
					
				// 이미지 동적으로 랜더링
				const attachmentList = data.attachmentList;
				attachmentList.map(({isafter, savedfilename}) => {
					if (!isafter) {
						$(".before-imgs-wrapper").append(
							"<a href='imageShow?filename=" + savedfilename + "'><img class='content__img' src='http://localhost:" + '${dendomain}' + "/springframework-mini-project-dentist/resources/images/treatment/"+ savedfilename +"' alt='before image'/></a>"
						);
					}
					if (isafter) {
						$(".after-imgs-wrapper").append(
							"<a href='imageShow?filename=" + savedfilename + "'><img class='content__img' src='http://localhost:" + '${dendomain}' + "/springframework-mini-project-dentist/resources/images/treatment/"+ savedfilename +"' alt='after image'/></a>"
						);
					}
				});

				const materialcompany = data.materialcompany;
				$("#equipment-company").html(materialcompany);

				const doctorname = data.doctorname;
				$("#doctor-name").html(doctorname);
				
				const dentistname = data.denname;
				$("#doctor-name").append(
					`<span id="dentist-name">(`+ dentistname +`)</span>`
				);

				const treatcost = data.treatcost;
				$("#cost").html(treatcost.toLocaleString());
				
				// 만약 이미 후기가 작성된 치료내역이라면, '치료 후기 작성하기' 버튼모양 바꿔치기
				if (data.isreviewed){
					$('#reviewFormBtn').bind('click', false);
					$("#reviewFormBtn").html("치료 후기 작성하기(완료)");
					$('#reviewFormBtn').addClass("btn-disabled");
				}
			});

	  });

	  $(function() {
			// bootstrap tooltip 기능
	    $(".upper-jaw__upper-teeth > .tooth").attr("data-toggle", "tooltip");
	    $(".upper-jaw__upper-teeth > .tooth").attr("data-placement", "top");
	    $(".upper-jaw__upper-teeth > .tooth").attr("data-html", "true");

	    $(".lower-jaw__lower-teeth > .tooth").attr("data-toggle", "tooltip");
	    $(".lower-jaw__lower-teeth > .tooth").attr("data-placement", "top");
	    $(".lower-jaw__lower-teeth > .tooth").attr("data-html", "true");
	    
			$('[data-toggle="tooltip"]').tooltip();
	  });
	</script>

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>
