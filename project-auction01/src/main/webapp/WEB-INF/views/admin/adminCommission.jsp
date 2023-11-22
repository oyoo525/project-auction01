<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- content -->
	<div class="row my-5">
		<div class="col">
			<div class="row">
				<div class="col">
					<h2>매출관리</h2>
				</div>
			</div>
			<div class="row p-3">
				<div class="col">
					<div class="row">
						<div class="col-3">
							<h4>낙찰 물품</h4>
						</div>
						<div class="col-9 text-end">
							시작일 : <input type="date">							
							종료일 : <input type="date">
							<input type="button" value="검색">							
							<input type="button" value="전체목록">							
						</div>
					</div>
					<div class="row">
						<div class="col">
							<table class="table">
								<thead>
									<tr>
										<th>NO</th>
										<th>물건명</th>
										<th>낙찰가</th>
										<th>판매자</th>
										<th>마감일</th>
										<th>낙찰자</th>
										<th>입금<br>(입금일)</th>
										<th>배송<br>(배송일)</th>
										<th>송금<br>(송금일)</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="auction" items="${auctionList}">
										<tr>
											<td>${auction.no}</td>
											<td>${auction.name}</td>
											<td><fmt:formatNumber value="${auction.endPrice}"  pattern="#,###" /></td>
											<td>${auction.id}</td>
											<td>${auction.endDate}</td>
											<td>${auction.buyer}</td>
											<td>
												<c:if test="${not auction.depositStatus}">
													미입금<br>
													<input type="button" value="확인" id="depositCheckBtn" data-bs-toggle="modal" data-bs-target="#depositModal">
												</c:if>
												<c:if test="${auction.depositStatus}">
													입금완료<br>${auction.depositDate}
													<input type="button" value="취소" id="depositErrorBtn">
												</c:if>
											</td>
											<td>배송</td>
											<td>송금</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
<!-- 입금확인 모달창 -->
	<div class="modal fade" id="depositModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">입금확인</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<form class="modal-body g-3">
				  	확인담당 : <input type="text" value="${sessionScope.loginId}" 
				  					class="form-control"readonly><br>
				  	입금일자 : <input type="date" name="depositDate" id="depositDate" class="form-control" ><br>
				  	<div class="text-center">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
						<button type="submit" class="btn btn-primary">확인</button>
				  	</div>
				</form>
			</div>
		</div>
	</div>