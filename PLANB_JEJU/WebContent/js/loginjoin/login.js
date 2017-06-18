function loginCheck() {
	console.log("loginCheck.do 타려구")
	$.ajax({
		url : "loginCheck.do",
		type : "get",
		data : {
			"username" : $('#username').val(),
			"password" : $('#password').val()
		},
		success : function(result) {
			if(result == "efalse") {
				$('.emailCheck').css('display', 'block');
				$('.emailCheck').text("존재하지 않는 이메일 입니다.")				
			} else {
				if(result == "false") {
					$('.pwdCheck').css('display', 'block');
					$('.pwdCheck').text("비밀번호가 일치하지 않습니다.")					
				} else {
					$('#loginfrm').submit();
				}
			}
		},
		error : function(xhr) {
			alert(xhr.status);
		}
	})
}