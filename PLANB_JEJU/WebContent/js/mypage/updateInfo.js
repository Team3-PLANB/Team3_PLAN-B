/*
 * form id : editMemForm
 * onclick : editMemForm()
 * 비밀번호 / 확인 : passwrod / passwordck
 * 닉네임 : nickname
 */

function editMemForm() {
	console.log('회원정보 수정완료!');
	if(($('#password').val() != null && $('#passwordck').val() == null)
			|| ($('#password').val() == null && $('#passwordck').val() != null)
			|| ($('#password').val() != "" && $('#passwordck').val() == "")
			|| ($('#password').val() == "" && $('#passwordck').val() != "")) {
		swal('비밀번호를 확인해주세요');
	} else if ($('#nickname').val() == null || $('#nickname').val() == "") {
		swal('닉네임을 입력해주세요');
	} else if (($('#password').val() == null && $('#passwordck').val() == null)
		|| ($('#password').val() == "" && $('#passwordck').val() == "")) {
			swal('비밀번호를 입력해주세요');
	} else {
		$('#editMemForm').submit();		
	}
}

function passwordCheck() {
	if ($('#password').val() != $('#passwordck').val()) {
		$('.pwdck').css('display', 'block');
		$('.pwdck').text("비밀번호가 일치하지 않습니다.");
	} else if ($('#password').val() == $('#passwordck').val()) {
		$('.pwdck').css('display', 'block');
		$('.pwdck').text("비밀번호가 일치합니다.");
	}
	if ($('#passwordck').val() == null) {
		$('.pwdck').css('display', 'none');
	} else if ($('#passwordck').val() == "") {
		$('.pwdck').css('display', 'none');
	}
}

function nickCheck() {
	
	$.ajax({
		url : "duplicationNCheck.do",
		type : "get",
		dataType : "json",
		data : {
			nickname : $("#nickname").val()
		},
		success : function(result) {
			if (!result) {
				$(".nickck").text("이미 존재하는 닉네임입니다");
				$("#nickname").focus();
			} else {
				$(".nickck").text("사용가능한 닉네임입니다");
			}
		},
		error : function(xhr) {
			alert(xhr.status);
		}
	});
	return false;
};