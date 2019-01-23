
/*
alert('루디아당'); // 작동되나 검사
*/

/*회원 가입하기 함수*/
function goJoin() {
	location.href = "member.join.go";
	
}


/*로그아웃 함수*/
function logout() {
    var ok = 	confirm("로그아웃 하시겠습니까?");
	if (ok) {
		location.href="member.logout";
	}
}
/*
자바스크립트 창
alert
confirm : 뭐 지우고 할때에 사용
prompt
*/


//댓글수정 경로 지정
function replUpdate(cn){
	var  csr_txt = prompt("수정할 내용");
	location.href = 'board.updateRPL.sns?csr_no=' + cn + '&csr_txt='+ csr_txt;
	
}


// 글 삭제 : 글번호 cn 받아서 삭제해줌.
function delSNS(cn){
	  var ok = 	confirm("삭제하시겠습니까?");
	  if (ok) {
		  location.href = 'board.delete.sns?cs_no='+cn;
	}
}



// 댓글 삭제 : 글번호 cn 받아서 삭제해줌.
function delSNSRepl(cn){
	var ok = 	confirm("삭제하시겠습니까?");
	if (ok) {
		location.href = 'board.delete.sns.Repl?csr_no='+cn;
	}
}






