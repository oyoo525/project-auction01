<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>    

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.roadAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                } 

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("zipcode").value = data.zonecode;
                document.getElementById("address1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("address2").focus();
            }
        }).open();
    }
</script>

<!-- content -->
	<form name="memberUpdateForm" id="memberUpdateForm" 
				action="memberUpdate" method="post"
				class="row my-5">
		<div class="col-6 offset-3">
			<div class="row">
				<div class="col border-bottom my-5">
					<h2 class="fw-bold">회원 정보 수정</h2>
					<p class="text-end"><span class="text-danger">*</span> 필수</p>
				</div>
			</div>
			<div class="row mb-3">
				<div class="col-12">
					<label for="id">
						<span class="text-danger">*</span>
						<span class="fw-bold fs-5">아이디</span>
					</label>
				</div>
				<div class="col-12">
					<input type="text" name="id" id="id" class="form-control form-control-lg"
								value="${sessionScope.loginId}" disabled>
				</div>
			</div>			
			<div class="row mb-3">
				<div class="col-12">
					<label for="password1">
						<span class="text-danger">*</span>
						<span class="fw-bold fs-5">비밀번호</span>
					</label>
					<input type="password" name="pass" id="pass" placeholder="기존 비밀번호 입력"
					 		class="form-control form-control-lg">
				</div>
				<div class="col-12">
					<span id="modifyPassCheck" class="text-danger fw-bold" style="display:none;">비밀번호가 일치하지 않습니다.</span>
				</div>
			</div>
			<div class="row">
				<div class="col text-center">
					<input type="button" value="수정하기" id="modifyBtn"
							class="btn btn-secondary btn-lg w-100">
				</div>
			</div>	
			<div id="modifyInfo" style="display: none;">
				<div class="row mb-3">
					<div class="col">
						<label for="password1">
							<span class="text-danger">*</span>
							<span class="fw-bold fs-5">새 비밀번호</span>
						</label>
						<input type="password" name="pass1" id="pass1" placeholder="새 비밀번호 입력"
						 		class="form-control form-control-lg">
					</div>
				</div>
				<div class="row mb-3">
					<div class="col-12">
						<label for="password2">
							<span class="text-danger">*</span>
							<span class="fw-bold fs-5">새 비밀번호 확인</span>
						</label>
						<input type="password" name="pass2" id="pass2" placeholder="새 비밀번호 다시입력"
								class="form-control form-control-lg">
					</div>
					<div class="col-12">
						<span id="passPossible" class="text-success fw-bold" style="display:none">비밀번호가 일치합니다.</span>
					</div>
				</div>
				<div class="row mb-3">
					<div class="col">
						<label for="name">
							<span class="text-danger">*</span>
							<span class="fw-bold fs-5">이름</span>
						</label>
						<input type="text" name="name" id="name" 
								class="form-control form-control-lg">
					</div>
				</div>	
				<div class="row mb-3">
					<div class="col">
						<div class="row">
							<div class="col">
								<label for="mobile">
									<span class="text-danger">*</span>
									<span class="fw-bold fs-5">핸드폰번호</span>
								</label>
							</div>
						</div>
						<div class="row">
							<div class="col-4">
								<select name="mobile1" id="mobile1" class="form-select form-select-lg" >
									<option ${sessionScope.memberInfo.phone.substring(0,2) == '010' ? 'checked' : ''}>010</option>
									<option ${sessionScope.memberInfo.phone.substring(0,2) == '011' ? 'checked' : ''}>011</option>
									<option ${sessionScope.memberInfo.phone.substring(0,2) == '016' ? 'checked' : ''}>016</option>
									<option ${sessionScope.memberInfo.phone.substring(0,2) == '017' ? 'checked' : ''}>017</option>
									<option ${sessionScope.memberInfo.phone.substring(0,2) == '018' ? 'checked' : ''}>018</option>
									<option ${sessionScope.memberInfo.phone.substring(0,2) == '019' ? 'checked' : ''}>019</option>
								</select>
							</div>
							<div class="col-8">
								<input type="text" name="mobile2" id="mobile2" maxlength="8" 
										class="form-control form-control-lg">
							</div>
						</div>
					</div>
				</div>
				<div class="row mb-3">
					<div class="col">
						<div class="row">
							<div class="col">
								<label for="mail">
									<span class="text-danger">*</span>
									<span class="fw-bold fs-5">이메일</span>
								</label>
							</div>
						</div>
						<div class="row">
							<div class="col-12">
								<input type="text" name="mail" id="mail" class="form-control form-control-lg">
							</div>
							<div class="col-12">
								<span class="text-success fw-bold">이메일 인증이 완료되었습니다.</span>
							</div>
						</div>
					</div>
				</div>	
				<div class="row mb-3">
					<div class="col-12">
						<label>
							<span class="text-danger">*</span>
							<span class="fw-bold fs-5">주소</span>
						</label>
					</div>
					<div class="col-6">
						<input type="text" name="zipcode" id="zipcode" class="form-control form-control-lg">
					</div>
					<div class="col-4">
						<input type="button" value="우편번호" class="btn btn-secondary btn-lg w-100"
									onclick="sample6_execDaumPostcode()">
					</div>				
					<div class="col-12 my-1">
						<input type="text" name="address1" id="address1" class="form-control form-control-lg">
					</div>
					<div class="col-12 my-1">
						<input type="text" name="address2" id="address2" class="form-control form-control-lg">
					</div>
				</div>		
				<div class="row mb-3">
					<div class="col-12">
						<label for="email">
							<span class="fw-bold fs-5">마케팅 수신동의</span>
							
						</label>
					</div>
					<div class="col-12 my-1">
						<div class="form-check">
							<input class="form-check-input" type="checkbox" name="marketing" id="marketingAll" value="all">
							<label class="form-check-label" for="all">
							  전체동의
							</label>
						</div>
					</div>
					<div class="col-6 my-1">
						<div class="form-check">
							<input class="form-check-input" type="checkbox" name="marketing" id="post" value="post"
									${fn:contains(sessionScope.memberInfo.marketing, 'post') ? 'checked' : ''}>
							<label class="form-check-label" for="post">
							  우편
							</label>
						</div>
					</div>
					<div class="col-6 my-1">
						<div class="form-check">
							<input class="form-check-input" type="checkbox" name="marketing" id="mail" value="mail"
									${fn:contains(sessionScope.memberInfo.marketing, 'mail') ? 'checked' : ''}>
							<label class="form-check-label" for="mail">
							  이메일
							</label>
						</div>
					</div>
					<div class="col-6 my-1">
						<div class="form-check">
							<input class="form-check-input" type="checkbox" name="marketing" id="text" value="text"
									${fn:contains(sessionScope.memberInfo.marketing, 'text') ? 'checked' : ''}>
							<label class="form-check-label" for="text">
							  문자
							</label>
						</div>
					</div>
					<div class="col-6 my-1">
						<div class="form-check">
							<input class="form-check-input" type="checkbox" name="marketing" id="sns" value="sns"
									${fn:contains(sessionScope.memberInfo.marketing, 'sns') ? 'checked' : ''}>
							<label class="form-check-label" for="sns">
							  SNS
							</label>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col text-center">
						<input type="submit" value="수정하기" class="btn btn-secondary btn-lg w-100">
					</div>
				</div>
			</div>
		</div>
	</form>