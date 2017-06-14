function passwordCheck()
{
	
	if($('#password').val() != $('#password-confirm').val()){
		$('.pwd_ok').css('display','block');
		$('.pwd_ok').text("비밀번호가 일치하지 않습니다.");
	}
	else if($('#password').val() == $('#password-confirm').val()){
		$('.pwd_ok').css('display','block');
		$('.pwd_ok').text("비밀번호가 일치합니다.");
	}
	if($('#password-confirm').val() == null){
		$('.pwd_ok').css('display','none');
	}
	else if($('#password-confirm').val() == ""){
		$('.pwd_ok').css('display','none');
	}
}


function emailCheck() {
	$.ajax({
		url : "duplicationCheck.nn",
		type : "get",
		dataType:"json",
		data : { email :$("#email").val()},
		success : function(result) {
			
			if(result == false){
				$(".email-msg").text("이미 가입되어 있는 이메일입니다");
				$("#email").val("");
				$("#email").focus();
				
			}else{
				var regExp = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
					
				if(!regExp.test($("#email").val())){  
					$(".email-msg").text("잘못된 이메일 형식입니다.");  
					$("#email").val("");
					$("#email").focus();
				}else{ 
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