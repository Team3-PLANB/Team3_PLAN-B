
/*

@스크립트 추가
@Project : login.jsp
@Date : 2016. 6. 14.
@Author : 신동민

*/
function validation(){
	var regExp = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	if(!regExp.test($("#username").val())){
		$('.emailCheck').css('display', 'block');
		$('.emailCheck').text("잘못된 이메일 형식입니다.");  
		$("#username").focus();
	}else{
		$('.emailCheck').css('display', 'none');
	}
}

function emailcheck(){
	if($('#username').val()==null){
		$('.emailCheck').css('display', 'none');
	}
	else if($('#username').val()==""){
		$('.emailCheck').css('display', 'none');
	}
	if($('#password').val()==null){
		$('.passwordCheck').css('display', 'none');
	}
	else if($('#password').val()==""){
		$('.passwordCheck').css('display', 'none');
	}
}

function loginCheck() {
	$.ajax({
		url : "loginCheck.nn",
		type : "get",
		data : {
			member_email : $('#username').val(),
			member_password : $('#password').val()
		},
		success : function(data) {
			data = JSON.parse(data);
			if (data.member_email == null && data.member_password == null){
				$('.emailCheck').css('display', 'block');
				$('.emailCheck').text("이메일이 없습니다. 다시 확인해주세요.")
			}
			else{
				if (data.member_password != $('#password').val()){
					$('.passwordCheck').css('display', 'block');
					$('.passwordCheck').text("비밀번호가 일치하지 않습니다.")
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