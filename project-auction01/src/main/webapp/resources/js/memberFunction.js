function inputCharType() {
	let regExp = /[^A-Za-z0-9]/gi;
	
	if(regExp.test($(this).val())){
		alert("영문 대소문자와 숫자만 입력할 수 있습니다.");
		$(this).val($(this).val().replace(regExp, ""));
	}
}
function inputNumType() {
	let regExp = /[^0-9]/gi;
	
	if(regExp.test($(this).val())){
		alert("숫자만 입력할 수 있습니다.");
		$(this).val($(this).val().replace(regExp, ""));
	}
}

$(function() {
	
	// 회원가입
	// 아이디 영문숫자 입력
	$("#id").on("keyup", inputCharType);
	// 아이디 중복체크
	$("#idCheckBtn").on("click", function() {
		$.ajax({
			"url" : "idCheck.ajax",
			"data" : {id : $("#id").val()},
			"type" : "post",
			"dataType" : "json",
			"success" : function(resData) {
				console.log(resData);
				if(resData.result) {
					$("#idCheck").val(true);
					$("#idCondition").css("display", "none");
					$("#idPossible").css("display","block");
					$("#idImpossible").css("display", "none");
				} else {
					$("#idCheck").val(false);
					$("#idCondition").css("display", "none");
					$("#idPossible").css("display","none");
					$("#idImpossible").css("display", "block");
				}
				
			},
			"error" : function(xhr, status, err) {
				console.log("error : ", status, "-", err);
			}		
		});
		return false;
	});
	// 비밀번호 일치 (실시간)
	$("#pass2").on("keyup", function() {
		if($("#pass2").val() == $("#pass1").val()) {
			$("#passPossible").css("display", "block");
		}
		if($("#pass2").val() != $("#pass1").val()) {
			$("#passPossible").css("display", "none");
		}
	});
	// 핸드폰번호 숫자입력
	$("#mobile2").on("keyup", inputNumType);
	// 마케팅수신 체크
	$("#marketingAll").on("click", function() {
		if($("#marketingAll").is(":checked")) {
			$("input[name=marketing]").prop("checked", true);
		} else {
			$("input[name=marketing]").prop("checked", false);
		}
	});
	// 회원가입폼 서브밋
	$("#memberJoinForm").on("submit", function() {
		if($("#id").val().length < 5) {
			$("#id").focus();
			return false;
		}	
		if($("#pass1").val().length <= 0) {
			$("#pass1").focus();
			return false;
		}	
		if($("#name").val().length <= 0) {
			$("#name").focus();
			return false;
		}	
		if($("#mobile2").val().length <= 0) {
			$("#mobile2").focus();
			return false;
		}	
		if($("#mail").val().length <= 0) {
			$("#mail").focus();
			return false;
		}	
		if($("#zipcode").val().length <= 0) {
			$("#zipcode").focus();
			return false;
		}	
		if($("#address1").val().length <= 0) {
			$("#address1").focus();
			return false;
		}
		if(!$("#idCheck").val()) {
			alert("아이디 중복체크를 해주세요.");
			return false;
		}
		if($("#pass2").val() != $("#pass1").val()) {
			alert("비밀번호가 일치하지 않습니다");
			$("#pass2").focus();
			return false;
		}
	});
	// 관리자등록폼 서브밋
	$("#adminRegisterForm").on("submit", function() {
		if($("#id").val().length < 5) {
			$("#id").focus();
			return false;
		}	
		if($("#pass1").val().length <= 0) {
			$("#pass1").focus();
			return false;
		}	
		if($("#name").val().length <= 0) {
			$("#name").focus();
			return false;
		}	
		if($("#mobile2").val().length <= 0) {
			$("#mobile2").focus();
			return false;
		}	
		if($("#mail").val().length <= 0) {
			$("#mail").focus();
			return false;
		}	
		if($("#zipcode").val().length <= 0) {
			$("#zipcode").focus();
			return false;
		}	
		if($("#address1").val().length <= 0) {
			$("#address1").focus();
			return false;
		}
		if(!$("#idCheck").val()) {
			alert("아이디 중복체크를 해주세요.");
			return false;
		}
		if($("#pass2").val() != $("#pass1").val()) {
			alert("비밀번호가 일치하지 않습니다");
			$("#pass2").focus();
			return false;
		}
	});
	// 로그인 서브밋
	$("#loginForm").on("submit", function() {
		console.log("g");
		if($("#id").val().length < 5) {
			$("#id").focus();
			alert('아이디를 입력해주세요');
			return false;
		}	
		if($("#pass").val().length <= 0) {
			$("#pass").focus();
			return false;
		}			
	});
	
	// 비밀번호 확인 후 회원정보수정폼 보이기
	$("#modifyBtn").on("click", function(){
		let id = $("#id").val();
		$.ajax({
			"url" : "isPass",
			"data" : {id : id,
						pass : $("#pass").val()},
			"type" : "post", 
			"dataType" : "json",
			"success" : function(resData) {
				console.log(resData);
				if(resData){
					$.ajax({
						"url" : "getMemberInfo",
						"data" : {id : id},
						"type" : "post", 
						"dataType" : "json",
						"success" : function(resData01) {
							console.log(resData01);
							$("#name").val(resData01.member.name);
							
							let mobile1 = resData01.member.phone.substring(0,3);
							console.log(mobile1);
							if(mobile1 == '010') {
								$("#mobile1").val('010');
								$("#mobile1 option[value='010']").prop("selected", true);
							}
							if(mobile1 == '011') {
								$("#mobile1").val('011');
								$("#mobile1 option[value='011']").prop("selected", true);
							}
							if(mobile1 == '016') {
								$("#mobile1").val('016');
								$("#mobile1 option[value='016']").prop("selected", true);
							}
							if(mobile1 == '017') {
								$("#mobile1").val('017');
								$("#mobile1 option[value='017']").prop("selected", true);
							}
							if(mobile1 == '018') {
								$("#mobile1").val('018');
								$("#mobile1 option[value='018']").prop("selected", true);
							}
							if(mobile1 == '019') {
								$("#mobile1").val('019');
								$("#mobile1 option[value='019']").prop("selected", true);
							}
							
							
							$("#mobile2").val(resData01.member.phone.substring(3));
							$("#mail").val(resData01.member.mail).prop("disabled", true);
							$("#zipcode").val(resData01.member.zipcode);
							$("#address1").val(resData01.member.address1);
							$("#address2").val(resData01.member.address2);
							
							let marketing = resData01.member.marketing;
							console.log(marketing);
							if(marketing.indexOf('all') !== -1)  {
								$("#post").prop("checked", true);
								$("#mail").prop("checked", true);
								$("#text").prop("checked", true);
								$("#sns").prop("checked", true);
							}
							if(marketing.indexOf('post') !== -1) $("#post").prop("checked", true);
							if(marketing.indexOf('mail') !== -1) $("#mail").prop("checked", true);
							if(marketing.indexOf('text') !== -1) $("#text").prop("checked", true);
							if(marketing.indexOf('sns') !== -1) $("#sns").prop("checked", true);
							
						},
						"error" : function(xhr, status, err) {
							console.log("err222");
						}
					});
					$("#modifyPassCheck").css("display", "none");
					$("#pass").prop("disabled", true);
					$("#modifyBtn").css("display", "none");
					$("#modifyInfo").css("display", "block");
				} else {
					$("#modifyPassCheck").css("display", "block");
				}
			},
			"error" : function(xhr, status, err) {
				console.log("err");
			}
			
		});
		return false;
	});
	// 회원정보수정폼 서브밋
$("#memberUpdateForm").on("submit", function() {
		if($("#pass1").val().length <= 0) {
			$("#pass1").focus();
			return false;
		}	
		if($("#name").val().length <= 0) {
			$("#name").focus();
			return false;
		}	
		if($("#mobile2").val().length <= 0) {
			$("#mobile2").focus();
			return false;
		}	
		if($("#zipcode").val().length <= 0) {
			$("#zipcode").focus();
			return false;
		}	
		if($("#address1").val().length <= 0) {
			$("#address1").focus();
			return false;
		}
		if($("#pass2").val() != $("#pass1").val()) {
			alert("비밀번호가 일치하지 않습니다");
			$("#pass2").focus();
			return false;
		}
	});





});