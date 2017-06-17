<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
	function check(){
		var form = document.authenform;
		var authNum = ${authNum};
		
		if(!form.authnum.value){
			alert("인증번호를 입력하세요");
			return false;
		}else if(form.authnum.value != authNum){
			alert("인증번호가 맞지 않습니다. 확인해주세요.");
			form.authnum.value="";
			return false;
		}else if(form.authnum.value==authNum){
			alert("인증완료");
			self.close();
		}
	}
</script>

<center>
	<br><br>
	<h5>인증 번호 7 자리를 입력하세요</h5>
	
	<div class="container">
		<from method="post" name="authenform" onSubmit="return check();">
			<inpu type="text" name="authnum"><br><br>
			<input type="submit" class="btn btn-info" value="Submit">
		</from>
	</div>
</center>