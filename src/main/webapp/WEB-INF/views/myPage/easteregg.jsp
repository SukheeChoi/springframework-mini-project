<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/views/common/meta.jsp"%>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/default-form.css"/>
<title>치스토리-(이스터에그)</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/appIcon.png">
</head>
<style>
	h2 {
		font-size: 1.4rem;
	    font-weight: 600;
	    color: var(--almost-black-gray);
	}
	
	#price{
		margin: 3.5rem 0 2rem 0;
	}
	
	.ranking {
		margin: 2rem 0 0 0;
	}
</style>
<body style="text-align: center;">
	<%@ include file="/WEB-INF/views/common/loading.jsp" %>
	<main class="located-at-bottom-of-header">
		<div class="logo">
			<a href="${pageContext.request.contextPath}/">
				<h1 class="logo-text-orange-lg">치스토리</h1>
			</a>
		</div>
	</main>
	<div>
		<h2 class="page-title">지금까지 ${name}님이</h2>
		<h2>치아에 총 투자한 금액은?</h2>
	</div>

	<!-- 밑줄 넣기 -->
	<h1 class="logo-text-orange-lg" id="price"></h1>
	
	<button class="btn-large-solid" id="test">카톡으로 공유하기</button>
	<hr>
	<div>
		<h2 class="page-title">지금까지 ${name}님이</h2>
		<h2>가장 정성을 쏟은 치아는?</h2>
	</div>
	<h1 class="logo-text-orange-lg ranking" id="first"></h1>
	<h1 class="logo-text-orange-lg ranking" id="second"></h1>
	<h1 class="logo-text-orange-lg ranking" id="third"></h1>
</body>

<script>
Kakao.init('a472507b48c1bfef14f1f454d183ffb0')
// Kakao.init('35b206a61fb57d6eb5161d7c6ad2a9f5')
	console.log(${myDentistList});
	getData();
	let allCost = 0;
	function getEasteggs() {
		let myDentistList = ${myDentistList}.myDentistList;
		
		const promise = new Promise((resolve, reject) => {
			let list = [];
			let allCost = 0;
			var toothRankMap = new Map();
			// 사용자의 모든 '내 치과'에 예약정보를 확인해서 받아오는 통신.
			for(let i=0; i < myDentistList.length; i++) {
				$.ajax({
					url: "http://localhost:" + myDentistList[i].dendomain + "/springframework-mini-project-dentist/treatment/easteregg",
					method:"POST",
					async: false,
					data: {
						patientssn: "${patientssn}"
					}
				})
				.done((data) => {
					console.log("data:"+data);
					//전체 가격 더하는 반복문
					data.list.forEach((element) => {
						allCost += element.treatcost;
					})
					//전체 치아 순위 구하는 반복문
					data.toothno.forEach((element) => {
						console.log('data.toothno : ' + element["toothno"]);
						list.push(element);
					})
					console.log('list : ' + list);
					console.log('list[0]["toothno"] : ' + list[0]["toothno"]);
					//list를 치아 갯수만큼 반복문 돌면서 카운팅.
					// const toothRankObj = {}; //더 상단에 전역변수로 선언해야 함.
					console.log('for(let i=0; i<list.length; i++) 시작~~');
					for(let i=0; i<list.length; i++) {
						if(toothRankMap.has(list[i]["toothno"])) {
							//이미 해당 toothno를 key로 하는 원소가 있으므로, key에 대한 value를 찾아서 +1.
							toothRankMap.set(list[i]["toothno"], toothRankMap.get(list[i]["toothno"]) + 1);
						} else {
							//toothno를 key로 하고, value가 1인 원소를 생성.
							toothRankMap.set(list[i]["toothno"], 1);
						}
					}
				});
			}			
			const sortedToothRankMap = new Map( [...toothRankMap.entries()].sort((a, b) => b[1] - a[1]) );
			let keys = Array.from(sortedToothRankMap.keys());
			if(sortedToothRankMap.size >= 3) {//toothno의 종류가 3가지 이상인 경우.
				for(let i=0; i<3; i++) {
					if(i === 0) {
						$('#first').html("🥇 " + keys[i] + "번");
					} else if(i === 1) {
						$('#second').html("🥈 " + keys[i] + "번");
					} else {
						$('#third').html("🥉 " + keys[i] + "번");
					}
				}
			} else {//toothno의 종류가 3가지 미만인 경우.
				for(let i=0; i<keys.length; i++) {
					if(i === 0) {
						$('#first').html("🥇 " + keys[i] + "번");
					} else if(i === 1) {
						$('#second').html("🥈 " + keys[i] + "번");
					}
				}
			}

			list.push(allCost);
			if(list != null) {
				console.log(allCost);
				resolve(list);
			} else {
				reject({message: "실패"});
			}
			
		});
		return promise;
	}
	
	async function getData() {
		try {
			let data = await getEasteggs();
			console.log(data);
			$("#price").html(data[data.length - 1].toLocaleString() + "원");
			
			console.log("after", data);
			
 			for(let i=0; i < data.length - 1; i++) {
				console.log('data[' + i + '] : ' + data[i]);
			}

			// $("#first").html(🥇);
			// $("#second").html(🥈 + "data.toothno[1].treatno");
			// $("#third").html(🥉 + "data.toothno[2].treatno");
		} catch (error) {
			console.log(error, "error");
		} finally {
			
		}
	}

	Kakao.Link.createCustomButton({
		container: '#test',
		// objectType: 'feed',
		templateId : ${76477}
		// content: {
		// 	title: '치스토리',
		// 	description: 'EASTEREGG',
		// imageUrl:'http://mud-kage.kakao.co.kr/dn/NTmhS/btqfEUdFAUf/FjKzkZsnoeE4o19klTOVI1/openlink_640x640s.jpg',
		// link: {
		// 	mobileWebUrl: 'http://192.168.1.239:8081/springframework-mini-project/myPage/easteregg',
		// 	// mobileWebUrl: 'http://192.168.1.129:8081/springframework-mini-project/',
		// },
		// },
		// social: {
		// likeCount: 10,
		// commentCount: 20,
		// sharedCount: 30,
		// },
		// buttons: [
		// {
		// 	title: '웹으로 이동',
		// 	link: {
		// 	mobileWebUrl: 'http://192.168.1.239:8081/springframework-mini-project/myPage/easteregg',
		// 	// mobileWebUrl: 'http://192.168.1.129:8081/springframework-mini-project/myPage/easteregg',
		// 	},
		// },
		// ]
	});
	  
</script>

</html>