<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/util.js"></script>
<title>/views/users/signup_form.jsp</title>
<style>
/* style.css */
* {
	padding: 0;
	margin: 0;
}

html {
	width: 100%;
	height: 100%;
	display: flex;
	align-items: center;
}

body {
	width: 100%;
	margin: 0 auto;
	background: linear-gradient(to left, #505050, #282828);
	
}

.wrap {
	width: 600px;
	height: 850px;
	margin: 0 auto;
	background-color: #fff;
	border-radius: 5px;
	display: flex;
	justify-content: center;
	align-items: center;
}

h1{
	text-align: center;
	padding: 15px;	
}

.control-label {
	margin: 5px;
	padding-left: 0px text;
	font-family: sans-serif; 
}

.row p-2 {
	margin: 5px;
	padding-left: 0px text;
	font-family: sans-serif; 
}

.form-text {
	margin: 5px;
	padding-left: 0px text;
	font-family: sans-serif; 
}

.invalid-feedback {
	margin: 5px;
	padding-left: 0px text;
	font-family: sans-serif; 
}
/*signup 효과주기*/
.signup {
	width: 100px;
	height: 50px;
	margin: 5px;
	padding-left: 0px;
	border-radius: 5px;
	border: 0;
	background: linear-gradient(to left, #FF6E6E, #FF4646);
	color: #fff;
	font-weight: bold;
	font-size: 18px;
	cursor: pointer;
	font-family: sans-serif; 
	align-items: center;
}
</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
</head>
<body>
	<div class="wrap">
		<div>
			<h1>Regist Form</h1>
			<form action="${pageContext.request.contextPath}/users/signup.do" method="post" id="myForm" class="form" onsubmit="return sendit()">	
				<div>
					<label class="control-label" for="id">아이디</label> 
					<input class="form-control" type="text" name="id" id="id" /> 
					<small class="form-text text-muted">5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.</small>
					<div class="invalid-feedback">사용할수 없는 아이디 입니다.</div>
				</div>
				<div>
					<label class="control-label" for="pwd">비밀번호</label> 
					<input class="form-control" type="password" name="pwd" id="pwd" /> 
					<small class="form-text text-muted">6~12자 영문 대 소문자, 숫자, 특수문자를 사용하세요.</small>
					<div class="invalid-feedback">비밀번호를 확인 하세요.</div>
				</div>
				<div>
					<label class="control-label" for="pwd2">비밀번호 확인</label> 
					<input class="form-control" type="password" name="pwd2" id="pwd2" />
				</div>
				<div>
					<label class="control-label" for="email">이메일</label> 
					<input class="form-control" type="text" name="email" id="email" />
					<div class="invalid-feedback">이메일 주소를 다시 확인해주세요.</div>
				</div>
		    	<div class="row">
		    		<label class="control-label" for="addr">주소</label> 
					<div class="col mb-2">
						<input type="text" class="form-control" id="postcode" name="postcode" placeholder="우편번호">	
					</div>
					<div class="col mb-2">
						<button type="button" class="btn btn-primary w-100" id="btnPostCode" >우편번호 찾기</button>
					</div>
				</div>
				<div class=class="row">
					<div class="col mb-2">
						<input type="text" class="form-control" id="roadAddr" name="roadAddr" placeholder="도로명주소">
					</div>
				</div>
				<div class="row">
					<div class="col mb-2">
						<input type="text" class="form-control" id="detailAddr" name="detailAddr" placeholder="상세주소">
					</div>
					<div class="col mb-2">
						<input type="text" class="form-control" id="extraAddr" name="extraAddr" placeholder="읍/면/동">
					</div>
				</div>
				<div class="row">
				<button class="signup" type="submit">Sign up</button>
				</div>

			</form>
		</div>
	</div>

<script>
	//아이디, 비밀번호, 이메일의 유효성 여부를 관리한 변수 만들고 초기값 대입
	let isIdValid=false;
	let isPwdValid=false;
	let isEmailValid=false;

	//아이디를 입력했을때(input) 실행할 함수 등록 
	document.querySelector("#id").addEventListener("input", function(){
		//일단 is-valid,  is-invalid 클래스를 제거한다.
		document.querySelector("#id").classList.remove("is-valid");
		document.querySelector("#id").classList.remove("is-invalid");
		
		//1. 입력한 아이디 value 값 읽어오기  
		let inputId=this.value;
		//입력한 아이디를 검증할 정규 표현식
		//5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용
		const reg_id=/^[a-z0-9][a-z0-9_\-]{4,19}$/;	
		//만일 입력한 아이디가 정규표현식과 매칭되지 않는다면
		if(!reg_id.test(inputId)){
			isIdValid=false; //아이디가 매칭되지 않는다고 표시하고 
			// is-invalid 클래스를 추가한다. 
			document.querySelector("#id").classList.add("is-invalid");
			return; //함수를 여기서 끝낸다 (ajax 전송 되지 않도록)
		}
		
		
		//2. util 에 있는 함수를 이용해서 ajax 요청하기
		ajaxPromise("${pageContext.request.contextPath}/users/checkid.do", "get", "inputId="+inputId)
		.then(function(response){
			return response.json();
		})
		.then(function(data){
			console.log(data);
			//data 는 {isExist:true} or {isExist:false} 형태의 object 이다.
			if(data.isExist){//만일 존재한다면
				//사용할수 없는 아이디라는 피드백을 보이게 한다. 
				isIdValid=false;
				// is-invalid 클래스를 추가한다. 
				document.querySelector("#id").classList.add("is-invalid");
			}else{
				isIdValid=true;
				document.querySelector("#id").classList.add("is-valid");
			}
		});
	});
	
	//비밀 번호를 확인 하는 함수 
	function checkPwd(){
		document.querySelector("#pwd").classList.remove("is-valid");
		document.querySelector("#pwd").classList.remove("is-invalid");
		
		const pwd=document.querySelector("#pwd").value;
		const pwd2=document.querySelector("#pwd2").value;
		
		// 최소 6글자 최대 12글자 , 하나 이상의 대소문자 및 하나의 숫자, 하나의 특수문자
		const reg_pwd=/^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{6,12}$/;
		if(!reg_pwd.test(pwd)){
			isPwdValid=false;
			document.querySelector("#pwd").classList.add("is-invalid");
			return; //함수를 여기서 종료
		}
		
		if(pwd != pwd2){//비밀번호와 비밀번호 확인란이 다르면
			//비밀번호를 잘못 입력한것이다.
			isPwdValid=false;
			document.querySelector("#pwd").classList.add("is-invalid");
		}else{
			isPwdValid=true;
			document.querySelector("#pwd").classList.add("is-valid");
		}
	}
	
	//비밀번호 입력란에 input 이벤트가 일어 났을때 실행할 함수 등록
	document.querySelector("#pwd").addEventListener("input", checkPwd);
	document.querySelector("#pwd2").addEventListener("input", checkPwd);
	
	//이메일을 입력했을때 실행할 함수 등록
	document.querySelector("#email").addEventListener("input", function(){
		document.querySelector("#email").classList.remove("is-valid");
		document.querySelector("#email").classList.remove("is-invalid");
		
		//1. 입력한 이메일을 읽어와서
		const inputEmail=this.value;
		//2. 이메일을 검증할 정규 표현식 객체를 만들어서
		const reg_email=/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		//3. 정규표현식 매칭 여부에 따라 분기하기
		if(reg_email.test(inputEmail)){//만일 매칭된다면
			isEmailValid=true;
			document.querySelector("#email").classList.add("is-valid");
		}else{
			isEmailValid=false;
			document.querySelector("#email").classList.add("is-invalid");
		}
	});
	
	
	//폼에 submit 이벤트가 발생했을때 실행할 함수 등록
	document.querySelector("#myForm").addEventListener("submit", function(e){
		//폼 전체의 유효성 여부 알아내기 
		let isFormValid = isIdValid && isPwdValid && isEmailValid;
		if(!isFormValid){//폼이 유효하지 않으면
			//폼 전송 막기 
			e.preventDefault();
		}	
	});
	
	// 다음 우편번호 api
	$("#btnPostCode").on("click",function() {
		new daum.Postcode({
			oncomplete : function(data) {
				var roadAddr = data.roadAddress; // 도로명 주소 변수
				var extraRoadAddr = ''; // 참고 항목 변수

				if (data.bname !== ''
						&& /[동|로|가]$/g
								.test(data.bname)) {
					extraRoadAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다
				if (data.buildingName !== ''
						&& data.apartment === 'Y') {
					extraRoadAddr += (extraRoadAddr !== '' ? ', '
							+ data.buildingName
							: data.buildingName);
				}
				// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if (extraRoadAddr !== '') {
					extraRoadAddr = ' ('
							+ extraRoadAddr + ')';
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				$("#postcode").val(data.zonecode);
				$("#roadAddr").val(roadAddr);

				// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
				if (roadAddr !== '') {
					$("#extraAddr").val(
							extraRoadAddr);
				} else {
					$("#extraAddr").val("");
				}
			}
		}).open();
	})
</script>

</body>
</html>





