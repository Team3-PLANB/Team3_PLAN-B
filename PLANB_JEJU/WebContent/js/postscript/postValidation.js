/**
 * 후기작성 페이지 유효성 검사 
 */
function post_submit() {

	if($('#route_comment').val() == 'false' || $('#route_comment').val() == ''){
		swal("한 글자의 후기도 소중해요!");
		$('#route_comment').focus();
	} else {
		swal({
			  title: "작성 완료",
			  text: "고맙습니다!",
			  confirmButtonText: "OK"
		},
		function(isConfirm){
		  if (isConfirm) {
				$('#routePost').submit();
		  }
		});
	}
}


function site_submit() {
	if($('#site_comment').val() == 'false' || $('#site_comment').val() == ''){
		swal("한 글자의 후기도 소중해요!");
		$('#route_comment').focus();
	}
	if($('.uploader__file-list__thumbnail').val() == 'false' || $('.uploader__file-list__thumbnail').val() == "") {
		swal("한 장의 사진도 소중해요!");
	} else {
		swal({
			  title: "작성 완료",
			  text: "고맙습니다!",
			  confirmButtonText: "OK"
		},
		function(isConfirm){
		  if (isConfirm) {
				$('#sitePost').submit();
		  }
		});
	}

}