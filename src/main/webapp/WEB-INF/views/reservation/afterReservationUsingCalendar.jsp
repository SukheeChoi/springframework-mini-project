<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
   <%@ include file="/WEB-INF/views/common/meta.jsp" %>
   <title>치스토리-진료 예약하기</title>
   <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/appIcon.png">
   <style>
   
   #submit{
        color: white;
           background-color: #f47d36;
           border-color: #f47d36;
           width:90%;
         height:3rem;
         border-radius:1rem;
         margin-left:1rem;
   }
   #reservation{
       margin-left:13px;
       width:22rem;
       height:5rem;
       margin-top: 10px;
   }
   .container{
       display: flex;
       flex-direction: row;
       margin-top:20px;
   }
   </style>
</head>
<script>
   $.ajax({
      method:"POST",
      url: "${pageContext.request.contextPath}/reservation/getRecipientInformation",
      data: {
      }
   })
   .done((data) => {
      console.log('~~');
      console.log('data : ' + data);
      console.log('typeof data : ' + typeof data);
      console.log('data["userName"] : ' + data["userName"]);
      console.log('typeof data["userName"] : ' + typeof data["userName"]);
      // console.log('JSON.parse( data ) : ' + JSON.parse( data ) );
      // console.log('typeof JSON.parse( data ) : ' + typeof JSON.parse( data ) );
      // console.log('JSON.parse( data )["userPhone"] : ' + JSON.parse( data )["userPhone"] );
      // console.log('typeof JSON.parse( data )["userPhone"] : ' + typeof JSON.parse( data )["userPhone"] );
      // console.log('JSON.parse( data )["userName"] : ' + JSON.parse( data )["userName"] );
      // console.log('typeof JSON.parse(data)["userName"] : ' + typeof JSON.parse( data )["userName"] );
      $('input#name').attr('value', data["userName"]);
      $('input#phone').attr('value', data["userPhone"]);
   });
</script>
<body>
   <%@ include file="/WEB-INF/views/common/loading.jsp" %>
   <%@ include file="/WEB-INF/views/common/header.jsp"%>

<div class="located-at-bottom-of-header">
   <div class="container" id="top">
        <div>
            <div id="denname" style="width:10rem; margin-top:20px; font-weight:bold;">Ant 치과 진료예약</div>
            <div id="reservationSelectTime" style="margin-top:25px; text-decoration: none; color: rgb(222, 149, 13); font-weight:bold;"></div>
        </div>
        
   </div>
   <div>
        <div style="margin-top:80px; text-decoration: none; color:grey; margin-left:1rem;">예약자 정보</div>
        <div>
            <div>
                <div style="margin-top:20px; margin-left:1rem;">이름  <input id="name" style="margin-top:20px; margin-left: 30px; border:0px solid black;" type="text"></div>
            </div>
            <div>
                <div style="margin-top:20px; margin-left:1rem;">연락처  <input id="phone" style="margin-top:20px; margin-left: 15px;border:0px solid black;" type="text"></div>
            </div>
        </div>
   </div>
    <div>
        <div  style="margin-top:40px; margin-left:1rem;">예약 사유</div>
        <input id="reservation" type="text" placeholder="진료를 예약하는 이유를 적어주세요(증상, 희망 진료 등)" style="border:0.5px solid lightgrey;">
    </div>
    <div>
        <button id="submit" type="button" style="border: 0px solid black; margin-top:1rem;">예약 신청하기</button>
    </div>
    </div>
<script>
console.log('patientssn : ' + "${patientssn}");
console.log('dendomain : ' + ${dendomain});
$.ajax({
   method:"POST",
   url: "http://localhost:"+ ${dendomain} +"/springframework-mini-project-dentist/deninfo/getdeninfo",
   // url: ${dendomain} + "/springframework-mini-project-dentist/deninfo/getdeninfo",
   data: {
   },
})
.done((data) => {
   document.getElementById('denname').innerHTML = data.denname;
   
   console.log(data);
});
var date = "<%= request.getParameter("date") %>";
console.log(date);
if(date.length==15){
formatdate=date.substr(5,2)+"월 "+date.substr(8,2)+"일 "+date.substr(10,2)+"시 "+date.substr(13,2)+"분 ";
}
else if(date.length==14){
formatdate=date.substr(5,2)+"월 "+date.substr(8,2)+"일 "+date.substr(10,1)+"시 "+date.substr(12,2)+"분 ";
}
document.getElementById("reservationSelectTime").innerHTML=formatdate;
var aformatDate =date.substr(0,4) + "/" +  date.substr(5,2) + "/" + date.substr(8,2);
console.log(aformatDate);


if(date.length==14){
var tformatDate =date.substr(10,1)+date.substr(12,2);
atimeIndex=(tformatDate.substr(0,1)*2)+(tformatDate.substr(1,2)/30)+8;
}
else if(date.length==15){
   var tformatDate =date.substr(10,2)+date.substr(13,2);
   atimeIndex=(tformatDate.substr(0,2)*2)+(tformatDate.substr(2,2)/30)+8;
}


//atime[i]=Math.floor((i*30)/60)+":"+(i*30)%60;   9시반이면 00000000000000000001(20) 10시이면 000000000000000000001(21)
console.log('atimeIndex : ' + atimeIndex);

$.ajax({
   url:'http://localhost:' + ${dendomain} + '/springframework-mini-project-dentist/availablehour/getHour?date=' + aformatDate
   , async: false
   })
   .done((data) => {
      
      a=JSON.stringify(data);
      console.log("문자열 형태 : "+a);
      b=a.charAt(atimeIndex);
      console.log(b);
      //b의 위치를 0으로
      String.prototype.replaceAt = function(index, replacement) {
          return this.substr(0, index) + replacement + this.substr(index + replacement.length);
      }
      console.log(a.replaceAt(atimeIndex+1,"0"));
      testchangeAvailableTime=a.replaceAt(atimeIndex+1,"0");
      console.log(testchangeAvailableTime.substr(9,48));
      changeAvailableTime=testchangeAvailableTime.substr(9,48);
      //changeAvailableTime  예약 후 disabled 시간       날짜 aformatDate
      $("#submit").click(function(){
         console.log("asda");
         console.log("tformatDate : " + tformatDate);
         //클릭하면 availabledate의 날짜 availabletime의 0011010 위치를 찾아와 0으로 만들기 /// b를 0으로 만들기  atimeIndexatimeIndexatimeIndexatimeIndexatimeIndexatimeIndexatimeIndex         
         $.ajax({
             url: 'http://localhost:' + ${dendomain} + '/springframework-mini-project-dentist/availablehour/setHour?availabledate=' + aformatDate,
             type: 'POST',
             data: { 
                 "patientssn" : "${patientssn}", 
                "tformatDate":tformatDate,
                "name": $("#name").val(),
                "phone": $("#phone").val(),
                "reservation": $("#reservation").val(),
                 "availabletime": changeAvailableTime,
            }
            , async: false
         })
         .done((data) => {  
			console.log('11data["msg"] : ' + data["msg"]);    
			console.log('11typeof data["msg"] : ' + typeof data["msg"]);    
			if(data["msg"] === "hi~") {
				// 1만 포인트를 차감해서 스케일링 할인받은 경우.
				console.log('${gotDiscount} : ' + ${gotDiscount});
				console.log('typeof ${gotDiscount} : ' + typeof ${gotDiscount});
				if(${gotDiscount} === 1) {
					$.ajax({
						url: '${pageContext.request.contextPath}/myPage/minusPoint',
						type: 'POST',
						data: { 
						}
						, async: false
					})
					.done((data) => {  
						location.href = "${pageContext.request.contextPath}/";
					});
				} else {//스케일링 할인 X인 경우.
					location.href = "${pageContext.request.contextPath}/";
				}
			} else {
				//예약을 완료할 수 없는 경우임. 예외처리 필요.
			}
         });
      })
   });
</script>   



   <%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>