$(document).ready(function(){
	
	
	
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
			word = word.substring(1);
			word = '<a href="List.do?searchWord=' + word + '">#' + word + '</a>';
		}
			linkedContent += word + ' ';
	}
	document.getElementById('contentElement').innerHTML = linkedContent;
    
    
    
    

		var jssor_1_SlideshowTransitions = [ {
			$Duration : 1200,
			x : -0.3,
			$During : {
				$Left : [ 0.3, 0.7 ]
			},
			$Easing : {
				$Left : $Jease$.$InCubic,
				$Opacity : $Jease$.$Linear
			},
			$Opacity : 2
		}, {
			$Duration : 1200,
			x : 0.3,
			$SlideOut : true,
			$Easing : {
				$Left : $Jease$.$InCubic,
				$Opacity : $Jease$.$Linear
			},
			$Opacity : 2
		} ];

		var jssor_1_options = {
			$AutoPlay : 1,
			$SlideshowOptions : {
				$Class : $JssorSlideshowRunner$,
				$Transitions : jssor_1_SlideshowTransitions,
				$TransitionsOrder : 1
			},
			$ArrowNavigatorOptions : {
				$Class : $JssorArrowNavigator$
			},
			$BulletNavigatorOptions : {
				$Class : $JssorBulletNavigator$
			},
			$ThumbnailNavigatorOptions : {
				$Class : $JssorThumbnailNavigator$,
				$Cols : 1,
				$Align : 0,
				$NoDrag : true
			}
		};

		var jssor_1_slider = new $JssorSlider$("jssor_1", jssor_1_options);

		/*responsive code begin*/
		/*remove responsive code if you don't want the slider scales while window resizing*/
		function ScaleSlider() {
			var refSize = jssor_1_slider.$Elmt.parentNode.clientWidth;
			if (refSize) {
				refSize = Math.min(refSize, 600);
				jssor_1_slider.$ScaleWidth(refSize);
			} else {
				window.setTimeout(ScaleSlider, 30);
			}
		}
		ScaleSlider();
		$Jssor$.$AddEvent(window, "load", ScaleSlider);
		$Jssor$.$AddEvent(window, "resize", ScaleSlider);
		$Jssor$.$AddEvent(window, "orientationchange", ScaleSlider);
		/*responsive code end*/
	
    
});

function routeLikeChange(img){
	$.ajax({
		type : "get",
		url : 'Like.do',
		data : {
				"route_postscript_rownum" : $(img).parent().children('#route_postscript_rownum').val(),
				"route_like" : $(img).parent().children('#route_like').val()
				},
		success : function(result){
				console.log(result);
				if (!result) { 
					console.log("잘못된 값");
				}else if (result=='tTf'){
					console.log("찜콩 해제");
					$(img).attr("src", "../../images/PostScript/empty_like.png");
					$('#route_like').val("false");
				}else if (result=='fTt'){
					console.log("찜콩 설정");
					$(img).attr("src", "../../images/PostScript/full_like.png");
					$('#route_like').val("true");
				}
		},
		error : function(xhr) {
			console.log("에러남 : " + xhr);
		}
	});
}

function siteLikeChange(img){
	$.ajax({
		type : "get",
		url : 'Like.do',
		data : {
				"site_postscript_rownum" : $(img).parent().children('#site_postscript_rownum').val(),
				"site_like" : $(img).parent().children('#site_like').val()
				},
		success : function(result){
				console.log(result);
				if (!result) { 
					console.log("잘못된 값");
				}else if (result=='tTf'){
					console.log("찜콩 해제");
					$(img).attr("src", "../../images/PostScript/empty_like.png");
					$('#site_like').val("false");
				}else if (result=='fTt'){
					console.log("찜콩 설정");
					$(img).attr("src", "../../images/PostScript/full_like.png");
					$('#site_like').val("true");
				}
		},
		error : function(xhr) {
			console.log("에러남 : " + xhr);
		}
	});
}
