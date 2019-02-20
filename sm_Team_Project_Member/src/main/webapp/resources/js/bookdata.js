function inoutSelect(Ca_Group,test1) {
	var getId = $(test1).attr("id");
	var num = getId.substring(8);
	$.ajax({
		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
		type : "POST",
		url : "getPayinfo.do",
		dataType : "json",
		data : {param : Ca_Group},
		success : function(result) {
			$("#Pay_Value"+num+"").find("option").remove().end().append("<option value=''>전체</option>");
			$.each(result, function(i,v) {
				$("#Pay_Value"+num+"").append("<option value='" + v.pay_Id + "'>" + v.pay_value+ "</option>")
			});
			
			
		
		},
		error : function(jqXHR, textStatus, errorThrown) {
			swal("select box1 오류가 발생하였습니다.");
		}
	});
}
function paySelect(Pay_Value,test2) {
	var getId = $(test2).attr("id");
	var num = getId.substring(9);
	var catekey = $("#Ca_Group"+num+"").val();
	$.ajax({
		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
		type : "POST",
		url : "getCatevalue.do",
		dataType : "json",
		data : {param : Pay_Value,param2 : catekey},//parma없어도되는 부분
		success : function(result) {
			$("#Ca_Value"+num+"").find("option").remove().end().append("<option value=''>전체</option>");
			$.each(result, function(i,v) {
				$("#Ca_Value"+num+"").append("<option value='" + v.ca_Key + "'>" + v.ca_Value+ "</option>")
			});
			
			
		},
		error : function(jqXHR, textStatus, errorThrown) {
			swal("select box2 오류가 발생하였습니다.");
		}
	});
}
///////////////////////////////////////////////////////////////////////////////////////////////
$(function() {
	var cnt = 1;
	$("#addIn").click(function() {
		var ca_td = $("#maintable").find("#Ca_Group").clone().attr("id","Ca_Group"+cnt+"").show();
		var pay_td = $("#maintable").find("#Pay_Value").clone().attr("id","Pay_Value"+cnt+"").show();
		var caval_td = $("#maintable").find("#Ca_Value").clone().attr("id","Ca_Value"+cnt+"").show();
		var select_td = $("<td></td>").append(ca_td,pay_td,caval_td);
		
		var date_td = $("#maintable").find("#Date_Date").clone().attr("id","Date_Date"+cnt+"").show();
		var amount_td = $("#maintable").find("#Data_Amount").clone().attr("id","Data_Amount"+cnt+"").show();
		var memo_td = $("#maintable").find("#Data_Memo").clone().attr("id","Data_Memo"+cnt+"").show();
		
		
		
		var del = $("#maintable").find("#deleteBtn").clone().attr("id","deleteBtn"+cnt+"").show();
		var ok_btn =$("#maintable").find("#okBtn").clone().attr("id","okBtn"+cnt+"").show();
		var ok_del = $("<td></td>").append(ok_btn,del);
		
		var selectSpan = $("#maintable").find("#selectSpan").clone().attr("id","selectSpan"+cnt+"").show();
		var dateSpan = $("#maintable").find("#dateSpan").clone().attr("id","dateSpan"+cnt+"").show();
		var amountSpan = $("#maintable").find("#amountSpan").clone().attr("id","amountSpan"+cnt+"").show();
		var memoSpan = $("#maintable").find("#memoSpan").clone().attr("id","memoSpan"+cnt+"").show();
		
		var dataNo = $("#maintable").find("#dataNo").clone().attr("id","dataNo"+cnt+"");
		
		var firstTd = $("<td></td>").append(dataNo,ca_td,pay_td,caval_td,selectSpan);
		var secondTd = $("<td></td>").append(date_td,dateSpan);
		var thTd = $("<td></td>").append(amount_td,amountSpan);
		var foTD = $("<td></td>").attr("colspan","2").append(memo_td,memoSpan);
		
		var Ftr = $("<tr></tr>").attr("id","insertTr"+cnt+"").append(firstTd,secondTd,thTd,foTD,ok_del);
		var Str = $("<tr></tr>").attr("id","insertTrr"+cnt+"").append(foTD,ok_del);
		
		$("#maintable").append(Ftr,Str);
		
		cnt+=1;
	});
});
/////////////////////////////////////////////////////////////////////////////////////////////////////
function deleteData(del) {
	var getId = $(del).attr("id");
	var num = getId.substring(9);
	/*var cateGG =$("#Ca_Group"+num+" option:selected").html();
	var payV = $("#Pay_Value"+num+"").html();
	var cateV = $("#Ca_Value"+num+"").html();
	var amountA = $("#Data_Amount"+num+"").val();
	var memoM = $("#Data_Memo"+num+"").val();
	var dataD = $("#Date_Date"+num+"").val();
	
	*/
	var dataNo = $("#dataNo"+num+"").html();
	
	/*if($("#deleteBtn0").attr("id")==getId){
		alert("삭제불가능"); return false;
	}*/
	$.ajax({
		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
		url : "deleteData.do",
		type : "POST",
		data : {param7 : dataNo},//dataNo 빼고는 필요없는 부분ㅠㅠ
		success : function(result) {
			swal("삭제성공");
			if(num==0){
				$("#selectSpan"+num+"").css("display","none");
				$("#amountSpan"+num+"").css("display","none");
				$("#memoSpan"+num+"").css("display","none");
				$("#dateSpan"+num+"").css("display","none");
				
				$("#Ca_Group"+num+"").css("display","inline-block");
				$("#Pay_Value"+num+"").css("display","inline-block");
				$("#Ca_Value"+num+"").css("display","inline-block");
				$("#Date_Date"+num+"").css("display","inline-block");
				$("#Data_Amount"+num+"").css("display","inline-block");
				$("#Data_Memo"+num+"").css("display","inline-block");
				$("#okBtn"+num+"").html("입력");
				
				
				$("#Ca_Group0").find('option:first').attr('selected', 'selected');
				$("#Pay_Value0").find('option:first').attr('selected', 'selected');
				$("#Ca_Value0").find('option:first').attr('selected', 'selected');
				$("#Data_Amount0").val("");
				$("#Data_Memo0").val("");
				$("#Date_Date0").val("");
			}else{
				$("#insertTr"+num+"").remove();
				$("#insertTrr"+num+"").remove();
			}
		},
		error : function(jqXHR, textStatus, errorThrown) {
			swal("삭제 버튼 오류가 발생하였습니다.");
		}
	});
	
}
///////////////////////////////////////////////////////////////////////////////
function inAndUp(inAndUp) {
	var getId = $(inAndUp).attr("id");
	var num = getId.substring(5);
	var cateGG =$("#Ca_Group"+num+" option:selected").val();
	
	var payV = $("#Pay_Value"+num+"").val();			//alert($("#Pay_Value0 option:selected").text());
	
	
	var payId = $("#Pay_Value"+num+" option:selected").text();
	
	
	var cateV = $("#Ca_Value"+num+"").val();
	
	
	var cateId = $("#Ca_Value"+num+" option:selected").text();
	

	
	var amountA = $("#Data_Amount"+num+"").val();
	var memoM = $("#Data_Memo"+num+"").val();
	var dataD = $("#Date_Date"+num+"").val();
	var cateGG2 =$("#Ca_Group"+num+" option:selected").text();
	var cnt = 0;
	
	if(!cateGG || !payV || !cateV ||!dataD || !amountA){
		swal("항목을 모두 작성해주세요");
		return false;
	}
	
	if(isNaN(amountA)){
		swal("숫자만 입력해주세요");
		$("#Data_Amount"+num+"").val("");
		$("#Data_Amount"+num+"").focus();
		return false;}
	
	if($("#okBtn"+num+"").html() == "입력"){
		$.ajax({
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			url : "insertData.do",
			type : "POST",
			data : {param1 : cateGG,param2 : payV,param3 : cateV,param4 : dataD
				,param5 : amountA, param6 : memoM},
			success : function(result) {
				swal("입력성공");
				//http://asm0628.tistory.com/166 readolny와 disabled 차이
				$("#Ca_Group"+num+"").css("display","none");
				$("#Pay_Value"+num+"").css("display","none");
				$("#Ca_Value"+num+"").css("display","none");
				$("#Date_Date"+num+"").css("display","none");
				$("#Data_Amount"+num+"").css("display","none");
				$("#Data_Memo"+num+"").css("display","none");
				
				$("#selectSpan"+num+"").css("display","inline-block");
				$("#amountSpan"+num+"").css("display","inline-block");
				$("#memoSpan"+num+"").css("display","inline-block");
				$("#dateSpan"+num+"").css("display","inline-block");
				
				
				var selectRe = cateGG2+" / "+payId+" / "+cateId+"   ";
				
				$("#selectSpan"+num+"").html(selectRe);
				$("#amountSpan"+num+"").html(amountA);
				$("#memoSpan"+num+"").html(memoM);
				$("#dateSpan"+num+"").html(dataD);
				
				//data_no 
				var data_no = result;
				$("#dataNo"+num+"").html(data_no).css("display","none");
				
				$("#okBtn"+num+"").html("수정");
				
			},
			error : function(jqXHR, textStatus, errorThrown) {
				if(!cateGG || !payV || !cateV ||!dataD || !amountA){
					swal("필수항목을 모두 작성해주세요");
					return false;
				}else {
					swal("입력 버튼 오류가 발생하였습니다.");
				}
			}
		});
		

		
	}else if($("#okBtn"+num+"").html()=="수정"){
		/*수정버튼을 눌렀을때*/
		$("#Ca_Group"+num+"").removeAttr("disabled");
		$("#Pay_Value"+num+"").removeAttr("disabled");
		$("#Ca_Value"+num+"").removeAttr("disabled");
		$("#Date_Date"+num+"").removeAttr("readonly");
		$("#Data_Amount"+num+"").removeAttr("readonly");
		$("#Data_Memo"+num+"").removeAttr("readonly");
		$("#okBtn"+num+"").removeAttr("disabled");
		var dataNo = $("#dataNo"+num+"").html();
		
		$("#selectSpan"+num+"").css("display","none");
		$("#amountSpan"+num+"").css("display","none");
		$("#memoSpan"+num+"").css("display","none");
		$("#dateSpan"+num+"").css("display","none");
		
		$("#Ca_Group"+num+"").css("display","inline-block");
		$("#Pay_Value"+num+"").css("display","inline-block");
		$("#Ca_Value"+num+"").css("display","inline-block");
		$("#Date_Date"+num+"").css("display","inline-block");
		$("#Data_Amount"+num+"").css("display","inline-block");
		$("#Data_Memo"+num+"").css("display","inline-block");
		
		
		var okBtnVal = $("#okBtn"+num+"").val();
		okBtnVal = okBtnVal *1;//형변환
		
		$.ajax({
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			url : "updateData.do",
			type : "POST",
			data : {param1 : cateGG,param2 : payV,param3 : cateV,param4 : dataD
				,param5 : amountA, param6 : memoM,param7 : dataNo},
			success : function(result) {
				var data_no = result;
				$("#dataNo"+num+"").html(data_no).css("display","none");
				if(okBtnVal>0){swal("수정완료!");}
				okBtnVal += 1;
				$("#okBtn"+num+"").val(okBtnVal);
			},
			error : function(jqXHR, textStatus, errorThrown) {
				if(!cateGG || !payV || !cateV ||!dataD || !amountA){
					swal("필수항목을 모두 작성해주세요");return false;
				}else{
					swal("수정 버튼 오류가 발생하였습니다.");
				}
			}
		});
		
	}
}
//////////////////////////////////////////////////////////////////////////////////////////////
function showDiv() {
	$("#showDiv").css("display","inline-block");
}


