/*
 * passwordCheck() : pwd 유효성
 * emailCheck() : email 유효성 / 중복검사
 * nickCheck() : nick 중복검사
 */

$(document).ready(function() {
	$('#social_login').hide();
	$('.nav').find('#login_tab').click(function() {
		$('#social_join').hide();
		$('#social_login').show();
	});
	$('.nav').find('#join_tab').click(function() {
		$('#social_login').hide();
		$('#social_join').show();
	});
});

function frm_submit() {
	if($('e_cknum').val() == null) {
		alert('이메일 인증이 필요합니다.');
	} else if($('e_cknum').val() == "") {
		alert('이메일 인증이 필요합니다.');
		$('e_cknum').focus();
	}else {
		$("form").submit();
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

function emailCheck() {
	$.ajax({
				url : "Join/duplicationCheck.do",
				type : "get",
				dataType : "json",
				data : {
					email : $("#username").val()
				},
				success : function(result) {

					if (result == false) {
						$(".email-msg").text("이미 가입되어 있는 이메일입니다");
						$("#username").val("");
						$("#username").focus();

					} else {
						var regExp = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;

						if (!regExp.test($("#username").val())) {
							$(".email-msg").text("잘못된 이메일 형식입니다.");
							$("#username").val("");
							$("#username").focus();
						} else {
							$(".email-msg").text("사용가능한 이메일입니다");
						}
					}
				},
				error : function(xhr) {
					alert(xhr.status);
				}
			});
	return false;
};

function nickCheck() {
	$.ajax({
		url : "duplicationCheck.do",
		type : "get",
		dataType : "json",
		data : {
			nickname : $("#nickname").val()
		},
		success : function(result) {
			if (result == false) {
				$(".nick-msg").text("이미 존재하는 닉네임입니다");
				$("#nickname").val("");
				$("#nickname").focus();
			} else {
				$(".nick-msg").text("사용가능한 이메일입니다");
			}
		},
		error : function(xhr) {
			alert(xhr.status);
		}
	});
	return false;
};