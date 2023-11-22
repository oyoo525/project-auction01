<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    
<!-- content -->
	<div class="row my-5">
		<div class="col">
			<div class="row fw-bold">
				<div class="col">
					<h2>희망 게시판</h2>
				</div>
			</div>
			<div class="row my-3 p-3">
				<div class="col-8">
					<form action="boardList" class="row">
						<div class="col-8">
							<input type="text" name="keyword" id="keyword" class="form-control">
						</div>
						<div class="col-4">
							<input type="submit" value="검색" class="btn btn-primary">
						</div>
					</form>
				</div>
				<div class="col-4 text-end">
					<a href="boardList" class="btn btn-secondary">전체목록</a>
					<c:if test="${sessionScope.isLogin}">
						<a href="boardList?id=${sessionScope.loginId}" class="btn btn-secondary">내 게시글</a>
					</c:if>
					<a href="writeBoard" class="btn btn-secondary">글쓰기</a>
				</div>
			</div>
			<div class="row">
				<c:if test="${empty boardList}">
					<span class="text-center">
						= 현재 게시글이 없습니다 =
					</span>
				</c:if>
				<c:if test="${not empty boardList}">		
					<table class="table table-hover">
						<thead>
							<tr>
								<th scope="col">NO</th>
								<th scope="col">제목</th>
								<th scope="col">작성자</th>
								<th scope="col">작성일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="board" items="${boardList}">
								<tr>
									<td>${board.no}</td>
									<td><a href="boardDetail?no=${board.no}">${board.title}</a></td>
									<td>${board.id}</td>
									<td>${board.regDate}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</c:if>
				
				
			</div>
		</div>
	</div>    