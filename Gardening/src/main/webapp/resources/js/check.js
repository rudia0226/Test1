/*
alert('ㅋㅋ'); // 작동되나 검사.
*/


function joinCheck() { //가입할 때 체크하기
	// input 에 적은 내용 가져와야 if문 사용
	// document // HTML 파일 자체
	// form , input 에 준 name 값을 넣어줘서 그 경로를 찾아감
	// value 는 input에 적은 내용
	// alert(document.joinForm.m_id.value); id 입력하면 알림창에 뜨는지 확인
	
	var  idInput = document.joinForm.m_id;
	var  pwInput = document.joinForm.m_pw;
	var  pwChkInput = document.joinForm.m_pwchk;
	var  nameInput = document.joinForm.m_name;
	
	if (!idInput.value || idInput.value.length <4) {
		alert("ID 입력 확인");
		idInput.value = "";
		idInput.focus(); 
		return false;
	} else if (!pwInput.value  
					||  pwInput.value.length <4
					||  pwInput.value != pwChkInput.value ) {
		alert("PW 입력 확인");
		pwInput.value = "";
		pwChkInput.value = "";
		pwInput.focus(); 
		return false;
	}  else if (!nameInput.value ) {
		alert("NAME 입력 확인");
		nameInput.focus(); 
		return false;
	}
	/* 
 	비번조합 하는거 예시.
	var s = "abcd";
	alert(s[2]);  // c 출력됨
	alert(s.indexOf("c"));  // c 가 몇번째 있는지 출력됨
	alert(s.indexOf("z"));  // 없으면 -1이 리턴된다.
	 */
	
	// 비번 조합
	// 영어 소문자 하나 반드시 조합되어야.
	// 숫자 하나 반드시 조합되어야.
	// 두가지 집단이니까 집단별로 변수 하나씩 설정
	
	// 영어 소문자 하나 반드시
	var  lowerOK = false; //영소문자
	var  lower  = "qwertyuiopasdfghjklzxcvbnm"; // 영소문자 집단
	for (var i = 0; i < lower.length; i++) {
		if (pwInput.value.indexOf(lower[i]) != -1 ) { //비번 쓴것중 특정글자 찾기
			// 없으면 -1 이니까 없는게 아니라면을 if 문으로..
			lowerOK = true;
			break;
		}
	}
	// 숫자 하나 반드시
	var  numOK = false;//숫자
	var  num = "1234567890";  //숫자 집단
	for (var i = 0; i < num.length; i++) {
		if (pwInput.value.indexOf(num[i]) != -1 ) { //비번 쓴것중 특정글자 찾기
			// 없으면 -1 이니까 없는게 아니라면을 if 문으로..
			numOK = true;
			break;
		}
	}
	if (!lowerOK || !numOK) {
		alert("비번조합(여기선 영소문자,숫자)");
		return false;
	}
	return true;
	
}




