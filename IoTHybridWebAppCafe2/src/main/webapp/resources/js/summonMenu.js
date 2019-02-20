function connectMenuSummonEvent() {
	$("#siteTitleArea").mouseenter(function() {
		$("#siteTitleArea").css("top", "0px");
		$("#siteLoginArea").css("top", "52px");
		$("#msgArea").css("top", "210px");
	});

	$("#siteTitleArea").mouseleave(function() {
		$("#siteTitleArea").css("top", "-52px");
		$("#siteLoginArea").css("top", "0px");
		$("#msgArea").css("top", "160px");
	});
}