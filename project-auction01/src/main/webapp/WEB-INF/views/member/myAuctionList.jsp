<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.project.auction.domain.Auction" %>
<%@ page import="java.sql.*, java.util.*" %>
<%
	// 입금마감날짜 계산하기
	List<Auction> bidList = (List<Auction>)request.getAttribute("bidList");
	
	for(Auction bid : bidList) {
		java.util.Date disposit = bid.getEndDate();
		Calendar cal = Calendar.getInstance();
		cal.setTime(disposit);
		cal.add(Calendar.DATE, 7);
		java.util.Date newDisposit = cal.getTime();
		java.sql.Date sqlDisposit = new java.sql.Date(newDisposit.getTime());
		
		bid.setStartDate(sqlDisposit); // startDate에 입금마감날짜를 넣어두었음
	}
	
	// 현재시간 구하기
	java.util.Date currentDate = new java.util.Date();
	request.setAttribute("currentDate", currentDate);

%>
    
<!-- content -->
	<div class="row my-5">
		<div class="col-10 offset-1">
			<div class="row">
				<div class="col">
					<c:if test="${option eq 'bid'}">
						<h2>응찰 목록</h2>
					</c:if>
					<c:if test="${option eq 'exhibit'}">
						<h2>출품 목록</h2>
					</c:if>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<c:if test="${empty bidList}">
						<c:if test="${option eq 'bid'}">
							= 응찰한 물건이 없습니다 = 
						</c:if>
						<c:if test="${option eq 'exhibit'}">
							= 출품한 물건이 없습니다 = 
						</c:if>
					</c:if>
					<c:if test="${not empty bidList}">
						<c:forEach var="bid" items="${bidList}">
							<div class="row border-bottom p-3">
								<div class="col-2">
									<a href="detail?no=${bid.no}">
										<img src="resources/upload/${bid.img}" class="w-100">
									</a>
								</div>
								<div class="col-8">
									<span class="fs-4 fw-bold">${bid.name}</span><br>
									<span>현재가 : <fmt:formatNumber value="${bid.endPrice}" pattern="#,###" /></span><br>
									<span>마감일 : ${bid.endDate}</span>
								</div>
								<div class="col-2 text-center" style="vertical-align:middle" >
										<c:if test="${sessionScope.loginId eq bid.buyer }">
											<c:if test="${bid.endDate > currentDate}">
												<input type="button" value="me" class="btn btn-success" disabled>
											</c:if>
											<c:if test="${bid.endDate <= currentDate}">
												<button type="button" class="btn btn-sm btn-primary mb-1" data-bs-toggle="modal" data-bs-target="#countModal">
													입금계좌
												</button>
												<p>
													${bid.startDate}까지<br>
													미입금시 취소
												</p>
											</c:if>
										</c:if>
										<c:if test="${sessionScope.loginId ne bid.buyer and sessionScope.loginId ne bid.id}">
											<input type="button" value="others" class="btn btn-secondary" style="vertical-align:middle" disabled>
										</c:if>
										<c:if test="${empty bid.buyer and sessionScope.loginId eq bid.id}">
											<input type="button" value="nobody" class="btn btn-warning" style="vertical-align:middle" disabled>
										</c:if>
								</div>							
							</div>
						</c:forEach>		
					</c:if>
				</div>
			</div>
		</div>
	</div>
	
	
<div class="modal fade" id="countModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-body p-3">
			  <h4>입금계좌</h4>
			  <p class="text-center p-5">
			  	국민은행 462601-00-012345 KN옥션<br><br>
			  	문의 : 02-0123-4567
			  </p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-bs-dismiss="modal">확인</button>
			</div>
		</div>
	</div>
</div>