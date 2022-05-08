<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file="/WEB-INF/views/common/meta.jsp" %>
	<title>치스토리 - 예약 현황</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myPage/myReservationList.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/empty-block.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/pagination.css" />
</head>
<body>
	<%@ include file="/WEB-INF/views/common/loading.jsp" %>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>

	<main class="main located-at-bottom-of-header">
		<h1 class="page-title">예약 현황</h1>

		<div class="reservations-list">
			<%-- 로그인한 사용자의 예약 기록 루핑하며 보여주기. --%>
		</div>

		<div id="paginationContainer" class="pagination-component">
		</div>
	</main>

	<script>
		// 예약의 status(확정/취소/대기) 전역상수 선언
		const STATUS_CANCELED = 0;
		const STATUS_FIXED = 1;
		const STATUS_PENDING = 2;

		const allReservations = [];
		const pager = {};

//------utils functions start----------------------------------------------------------
		// 예약의 현재 상태(확정/취소/대기) 반환
		function getReservationStatus({isfixed, ispending}) {
			if(!isfixed && !ispending) {
				return STATUS_CANCELED;
			}
			if(isfixed && !ispending) {
				return STATUS_FIXED;
			}
			if(!isfixed && ispending) {
				return STATUS_PENDING;
			}
			return;//불가능한 경우
			//시간이 된다면 오류로그 쌓는 DB를 만들어서 쌓으면 좋을듯.
		}

		// '예약취소' 버튼 띄울지말지 여부값 뱉어내는 함수
		function getIsCancelable(status, selecteddate) {
			// 1. 이미 취소가 된 예약이거나
			// 2. 날짜가 지나버린 예약이면 isCancelable이 false이다.
			const now = new Date();
			if (status === STATUS_CANCELED) return false;
			if (selecteddate < now) return false;
			return true;
		}

		// 목록의 각 예약마다 맞게 그려주도록 템플릿 뱉어내는 함수
		function getReservationListItemTemplate({
												resno,
												status,
												isCancelable,
												denname,
												dendomain,
												selecteddate,
												selectedtime,
												submitdate,
												canceldesc}) {

			const CANCELED_STAMP_CLASS = "stamp-canceled";
			const FIXED_STAMP_CLASS = "stamp-fixed";
			const PENDING_STAMP_CLASS = "stamp-pending";

			let stampStatus = null;
			if(status === STATUS_CANCELED) stampStatus = CANCELED_STAMP_CLASS;
			if(status === STATUS_FIXED) stampStatus = FIXED_STAMP_CLASS;
			if(status === STATUS_PENDING) stampStatus = PENDING_STAMP_CLASS;

			let template = '';
			template += '<div class="reservation-list-item" data-dendomain="' + dendomain + '" data-resno="' + resno + '">';
			template += '	<div class="stamp ' + stampStatus + '">';
			template += '		<span class="stamp-message"></span>';
			template += '	</div>';
			template += '	<h3 class="reservation__title">';
			template += '		<span class="dentist-name">' + denname + ' </span>';
			template += '		진료 예약';
			template += '	</h3>';
			template += '	<p class="reservation__text">';
			template += '		일정: ';
			template += '		<span class="scheduled-date">' + selecteddate + '</span>';
			template += '		<span class="scheduled-time">' + selectedtime + '</span>';
			template += '	</p>';

			if (status === STATUS_CANCELED) {
			template += '	<p class="reservation__text-2">';
			template += '		취소 사유: ';
			template += '		<span class="cancel-desc">' + canceldesc + '</span>';
			template += '	</p>';
			}

			template += '	<div class="reservation__btns">';
			template += '		<%-- <button href="#" class="reservation__btn">예약변경</button> --%>';

			if (isCancelable) template += '		<button onclick="cancelReservation(event)" class="reservation__btn cancelReservationBtn">예약취소</button>';
			if (!isCancelable) template += '		<button class="reservation__btn disabled">예약취소</button>';

			template += '	</div>';
			template += '	<span class="reservation__small-text">예약일자: ' + submitdate + '</span>';
			template += '</div>';

			return template;
		};

		// 예약목록 출력.
		function paintReservationList(pager) {
			$(".reservations-list").html("");
			for(let i=pager.startRowIndex; i<=pager.endRowIndex; i++) {
				const item = allReservations[i];
				const status = getReservationStatus(item);
				const isCancelable = getIsCancelable(status, item.selecteddate)
				const reservation = { ...item, status, isCancelable };
				
				const reservationListItem = getReservationListItemTemplate(reservation);
				$(".reservations-list").append(reservationListItem);
			}
		}

		// 페이지네이션 값 갱신
		function setPager(pageNoParam) {
			pager.rowsPerPage = 10;	//페이지당 행 수 
			pager.pagesPerGroup = 5; //그룹당 페이지 수
			pager.totalRows = allReservations.length; //전체 행수
			pager.pageNo = pageNoParam;	//현재 페이지 번호
			
			//전체 페이지 수
			pager.totalPageNo = parseInt( pager.totalRows / pager.rowsPerPage );
			if( parseInt( pager.totalRows % pager.rowsPerPage ) !== 0) {
				pager.totalPageNo++;
			}

			//전체 그룹 수
			pager.totalGroupNo = parseInt( pager.totalPageNo / pager.pagesPerGroup );
			if( parseInt( pager.totalPageNo % pager.pagesPerGroup ) !== 0) {
				pager.totalGroupNo++;
			}
			//현재 그룹 번호
			pager.groupNo = parseInt( (pager.pageNo - 1) / pager.pagesPerGroup ) + 1 ;
			//그룹의 시작 페이지 번호
			pager.startPageNo = parseInt( (pager.groupNo-1) * pager.pagesPerGroup ) + 1;
			//그룹의 끝 페이지 번호
			pager.endPageNo =parseInt(  pager.startPageNo + pager.pagesPerGroup ) - 1;
			if(pager.groupNo === pager.totalGroupNo) {
				pager.endPageNo = pager.totalPageNo;
			}
			//페이지의 시작 행 번호(1, ..., n)
			pager.startRowNo = parseInt( (pager.pageNo - 1) * pager.rowsPerPage ) + 1;
			//페이지의 시작 행 인덱스(0, ..., n-1) for mysql
			pager.startRowIndex = pager.startRowNo - 1;
			if(parseInt( pager.pageNo * pager.rowsPerPage ) > pager.totalRows) {
				//페이지의 마지막 행 번호
				pager.endRowNo = pager.totalRows;
				//페이지의 마지막 행 인덱스
				pager.endRowIndex = pager.totalRows - 1;
			} else {
				//페이지의 마지막 행 번호
				pager.endRowNo = parseInt( pager.pageNo * pager.rowsPerPage );
				//페이지의 마지막 행 인덱스
				pager.endRowIndex = pager.endRowNo - 1;
			}
			paintReservationList(pager)
			paintPagination(pager);
		}

		// 페이지네이션 버튼 출력.
		function paintPagination(pager) {
			let paginationHtml = '';
			paginationHtml += '<a class="pagination-btn" onClick="setPager(1)"><i class="fa-solid fa-angles-left"></i></a>';
			if(pager.groupNo>1) {
				paginationHtml += '	<a class="pagination-btn" onClick="setPager(' + parseInt(pager.startPageNo-1) + ')"><i class="fa-solid fa-angle-left"></i></a>';
			}
			for(let i=pager.startPageNo; i<=pager.endPageNo; i++) {
				if(pager.pageNo !== i) {
					paginationHtml += '		<a class="pagination-btn" onClick="setPager(' + i + ')">' + i + '</a>';
				}
				if(pager.pageNo === i) {
					paginationHtml += '		<a class="pagination-btn pagination-btn-current" onClick="setPager(' + i + ')">' + i + '</a>';
				}
			}
			if(pager.groupNo<pager.totalGroupNo) {
				paginationHtml += '		<a class="pagination-btn" onClick="setPager(' + parseInt(pager.endPageNo+1) + ')"><i class="fa-solid fa-angle-right"></i></a>';
			}
			paginationHtml += '		<a class="pagination-btn"  onClick="setPager(' + parseInt(pager.totalPageNo) + ')"><i class="fa-solid fa-angles-right"></i></a>';
	
			$("#paginationContainer").html(paginationHtml);
		}

		// 예약취소 요청 통신
		function cancelReservation(event) {
			const targetDendomain = event.target.closest("[data-dendomain]").dataset.dendomain;
			const targetResno = event.target.closest("[data-resno]").dataset.resno;
			$.ajax({
				url: "http://localhost:" + targetDendomain + "/springframework-mini-project-dentist/reservation/cancelReservation",
				method:"POST",
				async: false,
				data: {
					resno: targetResno
				}
			}).done((data) => {
				location.reload();
			});
		}

//------utils functions end----------------------------------------------------------

		//내 모든 치과의 예약내역 목록 가져오기... 가보자.
		$.ajax({
			//웹 서버로부터 사용자의 내 치과 리스트를 받아오기.
			url: "myReservationList",
			method:"POST",
			async: false,
		}).done(({myDentistList, patientssn}) => {
			myDentistList.map((myDentist) => {
				// 사용자의 모든 '내 치과'에 예약정보를 확인해서 받아오는 통신.
				$.ajax({
					url: "http://localhost:" + myDentist["dendomain"] + "/springframework-mini-project-dentist/reservation/reservationList",
					method:"POST",
					async: false,
					data: {
						patientssn
					}
				}).done(({reservationList}) => {
					//치과 1개로부터 받아온 reservation 객체를 전역변수인 totalList에 모으기.
					reservationList.map(reservation => {
						allReservations.push(reservation);
					});
				});
			});
		});

		//allReservations 정렬.
		allReservations.sort(function(a, b) {
			if(a["submitdate"] > b["submitdate"]) {
				return -1;
			}
			if(a["submitdate"] < b["submitdate"]) {
				return 1;
			}
			return 0;
		})

		// 이것이 main 함수
		$(function() {
			//rowsPerPage, pagesPerGroup, totalRows, pageNo
			setPager(1); // 문서 로딩 시 페이지네이션 초기화. 이후부터는 페이지네이션 버튼 클릭시마다 setPager 내부-> paintPagination()이 매번 새로 실행됨.
			paintReservationList(pager)
			paintPagination(pager);
		});
	</script>

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>
