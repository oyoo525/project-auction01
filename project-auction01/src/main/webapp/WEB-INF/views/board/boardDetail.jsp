<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    
	
	<!-- content -->
	<div class="row my-5">
		<div class="col">
			<div class="row">
				<div class="col-10 offset-1">
					<div class="row my-3">
						<div class="col">
							<h3 class="fs-2 fw-bold">${board.title}</h3>
						</div>
					</div>
					<div class="row my-3 border-bottom border-3 pb-4">
						<div class="col">
							<span class="me-5">작성자 : ${board.id}</span>
							<span class="text-secondary">${board.regDate}</span>
						</div>
						<div class="col text-end">
							<c:if test="${sessionScope.loginId eq board.id }">
								<a href="updateBoard?no=${board.no}" class="btn btn-outline-dark">수정하기</a>
								<a href="deleteBoard?no=${board.no}" class="btn btn-outline-dark">삭제하기</a>
							</c:if>
							<a href="boardList" class="btn btn-outline-dark">목록보기</a>
						</div>
					</div>
					<div class="row my-4 pb-5 border-bottom">
						<div class="col">
							${board.content}
						</div>
					</div>
					<!-- 댓글 버튼 -->
					<div class="row">
						<div class="col-12 text-end">
							<a class="btn btn-outline-primary" data-bs-toggle="collapse" 
								href="#collapseReply" role="button" aria-expanded="false" 
								aria-controls="collapseExample">
								댓글
  							</a>
						</div>
						<div class="col-12 collapse" id="collapseReply">
							<!-- 댓글 입력폼 -->
							<form name="replyForm" id="replyForm" 
									class="replyForm row border my-3 p-3 bg-secondary-subtle">
								<input type="hidden" name="no" id="no">
								<input type="hidden" name="boardNo" id="boardNo" value="${board.no}">
								<input type="hidden" name="id" id="id" value="${sessionScope.loginId}">
								<div class="col-10">
									<textarea rows="3" name="content" id="content" class="form-control"></textarea>
								</div>
								<div class="col-2">
									<input type="submit" value="등록하기" class="btn btn-primary w-100 h-100">
								</div>
							</form>
							<!-- 댓글창 -->
							<div id="replyList" class="row">
								<div class="col">
									<c:if test="${empty replyList}">
										댓글이 없습니다.
									</c:if>
									<!-- 댓글 반복 -->
									<c:if test="${not empty replyList}">
										<c:forEach var="reply" items="${replyList}">
											<div class="replyRow row border-bottom p-3">
												<div class="col">
													<div class="row">
														<div class="col">
															<p class="fw-bold">${reply.id}</p>
														</div>
													</div>
													<div class="row">
														<div class="col">
															<p>${reply.content}</p>
															<p class="text-secondary">${reply.regDate}</p>
														</div>
														<div class="col text-end">
															<input type="button" value="수정" class="modifyReplyBtn" data-no="${reply.no}">
															<input type="button" value="삭제" class="deleteReplyBtn" data-no="${reply.no}">
														</div>
													</div>
												</div>
											</div>
										</c:forEach>
									</c:if>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>