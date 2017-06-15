/*회원가입 이메일 인증*/
$(function() {
	$("#signupBtn").click(function() {
		swal("회원 인증을 해주세요.","등록하신 이메일로 인증메일을 전송하였습니다.");
				$.ajax({
					type : "post",
					url : "signup.nn",
					data : {"email":$('#email').val(), "password" :$('#password').val()},
					success : function(data) {  
					},
					error: function(xhr){						
					alert(xhr.status);
				}
				});
			});
});	
