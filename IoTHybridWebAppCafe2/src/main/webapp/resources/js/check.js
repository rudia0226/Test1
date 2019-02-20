function drRegCheck() {
	var titleField = document.drRegForm.id_title;
	var fileField = document.drRegForm.id_file;

	if (isEmpty(titleField)) {
		alert("제목 확인");
		titleField.focus();
		return false;
	} else if (isEmpty(fileField)) {
		alert("파일 확인");
		fileField.focus();
		return false;
	}
	return true;
}
function voteRegCheck() {
	var titleField = document.voteRegForm.iv_title;
	var itemsField = document.voteRegForm.iv_items;

	if (isEmpty(titleField)) {
		alert("제목 확인");
		titleField.focus();
		return false;
	} else if (isEmpty(itemsField)) {
		alert("항목 확인");
		itemsField.focus();
		return false;
	}
	return true;
}
function writeReplCheck(writeForm) {
	var txtField = writeForm.isr_txt;

	if (isEmpty(txtField)) {
		alert("내용 확인");
		txtField.focus();
		return false;
	}
	return true;
}

function snsWriteCheck() {
	var txtField = document.snsWriteForm.is_txt;
	if (isEmpty(txtField)) {
		alert("내용 확인");
		txtField.value = "";
		txtField.focus();
		return false;
	}
	return true;
}
function updateCheck() {
	var pwField = document.updateForm.im_pw;
	var pwChkField = document.updateForm.im_pwChk;
	var nameField = document.updateForm.im_name;
	var addr3Field = document.updateForm.im_addr3;
	var imgField = document.updateForm.im_img;

	if (isEmpty(pwField) || notEquals(pwField, pwChkField)
			|| lessThan(pwField, 4) || notContains(pwField, "1234567890")
			|| notContains(pwField, "qwertyuiopasdfghjklzxcvbnm")
			|| notContains(pwField, "QWERTYUIOPASDFGHJKLZXCVBNM")) {
		alert("pw 확인");
		pwField.value = "";
		pwChkField.value = "";
		pwField.focus();
		return false;
	} else if (isEmpty(nameField)) {
		alert("이름 확인");
		nameField.value = "";
		nameField.focus();
		return false;
	} else if (isEmpty(addr3Field)) {
		alert("주소 확인");
		addrField3.value = "";
		addrField3.focus();
		return false;
	} else if (isEmpty(imgField)) {
		return true;
	} else if (isNotType(imgField, ".png") && isNotType(imgField, ".gif")
			&& isNotType(imgField, ".jpg") && isNotType(imgField, ".bmp")) {
		alert("사진 확인");
		imgField.value = "";
		imgField.focus();
		return false;
	}
	return true;
}

function connectIdCheckEvent(){
	$("#joinID").keyup(function(e){
		var i = $("#joinID").val();
		$.ajax({
			url : "member.id.check",
			data : {im_id : i},
			success : function(xml){
				var ok = $(xml).find("member").length; 
				if (i == ""){
					$("#joinIDResult").text("ID 입력");
				} else if (ok == 1) {
					$("#joinIDResult").text("ID 중복");
				} else if (ok == 0) {
					$("#joinIDResult").text("OK");
				}
			}
		});
	});
}

function joinCheck() {
	var idField = document.joinForm.im_id;
	var pwField = document.joinForm.im_pw;
	var pwChkField = document.joinForm.im_pwChk;
	var nameField = document.joinForm.im_name;
	var addr1Field = document.joinForm.im_addr1;
	var addr2Field = document.joinForm.im_addr2;
	var addr3Field = document.joinForm.im_addr3;
	var imgField = document.joinForm.im_img;

	if ( $("#joinIDResult").text() == "ID 중복" || isEmpty(idField) || containsHangul(idField)) {
		alert("id 확인");
		idField.value = "";
		idField.focus();
		return false;
	} else if (isEmpty(pwField) || notEquals(pwField, pwChkField)
			|| lessThan(pwField, 4) || notContains(pwField, "1234567890")
			|| notContains(pwField, "qwertyuiopasdfghjklzxcvbnm")
			|| notContains(pwField, "QWERTYUIOPASDFGHJKLZXCVBNM")) {
		alert("pw 확인");
		pwField.value = "";
		pwChkField.value = "";
		pwField.focus();
		return false;
	} else if (isEmpty(nameField)) {
		alert("이름 확인");
		nameField.value = "";
		nameField.focus();
		return false;
	} else if (isEmpty(addr1Field) || isEmpty(addr2Field)
			|| isEmpty(addr3Field)) {
		alert("주소 확인");
		addr1Field.value = "";
		addr2Field.value = "";
		addr3Field.value = "";
		addr3Field.focus();
		return false;
	} else if (isEmpty(imgField)
			|| (isNotType(imgField, ".png") && isNotType(imgField, ".gif")
					&& isNotType(imgField, ".jpg") && isNotType(imgField,
					".bmp"))) {
		alert("사진 확인");
		imgField.value = "";
		imgField.focus();
		return false;
	}
	return true;
}
function loginCheck() {
	var idField = document.loginForm.im_id;
	var pwField = document.loginForm.im_pw;

	if (isEmpty(idField)) {
		alert("id 확인");
		idField.value = "";
		idField.focus();
		return false;
	} else if (isEmpty(pwField)) {
		alert("pw 확인");
		pwField.value = "";
		pwField.focus();
		return false;
	}
	return true;
}