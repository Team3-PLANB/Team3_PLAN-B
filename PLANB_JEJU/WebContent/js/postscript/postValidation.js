/**
 * 후기작성 페이지 유효성 검사 
 */
function route_submit() {

	if($('#route_comment').val() == null || $('#route_comment').val() == ''){
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
				$('#routePostfrm').submit();
		  }
		});
	}
}


function site_submit() {
	if($('#site_comment').val() == null || $('#site_comment').val() == ''){
		swal("한 글자의 후기도 소중해요!");
		$('#route_comment').focus();
	} else {
		if($('#fileListCk').children("li").size() <= 0 ) {
			swal("한 장의 사진도 소중해요!");
		} else if ($('#site').val() == null || $('#site').val() == '') {
			swal("여행지를 선택해주세요!");
		} else {
			swal({
				  title: "작성 완료",
				  text: "고맙습니다!",
				  confirmButtonText: "OK"
			},
			function(isConfirm){
			  if (isConfirm) {
					$('#sitePostfrm').submit();
			  }
			});
		}
	}
}