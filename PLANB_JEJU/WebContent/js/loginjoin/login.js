function loginCheck() {
	$.ajax({
		url : "loginCheck.do",
		type : "get",
		data : {
			username : $('#username').val(),
			password : $('#password').val()
		},
		success : function(data) {
			data = JSON.parse(data);
			if (data.username == null && data.password == null){
				$('.emailCheck').css('display', 'block');
				$('.emailCheck').text("이메일이 없습니다. 다시 확인해주세요.")
			}
			else{
				if (data.password != $('#password').val()){
					$('.pwdCheck').css('display', 'block');
					$('.pwdCheck').text("비밀번호가 일치하지 않습니다.")
				} else {
					$('#loginform').submit();
				}
			}
		},
		error : function(xhr) {
			alert(xhr.status);
		}
	})
}