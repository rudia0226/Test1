<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#copyPart_Container{
	display:none;
	/* visibility: hidden; */
}
</style>
<script type="text/javascript">
	
	
	$(function(){
		
		<c:forEach var="i" items="${getCaList}">
		
			// DB의 카테고리 list보기 (select 자동 가져오기) 
			$("#selOption_${i.ca_Key}").find('option').each(function(){
				if(this.value== "${i.ca_Type}"){
					console.log(this.value);
					$(this).attr("selected","selected");
				}
			});
			
			// 카테고리 수정 click시, 창 활성화로 변경
			$(".modiB_${i.ca_Key}").click(function(){
				$(".fixSpan_${i.ca_Key}").attr("hidden","hidden");
				$(".modiSpan_${i.ca_Key}").removeAttr("hidden");
				$(".regB_${i.ca_Key}").removeAttr("hidden");
				$(".resultMG_${i.ca_Key}").empty();
			});
		</c:forEach>
		
		<c:forEach var="i" items="${getCaList}">
		
			// 카테고리 수정
			$(".regB_${i.ca_Key}").click(function(){
				var cakey = parseInt($("#getCaKey").text());
				var catype = parseInt($(".SelectedType_${i.ca_Key}").val());
				var cavalue = $(".SelectedValue_${i.ca_Key}").val();
				alert("저장하시겠습니까?");
				console.log("key :" + cakey);
				console.log("type : " + catype);
				console.log("value : "+ cavalue);
				
				var cavalueKo = null;
				
				if(catype == 100){
					cavalueKo = "고정수익";
				}else if (catype == 101){
					cavalueKo = "변동수익";
				}else if (catype == 102){
					cavalueKo = "기타수익";
				}else if (catype == 200){
					cavalueKo = "고정비용";
				}else if (catype == 201){
					cavalueKo = "변동비용";
				}else {
					cavalueKo = "기타비용";
				} 
				
				// AJAX 저장버튼 누르면 실행
				$.ajax({
					url : "modify.calist.do",
					data : {K : cakey, T : catype, V : cavalue},
					success : function(v){
						if (v == 1) {
						$(".resultMG_${i.ca_Key}").text("수정이 완료되었습니다.").css("color","#AEB6BF");	
						$(".modiSpan_${i.ca_Key}").attr("hidden","hidden");
						$("#ajaxType_${i.ca_Key}").removeAttr("hidden").html(cavalueKo);
						$("#ajaxValue_${i.ca_Key}").removeAttr("hidden").html(cavalue);
						
						} else{
						$(".resultMG_${i.ca_Key}").text("문제가 발생하였습니다. ");							
						} 
					}
				});
			});
		/************************************************************************************/
		$(".delB_${i.ca_Key}").click(function(){
				var cakey = parseInt($("#getCaKey").text());
				alert("삭제하시겠습니까?");
				console.log("key :" + cakey);
				
				
				var cavalueKo = null;
				
				
				
				// AJAX 삭제버튼 누르면 실행
				$.ajax({
					url : "delete.calist.do",
					data : {K : cakey},
					success : function(v){
						if (v == 1) {
						alert("삭제!");
						/* $(".resultMG_${i.ca_Key}").text("삭제가 완료되었습니다.");	 */
					/* 	$(".modiSpan_${i.ca_Key}").attr("hidden","hidden");
						$("#ajaxType_${i.ca_Key}").removeAttr("hidden").html(cavalueKo);
						$("#ajaxValue_${i.ca_Key}").removeAttr("hidden").html(cavalue); */
						
						} else{
						$(".resultMG_${i.ca_Key}").text("문제가 발생하였습니다. ");							
						} 
					}
				});
			});
		/************************************************************************************/
		</c:forEach>
			
		// 카테고리 입력을 위한 테이블 추가 및 삭제 
		var num = 1;
		$("#addB").click(function(){
			//copyPart 복사본 생성
			var copyPart = $("#copyPart_Container > .copyPart").clone();
			//copyPart 자식 노드인 select에 id 추가
			copyPart.attr("id", "copydiv"+num);
			copyPart.children("select").attr("id", "select"+num);
			//id가 addPart인 노드에 추가
			copyPart.appendTo("#addPart");
			$("#copydiv"+num+" > select:nth-child(1)").attr("class", "InsertSel"+num);
			$("#copydiv"+num+" > input:nth-child(2)").attr("class", "InsertInput"+num);
			$("#copydiv"+num+" > button:nth-child(3)").attr("class", num);
			$("#copydiv"+num+" > button:nth-child(4)").attr("class", num);
			$("#copydiv"+num+" > span:nth-child(5)").attr("id", "spanRst"+num);
			num += 1;
		});
		
			
		$(".radio").click(function(){
			var value = $('input:radio[name="search"]:checked').val();
			alert(value);
			$('input:radio[name="search"][value='+value+"]").prop('checked', true);
			
			var value = parseInt(value);
			location.href = "caedit.go?Ca_Group="+value;
			
		});
		
		
	});
	
	// 삭제
	function delLine(button){
		var isDel = confirm("삭제하시겠습니까?");
		if(isDel) 	
			$(button).parents(".copyPart").remove();
	}
	
	// 옵션 선택했을 때 기존 selected 속성 지우고 새로 선택된 부분에 selected속성주기.
	//function changeSelect(opt, select){
		/* $(select).find('option').removeAttr("selected");
		$(select).find('option').each(function(){
			if(this.value == opt){
				$(this).attr("selected","selected");
			}
		}); */
	//}
	
	// 카테고리 신규 생성 _ 내용 저장
	function regNewLine(obj) {
		var num = obj.className;                 //[0] html DOM객체로 만들어줌
		var selectedOptionIndex = $("#select"+num)[0].selectedIndex;  // selectBox에서 선택된 인덱스를 가져옴 
		var type = $("#select"+num+" option").eq(selectedOptionIndex).val();
		alert(type);
		var n_caType = parseInt(type);
		var n_caValue = $(".InsertInput"+num).val();
		var n_caGroup = type.substring(0,1);
		alert(n_caType);
		alert(n_caValue);
		alert(n_caGroup);
		
			$.ajax({
				url : "newCa.reg",
				data : {GG : n_caGroup, TT : n_caType, VV : n_caValue},
				success : function(v){	
				alert("저장결과" + v);
					if ( v == 1) {
						$("#spanRst"+num).text("신규카테고리 등록 완료").css("color","#AEB6BF");	
						$(".InsertSel"+num).attr("readonly","readonly"); 
						$(".InsertInput"+num).attr("readonly","readonly");
						$(".newGegB").remove();
						
					} else{
						$("#spanRst"+num).text("문제가 발생하였습니다. ");							
					}
				}
			});
			
	}
	
 	/*  function getListChange(b, v) {
		var searchG = parseInt($("[name=search]:checked").val());
		alert(searchG);
		location.href = "caedit.go?Ca_Group="+searchG;
		$(b).attr("checked", "checked")
	}  */
	
	
	
	function del_cate(n) {
		alert(n);
		location.href='delete.calist.do?Ca_Key='+n;
	}
	
	
	
</script>
</head>

<body>
<div class="containerDIVC">
<span class="spanTITLECA">Category List</span><p>
<div class="containerDIVCA">

<table id="ca_Table">
	<tr>
		<td align="center" valign="middle">
			<input class="radio" type="radio" name="search" value="0">전체&nbsp;&nbsp;&nbsp;
			<input class="radio" type="radio" name="search" value="1">수입&nbsp;&nbsp;&nbsp;
			<input class="radio" type="radio" name="search" value ="2">지출&nbsp;&nbsp;&nbsp;
		</td>
		<td align="center"   valign="middle" >
			<input id="addB"  class="addB" type="button" value="추가"><br/>
		</td>
	</tr> 
</table>
<p><p>
<table  style=" border-color: #ECF0F1;  border-left: 1px solid white;  border-right: 1px solid white;"  border="1">
	<tr>  
		<td align="center" valign="middle" class="tableTD1">SORT</td> 
		<td align="center" valign="middle" class="tableTD2">CATEGORY</td>
		<td align="center" valign="middle" class="tableTD3">BOTTON</td> 
	</tr>
	<c:forEach var="i" items="${getCaList}">
	<tr> 
		<td align="center" class="tableTD1_1"> 
			<span hidden="hidden" id ="getCaKey">${i.ca_Key}></span>
			<span id="ajaxType_${i.ca_Key }" class ="fixSpan_${i.ca_Key } fixSpanCSS" >
				<c:if test="${i.ca_Type==100}">고정수익</c:if>
				<c:if test="${i.ca_Type==101}">변동수익</c:if>
				<c:if test="${i.ca_Type==102}">기타수익</c:if>
				<c:if test="${i.ca_Type==200}">고정비용</c:if>
				<c:if test="${i.ca_Type==201}">변동비용</c:if>
				<c:if test="${i.ca_Type==202}">기타비용</c:if>
			</span>
			<span class ="modiSpan_${i.ca_Key }" hidden="hidden">
				<select id="selOption_${i.ca_Key}" class ="SelectedType_${i.ca_Key} SelectedTypeCSS" name="Ca_Type">
						<c:if test="${i.ca_Group == 1}">
							<option value="100" >고정수익</option>  <!-- 조건에 맞으면 selected로 설정되도록 -->
							<option value="101" >변동수익</option>
							<option value="102" >기타수익</option>
						</c:if>
						<c:if test = "${i.ca_Group == 2}">
							<option value="200" >고정비용</option>
							<option value="201" >변동비용</option>
							<option value="202" >기타비용</option>
						</c:if>
						<c:if test = "${i.ca_Group == 0}">
							<option value="100" >고정수익</option>  <!-- 조건에 맞으면 selected로 설정되도록 -->
							<option value="101" >변동수익</option>
							<option value="102" >기타수익</option>
							<option value="200" >고정비용</option>
							<option value="201" >변동비용</option>
							<option value="202" >기타비용</option>
						</c:if>
				</select>
			</span>
		</td> 
		<td  class="tableTD2_1"  align="center">
			<span id ="ajaxValue_${i.ca_Key }" class ="fixSpan_${i.ca_Key } fixSpanCSS">${i.ca_Value}</span>
			<span class ="modiSpan_${i.ca_Key }" hidden="hidden">
				<input type="text" name="Ca_Value" class="SelectedValue_${i.ca_Key}" value="${i.ca_Value}">
			</span>
		</td>
		<td class="tableTD3_1" align="center">
		 	<input class="modiB_${i.ca_Key}  modiBCSS" type="button" value="수정">
			<button class="regB_${i.ca_Key}  regBCSS" hidden="hidden" >저장</button>
			<button class="delB_${i.ca_Key}  delCSS" onclick="del_cate(${i.ca_Key});">삭제</button>
			<span class ="resultMG_${i.ca_Key}  resultMGCSS"></span></td>
	</tr>
	</c:forEach>
</table>
<p><p> 
</div>
	
	<div id="copyPart_Container">
		<div class="copyPart"> 		<!-- hidden / 카테고리 추가 시 이 부분이 복사되어 새로 생성됨 -->
			<select class="selectCSS">
				<option value="100" >고정수익</option> 
				<option value="101" >변동수익</option>
				<option value="102" >기타수익</option>
				<option value="200" >고정비용</option>
				<option value="201" >변동비용</option>
				<option value="202" >기타비용</option>
			</select>			
			<input  type="text" name="title" placeholder="세부내역입력">
			<button type="button" onclick="regNewLine(this)"  class="saveBtnCSS">저장</button>	
			<button type="button" onclick="delLine(this);"  class="delBtnCSS">삭제</button>
			<span></span>
		</div>
	</div>
	<br>
	
	<!-- category 새로 생성시 추가되는 부분 -->
	<div id="addPart">	</div>
	</div>
<p><p> 
<p><p> 
<p><p> 
</body>
</html>