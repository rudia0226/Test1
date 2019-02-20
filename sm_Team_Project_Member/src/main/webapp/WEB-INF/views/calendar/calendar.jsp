<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%@page import="com.sm.household.calendar.Hcalendar"%>
<html>
<head>
<meta charset='utf-8' />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<link href='resources/hcalendar/fullcalendar.min.css' rel='stylesheet' />
<link href='resources/hcalendar/fullcalendar.print.min.css' rel='stylesheet' media='print' />


<title>Insert title here</title>

<script src='resources/hcalendar/moment.min.js'></script>
<script src='resources/hcalendar/fullcalendar.min.js'></script>
<script src='resources/js/jquery.js'></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<link href='resources/css/calendar.css' rel='stylesheet' />
<style type="text/css">
	.tdHidden{display:none;}
	.shwoSpan{display: none;}
</style>


<script type="text/javascript">

var fulldate = null;

document.addEventListener('DOMContentLoaded', function() {

	
  var calendarEl = document.getElementById('calendar');
  
  var book_data = ${events};
 
  var calendar = new FullCalendar.Calendar(calendarEl, {

    defaultDate: '${current_date}',
    
    navLinks: false, 

    dayClick: function(date) {
    //  var title = prompt('Event Title:'+ date.format() );
  
      //달력 Day부분 td쪽 클래스
      $("td.fc-day.fc-widget-content").css('background-color', 'transparent');
      
   	  //console.log($(this).attr("class")); 
   	  $(this). css('background-color', '#FEF5E7'); 
   	   
   	  var wantedday = date.format();
   	  $.getJSON('calendar.getdaily?wantedday=' +wantedday, function(h) {
   	
   		//  $('.getdailyview').remove();
   		  $('.dataDIV').remove();
   		  
   		  
   		  $.each(h.calendar, function(i, c) {
   			var table = $('<table></table>').attr("class", "getdailyview");
			 
   			datenewFomat(c.data_Date);
			var date_b =$("<td></td>").text(fulldate);
			
			var id_b;
			if(c.Ca_Group == 1){
				id_b =$("<td></td>").text("수입");				
			}else{
				id_b =$("<td></td>").text("지출");				
			}
			var cate_b =$("<td></td>").text(c.ca_Value).attr('align','left');
			var amount_b =$("<td></td>").text(c.data_Amount +'원').attr('align','left');
			var memo_b =$("<td></td>").text(c.data_Memo).attr('align','left');
			
			var date_a =$("<td> 날짜 </td>").attr("class", "dataTd");
			var id_a =$("<td> 수입/지출 </td>").attr("class", "dataTd");
			var cate_a =$("<td> 카테고리 </td>").attr("class", "dataTd");
			var amount_a =$("<td> 금액 </td>").attr("class", "dataTd");
			var meno_a =$("<td> 메모 </td>").attr("class", "dataTd");
			
			var date =$("<tr></tr>").append(date_a).append(date_b);
			var id =$("<tr></tr>").append(id_a).append(id_b);
			var cate =$("<tr></tr>").append(cate_a).append(cate_b);
			var amount =$("<tr></tr>").append(amount_a).append(amount_b);
			var memo =$("<tr></tr>").append(meno_a).append(memo_b);
			
			$(table).append(date, id, cate, amount, memo);
			
			var tablediv = $("<div></div>").attr("class", "dataDIV");
			tablediv.append(table); 
			
			$(".datafield").append(tablediv); 
		});
   		
    	
		});
  	 	
    },
    
    eventClick: function(event) {
		datenewFomat(event.start);
		
		 $.each(event, function(key, value) {
				
				if(key === "goal"){
					console.log(key+": "+value);
					swal("미션 성공!" ,value +"원 남음");
										
				};
			 
		 });
	 
		
	},
   	displayEventTime: false,
    editable: false,   //일정바를 움직이는 여부
    events: book_data
  	  
  });
  
  

  calendar.render();
  
});


function datenewFomat(d) {
	var date = new Date(d);
	var y = date.getFullYear();
	var m = date.getMonth() +1;
	var d = date.getDate();
	fulldate = y +'-'+ (m < 10 ? '0' : '') + m +'-'+ (d < 10 ? '0' : '') + d;
}

function updatebutton() {
	
	var button = $("#goalAmount").attr("type");
	
	if(button == "hidden"){
		$("#goalAmount").attr("type","text");
		//$("#goaldiv span").hide();
		$("#goaldiv span").remove();
		$("#updategoal").text("변경");
	
	} else{
		
		var goalAmount = $("#goalAmount").val();
		
		
		$.ajax({
			url:"calendar.setGoal",
			type: "get",
			data: {goal_amount : goalAmount},
			success: function(g) {
				/* 함수 
				var spanGoal = $("<span></span>").text("목표 금액 : "+g+"원")
				$("#updategoal").before(spanGoal);*/
				location.href="calendar"; 
			},
			error: function() {
				swal("숫자로만 입력하세요");
				var spanGoal = $("<span></span>").text("목표 금액 : "+"${MonthGoal}"+"원")
				$("#updategoal").after(spanGoal);
				$("#goalAmount").attr("type","hidden");
				$("#updategoal").text("목표금액 설정");
			}		
		 
		  });
	}
}
</script>

</head>
<body >
<div id="calendarbody"  class="calendarbody">
<div  class="containerCalendar">
	<table id="goaltable" >
		<tr>
			<td>
				<div id = "goaldiv">
				<button onclick="showDiv()"  class="showbtn">입력창</button>
				<input name="goalAmount" type="hidden" id="goalAmount" maxlength="7" placeholder="${goal_amount}">
				<button id="updategoal" onclick="updatebutton();">목표금액 설정</button> 
				<span>목표 금액 : ${MonthGoal}원</span>
				</div>
			<div id="showDiv" class="showDiv">
					<button id="addIn" class="inBtn">추가</button>
					<button onclick="location.href='calendar'" class="closeBtn">닫기</button>
					<p><p>
					<table id="maintable" border="1" >
						<tr id="title" background="black">
							<th>결제수단</th>
							<th>결제일</th>
							<th>금액</th>
							<!-- <th>메모</th>
							<th>확인</th> -->
						</tr>
						<tr id="insertTr0">
					<!-- hidden 속성의 객체들-------------------------------------------------------------------------------- -->
						<td class="tdHidden">
				  			<select id="Ca_Group" class="selectInsert" onchange="inoutSelect(this.value,this)">
								<option value="">전체</option>
								<option value="2">지출</option>
								<option value="1">수입</option>
							</select>
							<span id="selectSpan" class="shwoSpan"></span>
							<select id="Pay_Value" class="selectInsert" onchange="paySelect(this.value,this)">
								<option value="">전체&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
							</select>
							<select id="Ca_Value" class="selectInsert">
								<option value="">전체&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
							</select>
							<input id="Date_Date" type="date" class="inputInsert">
							<span id="dateSpan"></span>
							<input id="Data_Amount"  class="inputInsert" placeholder="금액을 입력하세요"/>
							<span id="amountSpan" class="shwoSpan"></span>
							<textarea row="3" id="Data_Memo" class="txtareaInsert" placeholder="메모"></textarea>
							<span id="memoSpan" class="shwoSpan"></span>
							<button type="submit" id="okBtn" onclick="inAndUp(this)" class="btbInsert" value="0">입력</button>
							<button type="submit" id="deleteBtn" onclick="deleteData(this)" class="btbInsert">삭제</button>
							<label id="dataNo"></label>
						</td>				
					<!-- ----------------------------------------------------------------------------------------------- -->
					<td id="selectTd">
						<label id="dataNo0" style="display:none;"></label>
						<select id="Ca_Group0" class="selectInsert" onchange="inoutSelect(this.value,this)">
							<option value="">전체&nbsp;&nbsp;&nbsp;&nbsp;</option>
							<option value="2">지출&nbsp;&nbsp;</option>
							<option value="1">수입&nbsp;&nbsp;</option>
						</select>
						<select id="Pay_Value0" class="selectInsert" onchange="paySelect(this.value,this)">
		    				<option value="">전체&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
		    			</select>
		    			<select id="Ca_Value0" class="selectInsert">
		    				<option value="">전체&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
		    			</select>
		    			<span id="selectSpan0"  class="shwoSpan"></span>
		    		</td>
					<td id="dateTd">
						<input id="Date_Date0" type="date">
						<span id="dateSpan0" class="shwoSpan"></span>
					</td>
					<td id="amountTd">
						<input id="Data_Amount0" placeholder="금액을 입력하세요"/>
						<span id="amountSpan0" class="shwoSpan"></span>
					</td>
					</tr>
					
					<tr id="insertTrr0">
						<td id="memoTd" colspan="2">
							<textarea rows="3" id="Data_Memo0" class="txtareaInsert" placeholder="메모입니다"></textarea>
							<span id="memoSpan0" class="shwoSpan"></span>
						</td>
		
						<td id="btnTd">
							<button type="submit" id="okBtn0" onclick="inAndUp(this)" value="0">입력</button>
							<button type="reset" id="deleteBtn0" onclick="deleteData(this)">삭제</button>
						</td>	
					</tr>
				</table></div>	
			</td>
			<td>
				<div>이번 달 남은 잔액 : ${remaining}</div>
			</td>
		</tr>
	</table>
	<br>
	<div id='calendar'></div>
	
<%-- 	<img src="${pageContext.request.contextPath}/resources/js/09.jpg"> --%>
	
	<div class="datafield"></div>
</div>	
</div>
</body>
</html>