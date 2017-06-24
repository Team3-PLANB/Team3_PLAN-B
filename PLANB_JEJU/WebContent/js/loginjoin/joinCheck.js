/*
 * frm_submit() : 이메일인증 후 submit
 * passwordCheck() : pwd 유효성
 * authCheck() : email 인증
 * emailCheck() : email 유효성 / 중복검사
 * nickCheck() : nick 중복검사
 * 
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
	$('#authNumSend').hide();
});

function frm_submit() {
	var authnum = $('#authnum').val();
	var check = $('#saveAuthNum').val();

	if($('#overOk').val() == 'false' || $('#overOk').val() == ''){
		swal("이메일 중복 확인을 해주세요.");
		$('#username').focus();
	}else if($('#authOk').val() == 'false' || $('#authOk').val() == ''){
		swal('이메일 인증이 필요합니다.');
		$('#username').focus();
	}else if(authnum != check){
		swal('인증번호를 확인해주세요.');
	} else {
		swal('회원가입 완료! 로그인해주세요');
		$('#joinfrm').submit();
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

function authCheck(){
	var username = $('#username').val();
	console.log("username : " + username);
	$.ajax({
		type : "get",
		url : 'emailAuth.do',
		data : {"username" : username},
		dataType : "text",
		success : function(result) {
				if (!result) { 
					console.log("잘못된 값");
				}else {
					swal('인증번호가 발송되었습니다.');
					console.log(result);
					$('#authnum').focus();
					$('#saveAuthNum').val(result);
				}
			},
			error : function(xhr) {
				console.log(xhr);
			}
		});	
	}

function authNumCheck(){
	var authnum = $('#authnum').val();
	var check = $('#saveAuthNum').val();
	
	if(!authnum){
		swal("인증번호를 입력하세요");
		$('#authnum').focus();
	}else if(authnum != check){
		swal("인증번호가 맞지 않습니다. 확인해주세요.");
		$('#authnum').focus();
		authnum = "";
	}else if(authnum == check){
		swal("인증완료");
		$('#authOk').val('true');
	}
}

function emailCheck() {
	var username = $('#username').val();
	console.log(username);
	$.ajax({
				url : 'duplicationCheck.do',
				type : "get",
				dataType : "json",
				data : {"username" : username},
				success : function(result) {
					if (!result) {
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
							$("#overlabCheck").hide();
							$("#authNumSend").show();
							$("#overOk").val("true");
						}
					}
				},
				error : function(xhr) {
					console.log('해당 페이지에 문제가 발생하였습니다.');
				}
			});
	return false;
};

function revText() {
	$("#authNumSend").hide();
	$("#overlabCheck").show();
	$(".email-msg").text("");
	$("#authOk").val("false");
	$("#overOk").val("false");
	return false;
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
				$(".nick-msg").text("이미 존재하는 닉네임입니다");
				$("#nickname").focus();
			} else {
				$(".nick-msg").text("사용가능한 닉네임입니다");
			}
		},
		error : function(xhr) {
			alert(xhr.status);
		}
	});
	return false;
};