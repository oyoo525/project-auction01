<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*, java.text.*" %>
<%
	Date current = new Date();
	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");     
	String formatedNow = formatter.format(current);

	request.setAttribute("current", current);
%>

<!-- content -->

	<div class="row my-5">
		<input type="hidden" name="no" id="no" value="${auction.no}">
		<input type="hidden" name="buyer" id="buyer" value="${sessionScope.loginId}">
		<input type="hidden" name="currentPrice" id="currentPrice" value="${auction.endPrice}">
		<input type="hidden" name="realStartPrice" id="realStartPrice" value="${auction.startPrice}">
		<div class="col">
			<div class="col-12 text-end border-bottom border-3 mb-3 pb-3">
				<a href="auctionList?period=${period}&keyword=${keyword}" class="btn btn-secondary" >목록보기</a>
			</div>
			<div class="row border-bottom border-3 pb-5 mb-5">
				<div class="col-6 p-5">
					<div class="card text-center">
						<img src="resources/upload/${auction.img}" alt="${auction.name}" class="w-100">
					</div>
				</div>
				<div class="col-6">
					<div class="row">
						<div class="col-12 text-end">
							<a href="#" title="관심목록" class="text-decoration-none">
								<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">
									<path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>
								</svg>
							</a>&nbsp;
							<a href="#" title="관심목록" class="text-decoration-none">
								<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16">
								  <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>
								</svg>						
							</a>&nbsp;
							<a href="#" title="공유하기" class="text-decoration-none">
								<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-send" viewBox="0 0 16 16">
									<path d="M15.854.146a.5.5 0 0 1 .11.54l-5.819 14.547a.75.75 0 0 1-1.329.124l-3.178-4.995L.643 7.184a.75.75 0 0 1 .124-1.33L15.314.037a.5.5 0 0 1 .54.11ZM6.636 10.07l2.761 4.338L14.13 2.576 6.636 10.07Zm6.787-8.201L1.591 6.602l4.339 2.76 7.494-7.493Z"/>
								</svg>
							</a>&nbsp;
						</div>
						<div class="col-12 border-bottom p-3">
							<h2 class="mt-4 ms-3">${auction.name}</h2>
							<h4 class="mb-3 ms-4">${auction.id}</h4>
						</div>
						<div class="col-12 mx-3 my-5">
							<ul class="list-group list-group-flush">
								<li class="list-group-item disabled" aria-disabled="true">
									<div style="float:left">
										<span>시작가</span>
									</div>
									<div class="text-end">
										<span><fmt:formatNumber value="${auction.startPrice}" pattern="#,###" /></span>
									</div>
								</li>
								<li class="list-group-item disabled" aria-disabled="true">
									<div style="float:left">
										<span>현재가</span>
									</div>
									<div class="text-end">
										<span><input type="text" id="endPrice" style="border:none;text-align:right; color:red"
											value="<fmt:formatNumber value="${auction.endPrice == 0 ? 
											auction.startPrice : auction.endPrice}" pattern="#,###" />"></span>
									</div>
								</li>
								<li class="list-group-item disabled" aria-disabled="true">
									<div style="float:left">
										<span>응찰수</span>
									</div>
									<div class="text-end">
										<span><input type="text" id="count" style="border:none;text-align:right;"
													value="${auction.count}"></span>
									</div>
								</li>
								<li class="list-group-item disabled" aria-disabled="true">
									<div style="float:left">
										<span>응찰자</span>
									</div>
									<div id="upcBuyer" class="text-end">
										<c:if test="${sessionScope.loginId eq auction.buyer}">
											<span><input type="text" style="border:none;text-align:right;"
													value="${auction.buyer}"></span>
										</c:if>
										<c:if test="${sessionScope.loginId ne auction.buyer && auction.buyer != null}">
											<span><input type="text" style="border:none;text-align:right;"
													value="= 다른 회원 ="></span>
										</c:if>
										<c:if test="${auction.buyer == null}">
											<span><input type="text" style="border:none;text-align:right;"
													value="= 응찰자 없음 ="></span>
										</c:if>
									</div>
								</li>
								<li class="list-group-item disabled" aria-disabled="true">
									<div style="float:left">
										<span>마감일</span>
									</div>
									<div class="text-end">
										<span >${auction.endDate}</span>
									</div>
								</li>						
							</ul>
						</div>
					</div>
					<c:if test="${sessionScope.loginId eq auction.id && auction.startDate > current }">
						<div class="row">
							<div class="col text-center mb-3">
								<a href="updateAuction?no=${auction.no}" class="btn btn-dark btn-lg w-100">
									수정하기
								</a>
							</div>
							<div class="col">
								<a href="deleteAuction?no=${auction.no}" class="btn btn-dark btn-lg w-100">
									삭제하기
								</a>
							</div>
						</div>
					</c:if>
					<c:if test="${sessionScope.loginId ne auction.id && period == 'progress'}">
						<div class="row">
							<div class="col-12 text-center mt-3 mb-1">
								<input type="text" name="startPrice" id="startPrice" 
										class="form-control" placeholder="응찰금액을 입력해주세요">
							</div>
						</div>
						<div class="row">
							<div class="col text-center mb-3">
								<input type="button" id="bidBtn" value="응찰하기" 
										class="btn btn-dark btn-lg w-100">
							</div>
						</div>
					</c:if>
				</div>
			</div>
			<div class="row px-5">
				<h2 class="mb-3 p-2 border-bottom">작품정보</h2>
				<pre style=" white-space: pre-wrap;">${auction.content}</pre>
			</div>
		</div>
	</div>