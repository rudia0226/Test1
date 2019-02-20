// 아이디 중복체크
var idck = 0;
$(function  () {
	// idCheck 버튼을 클릭했을 때
	$("#idCheck").click(function() {
		// userid 를 param.
		var User_Email = $("#joinID").val();

		if (!User_Email) {
			alert("이메일을 입력해주세요.");
			return false; 
		} 
		$.ajax({ 
			async : true,
			type : 'POST',
			data : User_Email,
			url : "idcheck.do",
			dataType : "json",
			contentType : "application/json; charset=UTF-8",
			success : function(data) {
				if (data.cnt > 0) {

					alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
					// 아이디가 존제할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인
/*					$("#joinID").addClass("has-error");
					$("#joinID").removeClass("has-success");*/
					$("#joinID").val('');
					$("#joinID").focus();
					
				} 
				else {
					alert("사용가능한 아이디입니다.");
					// 아이디가 존제할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인
/*					$("#joinID").addClass("has-success");
					$("#joinID").removeClass("has-error");*/
					$("#joinPW").focus();
					// 아이디가 중복하지 않으면 idck = 1
					idck = 1;
				}
			},
			error : function(error) {
				alert("error : " + error);
			}
		});
	});
});