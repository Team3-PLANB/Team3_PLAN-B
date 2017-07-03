// 자바스크립트 SDK를 초기화 후  FB.getLoginStatus()를 호출
//웹페이지를 로드할때 로그인 상태인지 체크해준다.
//load the SDK asynchronously
window.fbAsyncInit = function() {
	FB.init({
	      appId      : '444078732638300', // 앱 ID
	      cookie     : true,			  // 쿠키허용
	      xfbml      : true,			  // parse XFBML
	      version    : 'v2.8'
	    });

	// 로그인 상태 호출하는 함수
	FB.getLoginStatus(function(response) {
		statusChangeCallback(response);
	});

};

(function(d, s, id){
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) {return;}
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/en_US/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
  }(document, 'script', 'facebook-jssdk'));

/*
 * 페이스북 로그인 상태를 알려주는 함수
 * - connected : 현재 사용자가 페이스북과 앱에 함께 로그인 되어있다. 
 * - not_authorized : 사용자가 페이스북에는 로그인 되어있으나, 앱에는 로그인되어 있지 않다. 
 * - unknown : 사용자가 페이스북에 로그인되어있지 않다. 
 * [ connected ]인 경우 추가로 로그인 정보들을 보여준다. 각 속성은 다음의 내용을 담고 있다. 
 * - accessToken : 사용자가 앱에 접근하는 access token 
 * - expiresIn : UNIX 시간으로 토큰이 만기 되어 재생성이 필요한 시기 
 * - signedRequest : 앱을 사용하는 사용자에 대한 서명된 파라미터 정보 
 * - userID : 앱을 사용하는 사용자의 ID
 */

// 상태 체크 > 처음왔을때 상태 체크
function statusChangeCallback(response) {
	console.log(response.status)
	// 로그인 상태를 나타내는 정보를 보여준다.
	if (response.status === 'connected') {
		// 페이스북을 통해서 로그인이 되어있다 > 자동로그인
		console.log('login ok');
	} else if (response.status === 'not_authorized') {
		// 페이스북에는 로그인 했으나, 앱에는 로그인이 되어있지 않다.
		console.log('로그인 후 이용해 주세요.');
	} else {
		// 페이스북에 로그인이 되어있지 않다. 따라서, 앱에 로그인이 되어있는지 여부가 불확실하다.
		console.log('Please log into Facebook.');
	}
}

// facebook 로그인버튼 눌렀을 때 나오는 함수
function login() {
	
	var username; // 이메일 저장할 변수
	var nickname; // 이름 저장할 변수
	FB.login(function(response) { // response 객체를 처리
		if (response.status === 'connected') {
		// 페이스북과 앱에 같이 로그인되어 있다.
				FB.api(
				'/me',
				'GET',
				{fields : 'email'},
				function(member) {
					username = member.email;
					$.ajax({
						type : "get",
						url : "duplicationCheck.do",
						data : {"username" : username},
						dataType : "json",
						success : function(result) {
							if (result == false) { // 아이디 중복됨 > 로그인(fblogin.do)
								$.ajax({
									type : "post",
									url : "fblogin.do",
									data : {"username" : username},
									success : function(result) { // 로그인성공
										if (result == 'true') {
											swal({
												title: "",
												text : username + "님이 아니라면\n현재 PC에서 facebook에 \n로그인 된 아이디를 확인해주세요",
												type : "warning",
												showCancelButton: true,
												confirmButtonText: "저예요!",
												closeOnConfirm: false
											},
											function(isConfirm) {
												if(isConfirm) {
													swal({
														title: "",
														text: "OK!",
														timer: 1000,
														showConfirmButton: false
													},
													function() {
														location.href="../../Index/main.do";
													});
												} else {
													location.href="../../Index/main.do";
												}
											});
										}
									},
									error : function(error) { // 로그인실패
										alert(error.statusText);
									}
								});
							} else { // 아이디 없을 경우 > 회원가입(fbjoin.do)
								$.ajax({
									type : "get",
									url  : "fbjoin.do",
									data : {
										"username" : username,
										"password" : response.authResponse.accessToken,
										"nickname" : username
										// userid가 email, username이 사용자 이름으로 넘어와서
										// userid를 username에 넣어주고, username을 nickname에 넣어줌
										// 페이스북 가입회원은 이름 default값이 nickname.
									},
									success : function(result) {
										if (result=='true') {
											swal({
												  title: "회원가입 완료!",
												  text: "한 번 더 로그인해주세요!",
												  confirmButtonText: "OK"
											},
											function(isConfirm){
											  if (isConfirm) {
												  location.href = "../Join/NJoin.do";
											  } else {
												swal({
													  title: "회원가입 실패",
													  text: "다시 회원가입 해주세요",
													  timer: 2000,
													  showConfirmButton: false
												});
												location.href = "../Join/NJoin.do";
											  }
											});
										}
									},
									error : function(error) {
										alert('error!');
										alert(error.statusText);
									}
								});
							}
						},
						error : function(error) {
							alert(error.statusText);
						}
					});
				});
			} else if (response.status === 'not_authorized') {
				// ('not authorized. 권한 받으면 connect로 간다. ');
				// 페이스북에는 로그인 되어있으나, 앱에는 로그인 되어있지 않다. 권한을 가져온다.
			} else {
				console.log('else part');
				// 페이스북에 로그인이 되어있지 않아서, 앱에 로그인 되어있는지 불명확하다.
			}
		}, {scope : 'email'}); // email 에 대한 권한을 요청한다.
}