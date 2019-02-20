// 회원가입 체크
function joinCheck() {
	var  fEmail  = document.joinForm.User_Email;
	var  fPw  = document.joinForm.User_Pw;
	var  fPwChk  = document.joinForm.User_PwChk;
	var  fName  = document.joinForm.User_Name;
	var  fBirth  = document.joinForm.User_Birth;
	var  fSex  = document.joinForm.User_Sex;
	var  fGAmount  = document.joinForm.Goal_Amount;
	
	if (isEmpty(fEmail)  
		|| containsEmailForm(fEmail)) {
		alert("id 확인");
		fEmail.value = "";
		fEmail.focus();
		return false;
	}
	else if(isEmpty(fPw) || isEmpty(fPwChk) 
		|| lessThan(fPw, 3)
		|| notEquals(fPw, fPwChk) 
		|| notContains(fPw, "1234567890")
		/*|| notContains(fPw, "qwertyuiopasdfghjklzxcvbnm")
		|| notContains(fPw, "QWERTYUIOPASDFGHJKLZXCVBNM")*/
		
	) {
		alert("비밀번호를 확인하세요.");
		fPw.value="";
		fPwChk.value = "";
		fPw.focus();
		return false;
	} 
	else if(isEmpty(fEmail)) {
		alert("이메일을 입력하세요.");
		fEmail.value="";
		fEmail.focus();
		return  false;
	} 
	else if(isEmpty(fName)) {
		alert("이름을 입력하세요.");
		fName.value="";
		fName.focus();
		return  false;
	}
	else if(isEmpty(fBirth) 
			    || fBirth.value.length != 6
			    || containsHangul(fBirth)
		 	    ||  isNaN(fBirth.value)
			    ) {
		alert("주민번호 앞 6자리를 숫자로 입력하세요.");
		fBirth.value="";
		fBirth.focus();
		return  false;
	}
	else if(isEmpty(fSex)) {
		alert("성별을 고르세요.");
		fSex.focus();
		return  false;
	} 
	else if(isEmpty(fGAmount) 
			|| notContains(fGAmount, "1234567890")
			|| containsHangul(fGAmount)
				) {
		alert("목표금액에 숫자를 정확히 입력하세요.");
		fGAmount.focus();
		return  false;
	} 
	
	return true;
}