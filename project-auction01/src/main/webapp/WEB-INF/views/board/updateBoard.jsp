<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!-- content -->
	<form name="findBoard" id="findBoard" action="updateFindBoard" method="post" 
			class="row my-5">
		<input type="hidden" name="no" id="no" value="${board.no}">
		<input type="hidden" name="id" id="id" value="${sessionScope.loginId}">
		<div class="col">
			<div class="row fw-bold my-3 p-3">
				<div class="col-10 offset-1">
					<h2>희망 게시판 수정하기</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-10 offset-1">
					<div class="row my-1 ">
						<div class="col">
							<label for="title">제  목</label>
							<input type="text" name="title" id="title" value="${board.title}" 
							]		class="form-control">					
						</div>
					</div>
					<div class="row my-1 ">
						<div class="col">
							<label for="id">내  용</label>
							<textarea rows="10" name="content" id="content" 
									class="form-control">${board.content}</textarea>		
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