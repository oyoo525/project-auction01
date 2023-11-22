<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- header 영역 -->
<div class="container" id="header">
	<input type="hidden" id="loginId" value="${sessionScope.loginId}">
	<div id="headerTop" class="row" style="position:relative">
		<div class="col-2 py-1">
			<a href="main" title="home">
				<img src="resources/img/logo.png" alt="SEHWA AUCTION" class="w-75">
			</a>
		</div>
		<div class="col-10">
			<div class="row my-2">
				<div class="col text-end">
					<c:if test="${empty sessionScope.isLogin}">
						<a href="memberJoin" class="btn btn-light">회원가입</a>
						<a href="memberLogin" class="btn btn-light">로그인</a>
					</c:if>
					<c:if test="${not empty sessionScope.isLogin}">
						반갑습니다 ${sessionScope.loginId}님 
						<a class="btn btn-primary" type="button" data-bs-toggle="offcanvas" 
								data-bs-target="#memberMypage" aria-controls="memberMypage">
						  마이페이지
						</a>
						<div class="offcanvas offcanvas-end" data-bs-backdrop="static" tabindex="-1" id="memberMypage" aria-labelledby="staticBackdropLabel">
							<div class="offcanvas-header">
								<button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
							</div>
							<div class="offcanvas-body">
								<div class="text-start">
									<ul>
										<li class="p-2 m-2">
											<p class="fs-4 fw-bold">${sessionScope.loginId}님의 마이페이지</p>
										</li>
										<li class="border p-2 m-2">
											<a href="memberUpdate" data-bs-target="#staticBackdrop" 
													aria-controls="staticBackdrop">
												정보 수정
											</a>
										</li>
										<li class="border p-2 m-2">
											<a href="myAuctionList?id=${sessionScope.loginId}&option=bid" data-bs-target="#staticBackdrop" 
													aria-controls="staticBackdrop">
												응찰 목록
											</a>
										</li>	
										<li class="border p-2 m-2">
											<a href="myAuctionList?id=${sessionScope.loginId}&option=exhibit" data-bs-target="#staticBackdrop" 
													aria-controls="staticBackdrop">
												출품 목록
											</a>
										</li>	
										<li class="border p-2 m-2">
											<a href="" data-bs-target="#staticBackdrop" 
													aria-controls="staticBackdrop">
												관심 목록
											</a>
										</li>	
										<li class="border p-2 m-2">
											<a href="" data-bs-target="#staticBackdrop" 
													aria-controls="staticBackdrop">
												회원 탈퇴
											</a>
										</li>	
									</ul>
								</div>
							</div>
						</div>
					
					
						<c:if test="${sessionScope.type eq 'admin'}">
							<a class="btn btn-primary" type="button" data-bs-toggle="offcanvas" 
									data-bs-target="#staticBackdrop" aria-controls="staticBackdrop">
							  관리자메뉴
							</a>
							<div class="offcanvas offcanvas-start" data-bs-backdrop="static" tabindex="-1" id="staticBackdrop" aria-labelledby="staticBackdropLabel">
								<div class="offcanvas-header">
									<h5 class="offcanvas-title" id="staticBackdropLabel">관리자 메뉴</h5>
									<button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
								</div>
								<div class="offcanvas-body">
									<div class="text-start">
										<span class="fs-4 fw-bold p-2">관리자 리스트</span>
										<ul>
											<li class="border p-2 m-2">
												<a href="adminMemberRegister" data-bs-target="#staticBackdrop" 
														aria-controls="staticBackdrop">
													관리자 등록
												</a>
											</li>
											<li class="border p-2 m-2">
												<a href="adminMemberUpdate" data-bs-target="#staticBackdrop" 
														aria-controls="staticBackdrop">
													관리자 수정 및 해지
												</a>
											</li>	
										</ul>
										<span class="fs-4 fw-bold p-2">매출 관리</span>
										<ul>
											<li class="border p-2 m-2">
												<a href="adminCommission" data-bs-target="#staticBackdrop" 
														aria-controls="staticBackdrop">
													경매수수료 매출
												</a>
											</li>
										</ul>
										<span class="fs-4 fw-bold p-2">고객 관리</span>
										<ul>
											<li class="border p-2 m-2">
												<a href="" data-bs-target="#staticBackdrop" 
														aria-controls="staticBackdrop">
													문의내역
												</a>
											</li>
											<li class="border p-2 m-2">
												<a href="" data-bs-target="#staticBackdrop" 
														aria-controls="staticBackdrop">
													신고내역
												</a>
											</li>
										</ul>
									</div>
								</div>
							</div>
						</c:if>
						<a href="logout" class="btn btn-light">로그아웃</a>
					</c:if>
				</div>
			</div>
			
			<div id="menuHead"  class="row text-center fs-4">
				<div class="col-3">
					<a href="auctionList?period=progress" style="text-decoration:none; color:black">Auction</a>
				</div>
				<div class="col-3">
					<a href="information" style="text-decoration : none; color:black">Sell</a>
				</div>
				<div class="col-3">
					<a href="#" style="text-decoration : none; color:black">Notice</a>
				</div>
				<div class="col-3 text-end">
					<div class="dropdown-end">
						<button type="button" class="btn btn-danger dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
							Search
						</button>
						<ul class="dropdown-menu px-5 py-3">
							<li class="my-2">
								<form name="searchForm" id="searchForm" action="auctionList">
									<input type="text" name="keyword" id="keyword" placeholder="작가명 또는 작품"
											class="form-control">
								</form>
							</li>
							<li class="my-2">최근 검색어</li>
							<li><hr class="dropdown-divider"></li>
							<li>
								<span><a href="">keyword</a></span><br>
							</li>
						</ul>
					</div>
				</div>
			</div>
			
		</div>			
	</div>
	
	<div id="menuBody" class="row my-2 bg-success-subtle" style="position:absolute;">
		<div class="col-10 offset-2">
			<div class="row text-center">
				<div class="col-3">
					<ul class="list-group list-group-flush" style="">
						<li class="list-group-item list-group-item-success py-2"><a href="auctionList?period=progress">진행 경매</a></li>
						<li class="list-group-item list-group-item-success py-2"><a href="auctionList?period=upcoming">예정 경매</a></li>
						<li class="list-group-item list-group-item-success py-2"><a href="auctionList?period=expire">경매 결과</a></li>
					</ul>
				</div>
				<div class="col-3 ">
					<ul class="list-group list-group-flush" style="" >
						<li class="list-group-item list-group-item-success py-2"><a href="information">경매 과정</a></li>
						<li class="list-group-item list-group-item-success py-2"><a href="writeAuction">물건 내놓기</a></li>
						<li class="list-group-item list-group-item-success py-2"><a href="boardList">물건 구해요</a></li>
					</ul>	
				</div>
				<div class="col-3 ">							
					<ul class="list-group list-group-flush" style="">
						<li class="list-group-item list-group-item-success py-2"><a href="#">공지사항</a></li>
						<li class="list-group-item list-group-item-success py-2"><a href="#">자유게시판</a></li>
						<li class="list-group-item list-group-item-success py-2"><a href="#">1:1 문의</a></li>
						<li class="list-group-item list-group-item-success py-2"><a href="#">Q&A</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	
</div>

<style>
	a {
		text-decoration: none;
		color: black;
	}
	#menuBody > div {
		position: relative;
	}
	#menuBody > ul, li {
		margin: 0;
		padding: 0;
		list-style: none;
	}
	#menuBody, #menuBody > * {
		height: 0;
		overflow: hidden;
		z-index: 10;
	}
</style>
