<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<div class="container">

	<!-- content -->
	<!-- 캐러샐 -->
	<div class="row my-5">
		<div class="col">
			<div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
				<div id="carousel_container" class="carousel-inner" style="overflow:hidden">
					<div class="carousel-item active justify-content-center border p-3" data-bs-interval="3000">
						<a href="">
							<img src="resources/img/auto-3298890_1280.jpg" class="d-block w-100" alt="...">
						</a>
					</div>
					<div class="carousel-item justify-content-center border p-3" data-bs-interval="3000">
						<a href="">
							<img src="resources/img/cathedral-8318952_1280.jpg" class="d-block w-100 h-100" alt="...">
						</a>
					</div>
					<div class="carousel-item justify-content-center border p-3">
						<a href="">
							<img src="resources/img/clocks-6664622_1280.jpg" class="d-block w-100" alt="..." style=" object-fit: cover; ">
						</a>
					</div>
				</div>
				<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
			</div>
		</div>
	</div>
	<!-- 경매리스트 -->
	<div class="row">
		<div class="col">
			<h2>진행중인 경매</h2>
		</div>
	</div>
	<div class="row my-5">
		<div class="col">
			<div class="row row-cols-1 row-cols-md-2 row-cols-lg-4 g-4">
				<c:forEach var="atList" items="${proList}" begin="0" end="7">
					<a href="detail?no=${atList.no}">
						<div class="col mainImg">
							<div class="image_container bg-secondary-subtle p-2" style="position: relative;">
								<div class="image_container" style="position: absolute; position: relative; text-align:center;"
										data-no="${atList.no}">
									<img src="resources/upload/${atList.img}" alt="${atList.name}" 
											style="width:100%; height:100%; object-fit:cover;">
								</div>
							</div>
						</div>
					</a>
				</c:forEach>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col text-center">
			<a href="auctionList?period=progress" class="btn btn-light">전체보기</a>
		</div>
	</div>	
	<div class="row">
		<div class="col">
			<h2>예정중인 경매</h2>
		</div>
	</div>
	<div class="row my-5">
		<div class="col">
			<div class="row row-cols-1 row-cols-md-2 row-cols-lg-4 g-4">
				<c:forEach var="atList" items="${upcList}" begin="0" end="7">
					<a href="detail?no=${atList.no}">
						<div class="col mainImg">
							<div class="image_container bg-secondary-subtle p-2" style="position: relative;">
								<div class="image_container" style="position: absolute; position: relative; text-align:center;"
										data-no="${atList.no}">
									<img src="resources/upload/${atList.img}" alt="${atList.name}" 
											style="width:100%; height:100%; object-fit:cover;">
								</div>
							</div>
						</div>
					</a>
				</c:forEach>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col text-center">
			<a href="auctionList?period=upcoming" class="btn btn-light">전체보기</a>
		</div>
	</div>	
</div>
