function connectAddressFindEvent(){
	$("#addrSearchBtn").click(function() {
		new daum.Postcode({
			oncomplete : function(data) {
				$("#a1").val(data.zonecode);
				$("#a2").val(data.address);
			}
		}).open();
	});
}