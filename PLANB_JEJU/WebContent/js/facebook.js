//기본세팅 start

// 자바스크립트 SDK를 초기화 후  FB.getLoginStatus()를 호출
//웹페이지를 로드할때 로그인 상태인지 체크해준다.
window.fbAsyncInit = function() {
	FB.init({
		appId : '1411879235558357',
		cookie : true,
		xfbml : true,
		version : 'v2.5'
	});

	// 로그인 상태 호출하는 함수
	FB.getLoginStatus(function(response) {
		statusChangeCallback(response);
	});

};

// 기본적으로 페이스북과 연동하는 세팅
// SDK를 비동기적으로 호출
(function(d, s, id) {
	var js, fjs = d.getElementsByTagName(s)[0];
	if (d.getElementById(id)) {
		return;
	}
	js = d.createElement(s);
	js.id = id;
	js.src = "//connect.facebook.net/ko_KR/sdk.js"; // 언어 설정
	fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));

// --기본세팅 END --

/*
 * 페이스북 로그인 상태를 알려주는 함수 - connected : 현재 사용자가 페이스북과 앱에 함께 로그인 되어있다. -
 * not_authorized : 사용자가 페이스북에는 로그인 되어있으나, 앱에는 로그인되어 있지 않다. - unknown : 사용자가
 * 페이스북에 로그인되어있지 않다. [ connected ]인 경우 추가로 로그인 정보들을 보여준다. 각 속성은 다음의 내용을 담고 있다. -
 * accessToken : 사용자가 앱에 접근하는 access token - expiresIn : UNIX 시간으로 토큰이 만기 되어
 * 재생성이 필요한 시기 - signedRequest : 앱을 사용하는 사용자에 대한 서명된 파라미터 정보 - userID : 앱을 사용하는
 * 사용자의 ID
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
		console.log('Please login into this app.');
	} else {
		// 페이스북에 로그인이 되어있지 않다. 따라서, 앱에 로그인이 되어있는지 여부가 불확실하다.
		console.log('Please log into Facebook.');
	}
}

// 페이스북 로그인을 눌렀을 때 나오는 루틴
// 가입도 같은걸 써준다
// 가입된사람 ->token을 통해 로그인
// 신규사용자 ->token있는지 확인후 없으면 권한동의 팝업창 뜬다 ->db에 저장하면됨

function login() {

	var username; // 이메일 저장할 변수
	var nickname; // 이름 저장할 변수
	FB.login(
		function(response) { // response 객체를 처리
			console.log(response.status);
			console.log(response.authResponse.accessToken);
			if (response.status === 'connected') {
			// 페이스북과 앱에 같이 로그인되어 있다.
							FB.api(
								'/me',
								'GET',
								{fields : 'username'},
								function(member) {
									username = member.username;
									$.ajax({
										type : "get",
										url : "duplicationCheck.do",
										data : {"userid" : username},
												dataType : "json",
												success : function(result) {
													if (result == false) { // 중복된 값을 타면 로그인이 된다.
															$.ajax({
																type : "post",
																url : "fblogin.do",
																data : {"userid" : username},
																success : function(result) {// 로그인성공
																	document.getElementById('username').value = username;
																	document.getElementById('password').value = result;
																	document.getElementById('nickname').value = nickname;
																	document.getElementById('joinform').submit();
																},
																error : function(error) {// 로그인실패
																	alert(error.statusText);
																}
															});
													} else { // 회원가입 한다.
														console.log(response.authResponse.accessToken);
														$.ajax({
																type : "get",
																url  : "Login/fbsignup.do",
																data : {
																		"userid" : username,
																		"fbaccesstoken" : response.authResponse.accessToken,
																		"username" : nickname
																		// userid가 email, username이 사용자 이름으로 넘어와서
																		// userid를 username에 넣어주고, username을 nickname에 넣어줌
																		// 페이스북 가입회원은 이름 default값이 nickname.
																},
																success : function() {
																		alert('회원가입 완료! 로그인해주세요.');
																		location.href = "LoginJoin/Login/NLogin/loginForm.jsp";
																},
																error : function(error) {
																		alert('error!');
																		lert(error.statusText);
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
					}, {scope : 'username'}); // email 에 대한 권한을 요청한다.
}
/*
 * // 페이스북 로그아웃 function logout(){ FB.logout(function(response) {// 사용자 로그 아웃 이후
 * 콜백처리 }); //페이스북에서도 로그아웃을 시키게 된다 //앱에 로그인해 있는 동안 페이스북에도 접속했을 수도 있다. //이 때
 * 사용자들은 페이스북과 앱에서 동시에 로그아웃하는 것을 예상하고 있지 못할수도 있지만, //사용자의 혼동을 줄이고 보안을 지키기 위하여
 * 이러한 로그아웃 방식을 채택하고 있다. }
 */