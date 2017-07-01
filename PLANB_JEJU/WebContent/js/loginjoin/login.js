function loginCheck() {

	var username = $('#loginform').find('#username').val();
	var password = $('#loginform').find('#password').val();

	$.ajax({
		url : "loginCheck.do",
		type : "get",
		data : {
			"username" : username,
			"password" : password
		},
		success : function(result) {
			if(result == "efalse") {

				$('.emailCheck').css('display', 'block');
				$('.emailCheck').text("존재하지 않는 이메일 입니다.");
			} else { // email은 true
				if(result == "false") {
					$('.pwdCheck').css('display', 'block');
					$('.pwdCheck').text("비밀번호가 일치하지 않습니다.");
					$('#loginfrm').find('#password').focus();
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