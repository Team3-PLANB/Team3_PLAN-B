$(document).ready(function(){
	$('#routeLikeChange').click(function(){
		$.ajax({
			type : "get",
			url : 'Like.do',
			data : {"route_postscript_rownum" : $('#route_postscript_rownum').val(),
					"route_like" : $('#route_like').val()
					},
			success : function(result){
					console.log(result);
					if (!result) { 
						console.log("잘못된 값");
					}else if (result=='tTf'){
						console.log("찜콩 해제");
						$('#heart').attr("src", "../../images/PostScript/empty_like.png");
						$('#route_like').val("false");
					}else if (result=='fTt'){
						console.log("찜콩 설정");
						$('#heart').attr("src", "../../images/PostScript/full_like.png");
						$('#route_like').val("true");
					}
			},
			error : function(xhr) {
				console.log("에러남 : " + xhr);
			}
		});
	});
	
	$('#siteLikeChange').click(function(){
		$.ajax({
			type : "get",
			url : 'Like.do',
			data : {"site_postscript_rownum" : $('#site_postscript_rownum').val(),
					"site_like" : $('#site_like').val()
					},
			success : function(result){
					console.log(result);
					if (!result) { 
						console.log("잘못된 값");
					}else if (result=='tTf'){
						console.log("찜콩 해제");
						$('#heart').attr("src", "../../images/PostScript/empty_like.png");
						$('#site_like').val("false");
					}else if (result=='fTt'){
						console.log("찜콩 설정");
						$('#heart').attr("src", "../../images/PostScript/full_like.png");
						$('#site_like').val("true");
					}
			},
			error : function(xhr) {
				console.log("에러남 : " + xhr);
			}
		});
	});
	
	$(window).scroll(function() {
        if ($(this).scrollTop() > 0) {
            $('#moveTopBtn').fadeIn();
        } else {
            $('#moveTopBtn').fadeOut();
        }
    });
    
    $("#moveTopBtn").click(function() {
        $('html, body').animate({
            scrollTop : 0
        }, 400);
        return false;
    });
    
    var content = document.getElementById('contentElement').innerHTML;
    var splitedArray = content.split(' ');
    var linkedContent = '';
    for(var word in splitedArray){
    	console.log("splitedArray : " + splitedArray);
    	word = splitedArray[word].trim();
    	if(word.indexOf('#') == 0){
    		word = '<a href=\'링크\'>' + word + '</a>';
    	}
    	linkedContent += word + ' ';
    }
    document.getElementById('contentElement').innerHTML = linkedContent;
    
    var content2 = document.getElementById('tag').innerHTML;
    var splitedArray2 = content2.split(' ');
    var linkedContent2 = '';
    for(var word2 in splitedArray2){
    	word2 = splitedArray2[word2].trim();
    	if(word2.indexOf('#') == 0){
    		word2 = '<a href=\'링크\'>' + word2 + '</a>';
    		console.log("word2 : " + word2);
    		linkedContent2 += word2 + '&nbsp;&nbsp;&nbsp;';
    	}
    }
    document.getElementById('tag').innerHTML = linkedContent2;
    
    
});