<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!-- content -->
	<form name="findBoard" id="findBoard" action="insertFindBoard" method="post" 
			class="row my-5">
		<input type="hidden" name="id" id="id" value="${sessionScope.loginId}">
		<div class="col">
			<div class="row bg-dark text-light fw-bold my-3 p-3">
				<div class="col-10 offset-1">
					<h2>희망 게시판</h2>
					<p>찾고 있는 물건이 있을 경우 작성해주세요.</p>
				</div>
			</div>
			<div class="row">
				<div class="col-10 offset-1">
					<div class="row my-1 ">
						<div class="col">
							<label for="title">제  목</label>
							<input type="text" name="title" id="title" class="form-control">					
						</div>
					</div>
					<div class="row my-1 ">
						<div class="col">
							<label for="id">내  용</label>
							<textarea rows="10" name="content" id="content" class="form-control"></textarea>		
						</div>
					</div>
				</div>
			</div>
			<div class="row my-5">
				<div class="col text-center">
					<input type="submit" value="등록하기" class="btn btn-primary">
				</div>
			</div>
		</div>
	</form>