<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- content -->
	<form name="memberJoinForm" id="memberJoinForm" 
				action="memberJoin" method="post"
				class="row my-5">
		<input type="hidden" name="memberType" id="memberType" value="admin">
		<div class="col-6 offset-3">
			<div class="row">
				<div class="col border-bottom my-5">
					<h2 class="fw-bold">관리자 수정</h2>
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
					<input type="text" name="id" id="id" class="form-control form-control-lg">
				</div>
			</div>			
			<div class="row mb-3">
				<div class="col">
					<label for="password1">
						<span class="text-danger">*</span>
						<span class="fw-bold fs-5">기존 비밀번호</span>
					</label>
					<input type="password" name="password1" id="password1" placeholder="비밀번호 입력"
					 		class="form-control form-control-lg">
				</div>
			</div>
			<div class="row mb-3">
				<div class="col">
					<label for="password1">
						<span class="text-danger">*</span>
						<span class="fw-bold fs-5">새 비밀번호</span>
					</label>
					<input type="password" name="password1" id="password1" placeholder="비밀번호 입력"
					 		class="form-control form-control-lg">
				</div>
			</div>
			<div class="row mb-3">
				<div class="col">
					<label for="password2">
						<span class="text-danger">*</span>
						<span class="fw-bold fs-5">비밀번호 확인</span>
					</label>
					<input type="password" name="password2" id="password2" placeholder="비밀번호 다시입력"
							class="form-control form-control-lg">
				</div>
			</div>
			<div class="row mb-3">
				<div class="col">
					<label for="name">
						<span class="text-danger">*</span>
						<span class="fw-bold fs-5">이름</span>
					</label>
					<input type="text" name="name" id="name" class="form-control form-control-lg">
				</div>
			</div>	
			<div class="row mb-3">
				<div class="col">
					<label for="mobile">
						<span class="text-danger">*</span>
						<span class="fw-bold fs-5">핸드폰번호</span>
					</label>
					<input type="text" name="mobile" id="mobile" class="form-control form-control-lg">
				</div>
			</div>
			<div class="row mb-3">
				<div class="col">
					<label for="email">
						<span class="text-danger">*</span>
						<span class="fw-bold fs-5">이메일</span>
					</label>
					<input type="text" name="email" id="email" class="form-control form-control-lg">
				</div>
			</div>	
			<div class="row mb-3">
				<div class="col-12">
					<label>
						<span class="text-danger">*</span>
						<span class="fw-bold fs-5">주소</span>
					</label>
				</div>
				<div class="col-8">
					<input type="text" name="address1" id="address1" class="form-control form-control-lg">
				</div>
				<div class="col-4">
					<input type="button" value="우편번호" class="btn btn-secondary btn-lg w-100">
				</div>				
				<div class="col-12 my-1">
					<input type="text" name="address2" id="address2" class="form-control form-control-lg">
				</div>
			</div>

			<div class="row my-4">
				<div class="col border-bottom"> </div>
			</div>
			<div class="row">
				<div class="col text-center">
					<input type="submit" value="수정하기" class="btn btn-primary btn-lg w-100">
				</div>
				<div class="col text-center">
					<input type="submit" value="해지하기" class="btn btn-danger btn-lg w-100">
				</div>
			</div>	
		</div>
	</form>