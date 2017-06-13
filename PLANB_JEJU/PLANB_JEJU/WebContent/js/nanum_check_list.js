$(function() {
	for(var j = 0 ; j < $('#listlength').val() ; j ++){
		if($('.request' + j + ' #member_email').val()==$('#mymember_email').val()){
			$('.request' + j + ' #count').css('display','none');
		}
	}
	
	for(var i = 0 ; i < $('#listlength').val() ; i ++){
		var count = 0;
		for(var k = 0 ; k < $('#check_eva_listlength').val() ; k ++){
			if($('.request' + i + ' #member_id').val()==$('.request2' + k + ' #you_member_id').val()){
				count++;
				$('.request' + i + ' #counter').html(count+"명");
			}
			if($('.request' + i + ' #member_id').val()==$('.request2' + k + ' #you_member_id').val()&&$('#mymember_no').val()==$('.request2' + k + ' #me_member_id').val()){
				$('.request' + i + ' #count').css('display','none');
			}
		}
	}
	$(".click_check").click(function() {
		var index = $(this).attr('id');
		if($('.request' + index + ' #check_content').val() == "" || $('.request' + index + ' #star').val() == ""){
			if($('.request' + index + ' #check_content').val() == ""){
				swal("확인해주세요!","평가내용이 비어있습니다.")
				return false;
			} else if ($('.request' + index + ' #star').val() == "") {
				swal("확인해주세요!","평가점수가 비어있습니다.")
				return false;
			}
		}
		$.ajax({
			url : "nanum_check_best.nn",
			type : "post",
			data : {
				member_email : $('.request' + index + ' #member_email').val(),
				check_score : $('.request' + index + ' #star').val(),
				check_content : $('.request' + index + ' #check_content').val()
			},
			success : function(data) {
				data = JSON.parse(data);
				if(data.finalstr==finalstr||data.finalstr=="finalstr"){
					$('.request' + index + ' #finalstr').css('display','none');
				}
				$('.request' + index + ' #count').css('display','none');
			},
			error : function(xhr) {
				alert(xhr.status);
			}
		})
	})
})
