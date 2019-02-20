function fnChkByte(){
	var obj = document.getElementById("boardContents");
	var maxByte = obj.getAttribute("maxlength");
	
	var str = obj.value;	// textbox
	var str_len = str.length;	//contents length
	
	var rbyte = 0;	//real byte
	var rlen = 0;		//real length
	
	var one_char = "";
	var str2 = "";

	for(var i=0; i<str_len; i++){
		one_char = str.charAt(i);
		
		if(escape(one_char).length > 4){
			rbyte += 2;                                         //한글2Byte
		}else{
			rbyte++;                                            //영문 등 나머지 1Byte
		}

		if(rbyte <= maxByte){
			rlen = i+1;                                          //return할 문자열 갯수
		}
	}

	if(rbyte > maxByte){
		document.getElementById('boardContentsMsg').innerHTML= rbyte+"/"+maxByte+" Byte";
	    str2 = str.substr(0,rlen);                                  //문자열 자르기
	    obj.value = str2;
	    fnChkByte();

	}else{
	    document.getElementById('boardContentsMsg').innerHTML= rbyte+"/"+maxByte+" Byte";
	}
}
