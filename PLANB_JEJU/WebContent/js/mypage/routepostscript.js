/**
 * 
 */

function deleteMyRoute(route_rouwnum) {
 	if(!confirm("후기를 삭제 하시겠습니까?")){
	      return;
	}
 	$.ajax({
	      url:"deleteMyRoute.do",
	      data:{"route_rouwnum":route_rouwnum},
	      success:function(data){
	         swal("삭제완료");
	         //새로고침
	         location.reload();
	      },
	      error:function(e){
	         alert(e.responseText);
	      }
	   });	
}