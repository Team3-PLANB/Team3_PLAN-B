function loginCheck() {
	console.log("loginCheck.do 타려구");
	var username = $('#loginform').find('#username').val();
	var password = $('#loginform').find('#password').val();
	console.log(username);
	$.ajax({
		url : "loginCheck.do",
		type : "get",
		data : {
			"username" : username,
			"password" : password
		},
		success : function(result) {
			if(result == "efalse") {
				console.log(result);
				$('.emailCheck').css('display', 'block');
				$('.emailCheck').text("존재하지 않는 이메일 입니다.");
			} else { // email은 true
				if(result == "false") {
					$('.pwdCheck').css('display', 'block');
					$('.pwdCheck').text("비밀번호가 일치하지 않습니다.");
					$('#loginform').find('#password').focus();
				} else if (result == "true"){
					$('#loginfrm').submit();
				}
			}
		},
		error : function(xhr) {
			alert(xhr.status);
		}
	});
	return false;
}