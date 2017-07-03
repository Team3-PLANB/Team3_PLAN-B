/**
 * 후기작성 페이지 유효성 검사 
 */
function post_submit() {
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
		swal({
			  title: "회원가입 완료!",
			  text: "로그인해주세요!",
			  confirmButtonText: "OK"
		},
		function(isConfirm){
		  if (isConfirm) {
				$('#joinfrm').submit();
		  }
		});
	}
}