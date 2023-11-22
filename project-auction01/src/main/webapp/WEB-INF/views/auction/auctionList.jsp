<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- content -->
	<div class="row my-5">
		<input type="hidden" id="period" value="${period}">
		<input type="hidden" id="keyword" value="${keyword}">
		<input type="hidden" id="pageNum" value="${pageNum}">
		<div class="col">
			<div class="row mb-4">
				<div class="col">
					<c:if test="${period == 'progress'}">
						<a href="auctionList?period=progress&keyword=${keyword}" class="btn btn-dark">진행경매</a>
						<a href="auctionList?period=upcoming&keyword=${keyword}" class="btn btn-outline-dark">예정경매</a>
						<a href="auctionList?period=expire&keyword=${keyword}" class="btn btn-outline-dark">경매결과</a>
					</c:if>
					<c:if test="${period == 'upcoming'}">
						<a href="auctionList?period=progress&keyword=${keyword}" class="btn btn-outline-dark">진행경매</a>
						<a href="auctionList?period=upcoming&keyword=${keyword}" class="btn btn-dark">예정경매</a>
						<a href="auctionList?period=expire&keyword=${keyword}" class="btn btn-outline-dark">경매결과</a>
					</c:if>
					<c:if test="${period == 'expire'}">
						<a href="auctionList?period=progress&keyword=${keyword}" class="btn btn-outline-dark">진행경매</a>
						<a href="auctionList?period=upcoming&keyword=${keyword}" class="btn btn-outline-dark">예정경매</a>
						<a href="auctionList?period=expire&keyword=${keyword}" class="btn btn-dark">경매결과</a>
					</c:if>
				</div>
				<div class="col text-end">
					<select name="printType" id="printType" class="form-control">
						<option value="new" ${printType == 'new' ? 'selected' : ''}>최신 등록순</option>
						<option value="endDateUp" ${printType == 'endDateUp' ? 'selected' : ''}>마감일 빠른순</option>
						<option value="endDateDown" ${printType == 'endDateDown' ? 'selected' : ''}>마감일 느린순</option>
						<option value="priceUp" ${printType == 'priceUp' ? 'selected' : ''}>현재가 높은순</option>
						<option value="priceDown" ${printType == 'priceDown' ? 'selected' : ''}>현재가 낮은순</option>
						<option value="countUp" ${printType == 'countUp' ? 'selected' : ''}>응찰수 많은순</option>
						<option value="countDown" ${printType == 'countDown' ? 'selected' : ''}>응찰수 적은순</option>
					</select>
				</div>
			</div>
			
			<c:if test="${empty atList}">
				<div class="row my-5">
					<div class="col text-center">
						<img src="resources/img/myedit_ai_image_1116205316.jpg" class="w-50 m-3">
						<p class="fs-3 fw-bold text-center">
							<c:if test="${keyword != 'null'}">${keyword}에 대해 </c:if>
							<c:if test="${period == 'progress'}">진행중인 </c:if>
							<c:if test="${period == 'upcoming'}">예정된 </c:if>
							<c:if test="${period == 'expire'}">만료된 </c:if>
							경매가 없습니다.
						</p>
					</div>
				</div>
			</c:if>
			<!-- 경매 반복 -->
			<c:if test="${not empty atList}">
				<div class="row my-5">
					<div class="col">
						<div class="row row-cols-1 row-cols-md-3 row-cols-lg-4 g-4">
							<c:forEach var="atList" items="${atList}">
								<div class="col">
									<a href="detail?no=${atList.no}&period=${period}&keyword=${keyword}">
									<div class="card">
										<div class="image_container">
											<img src="resources/upload/${atList.img}" class="card-img-top" alt="${atList.name}"
													style="width:100%; height:100%; object-fit:cover;">
										</div>
										<div class="card-body">
											<h5 class="card-title">${atList.name}</h5>
											<p class="card-end">
												시작일 : ${atList.startDate}<br>
												마감일 : ${atList.endDate}<br>
												시작가 : <fmt:formatNumber value="${atList.startPrice}" pattern="#,###" /><br>
												현재가 : <fmt:formatNumber value="${atList.endPrice == 0 ? 
												atList.startPrice : atList.endPrice}" pattern="#,###" /><br>
												<span class="text-danger fw-bold fs-6">(응찰 ${atList.count})</span>
											</p>
										</div>
									</div>
								 	</a>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</c:if>
			
			<!-- 페이지네이션 24개씩 -->
			<c:if test="${not empty atList}">
				<div class="row">
					<div class="col">
						<nav aria-label="Page navigation">					
						  <ul class="pagination justify-content-center">					  
						  	<c:if test="${startPage > pageGroup}">
						    	<li class="page-item">
						    		<a class="page-link" 
						    			href="boardList?pageNum=${startPage - pageGroup}
						    			&keyword=${keyword}">Pre</a>
						    	</li>
						    </c:if>
						    <c:forEach var="i" begin="${startPage}" end="${endPage}">
						    	<c:if test="${ i == currentPage}">
								    <li class="page-item active" aria-current="page">
								    	<span class="page-link">${i}</span>
								    </li>
							    </c:if>
							    <c:if test="${ i != currentPage}">
								    <li class="page-item">
								    	<a class="page-link" 
								    		href="auctionList?period=${period}&keyword=${keyword}&pageNum=${i}">${i}</a>
								    </li>
							    </c:if>
						    </c:forEach>
							<c:if test="${endPage < pageCount}">
						    	<li class="page-item">
						    		<a class="page-link" 
						    			href="boardList?pageNum=${endPage + 1}">Next</a>
						    	</li>
						    </c:if>	
						  </ul>
						</nav>
					</div>
				</div>
			</c:if>
		</div>
	</div>