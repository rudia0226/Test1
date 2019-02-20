function bye(im_id) {
	var ok = confirm("진짜?");
	if (ok) {
		location.href = "bye.do?im_id=" + im_id;
	}
}

function deleteData(id_id, id_file) {
	var ok = confirm("진짜 삭제?");
	if (ok) {
		location.href = "dataroom.delete?id_id=" + id_id + "&id_file="
				+ id_file;
	}
}
function deleteMsg(im_no) {
	var ok = confirm("진짜?");
	if (ok) {
		location.href = "msg.delete?im_no=" + im_no;
	}
}

function deleteRepl(isr_no) {
	var ok = confirm("진짜?");
	if (ok) {
		location.href = "sns.repl.delete?isr_no=" + isr_no;
	}
}

function deleteSNS(is_no) {
	var ok = confirm("진짜?");
	if (ok) {
		location.href = "sns.delete?is_no=" + is_no;
	}
}

function goJoin() {
	location.href = "join.go";
}

function goUpdateMember() {
	location.href = "member.update.go";
}

function logout() {
	var ok = confirm("진짜?");
	if (ok) {
		location.href = "logout.do";
	}
}

function sendMsg(im_to) {
	var im_txt = prompt(im_to);

	if (im_txt != null && im_txt != "" && im_txt.length <= 150) {
		location.href = "msg.send?im_to=" + im_to + "&im_txt=" + im_txt;
	}
}
function resendMsg(im_to) {
	var im_txt = prompt(im_to);

	if (im_txt != null && im_txt != "" && im_txt.length <= 150) {
		location.href = "msg.resend?im_to=" + im_to + "&im_txt=" + im_txt;
	}
}
function updateSNS(is_no) {
	var is_txt = prompt("수정할 내용");

	if (is_txt != null && is_txt != "" && is_txt.length <= 150) {
		location.href = "sns.update?is_no=" + is_no + "&is_txt=" + is_txt;
	}
}
