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
	/*
	// 1. 필수 : ID, PW, 
	if (!idInput.value) { //id 안적으면, 
		alert("ID를 입력하세요.");
		inInput.focus(); //id 입력란에 커서 놓기
		return  false;  // 사고 터지면 false 로 나가게.. if 문 작성
	} 
	
	// else if 로 써도 됨..
	// 2. 자리수
	if (idInput.value.length  < 4) {
		return  false;
	}
	
	// 3. 숫자 (만 입력할 수 있게)
	if (isNaN(idInput.value)) { // idInput 에 숫자가 아닌 다른게 오면 false
		return false;
	}
	return  true;
	
	return  true;  //정상
	return  false; // 비정상
	
	*/
	
	
	
	
	// 비번 조합
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
	} else {
		return true;
	}
	
}