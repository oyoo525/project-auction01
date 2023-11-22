<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- content -->
	<form name="loginForm" id="loginForm" action="login" method="post"
			class="row my-5">
		<div class="col-6 offset-3">
			<div class="row mt-3 mb-5">
				<div class="col my-2 text-center">
					<h2 class="fw-bold">로그인</h2>
				</div>
			</div>
			<div class="row mb-3">
				<div class="col-10 offset-1">
				<input type="text" name="id" id="id" placeholder="아이디 입력" 
						class="form-control form-control-lg">
				</div>
			</div>
			<div class="row mb-3">
				<div class="col-10 offset-1">
				<input type="password" name="pass" id="pass" placeholder="비밀번호 입력" 
						class="form-control form-control-lg">
				</div>
			</div>
			<div class="row mb-3">
				<div class="col-10 offset-1">
				<input type="submit" value="로그인" 
						class="btn btn-success btn-lg w-100">
				</div>
			</div>
			<div class="row mb-3">
				<div class="col-10 offset-1 text-center fs-3 text-body-secondary">
					<a href="#" class="btn">아이디 찾기</a> l 
					<a href="#" class="btn">비밀번호 찾기</a> l 
					<a href="memberJoin" class="btn">회원가입</a>
				</div>
			</div>
		</div>
	</form>