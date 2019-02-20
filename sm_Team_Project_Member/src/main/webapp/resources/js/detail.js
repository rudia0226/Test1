function delDetail(cn){
	var ok = confirm("Do you really want to delete?");
	if(ok){
	location.href = "sns.delete?ca_Key=" + cn;
}
	

}

