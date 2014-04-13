/** 注册校验 **/
function checkRegister(){
	alert("注册...");
	$.ajax({
		method:"post",
		url:"register",
		dataType: "json",
		success:function(data){
			alert(data.resultCode);
		}
	})
}