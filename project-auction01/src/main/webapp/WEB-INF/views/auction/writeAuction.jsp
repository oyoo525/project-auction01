<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- content -->
	<form name="writeAuctionForm" id="writeAuctionForm" 
			action="writeAuction" method="post" enctype="multipart/form-data"
			class="row my-5">
		<input type="hidden" name="id" id="id" value="${sessionScope.loginId}">
		<div class="col my-5 py-5 bg-secondary" style="--bs-bg-opacity: .7;">
			<div class="row">
				<div class="col offset-2">
					<h2 class="text-light fs-1 fw-bold">출품신청서</h2>
				</div>
			</div>
		</div>
		<div class="row row-cols-1 row-cols-sm-1 row-cols-md-1 row-cols-lg-2">
			<div class="col-6">
				<div class="row">
					<div class="image_container col-10 offset-1 card p-2 mb-5" 
							style="display:flex; justify-content:center; align-items:center;">
						<img id="preview" style="max-width:100%; max-height:100%; object-fit:cover;">
					</div>				
				</div>
			</div>
			<div class="col-6">
				<div class="row">
					<div class="col-10 offset-1">
						<div class="row">
							<label for="name" class="form-label">출품명</label>
							<div class="col px-5 my-2">
								<input type="text" name="name" id="name" class="form-control">
							</div>
						</div>
						<div class="row">
							<label for="content" class="form-label">출품 설명</label>
							<div class="col px-5 my-2">
								<textarea name="content" id="content" rows="8"
											class="form-control"></textarea>
							</div>
						</div>
						<div class="row">
							<label for="startPrice" class="form-label">시작가</label>
							<div class="col px-5 my-2">
								<input type="text" name="startPrice" id="startPrice" class="form-control">
							</div>
						</div>
						<div class="row">
							<label for="startDate" class="form-label">시작일
							<span class="text-danger text-end">(시작일 이후에는 수정/삭제가 불가능합니다.)</span></label>
							<div class="col-12 px-5 my-2">
								<select id="auctionStartPeriod" class="form-select">
									<option value="" selected hidden>-기간 선택-</option>
									<option value="1">1일</option>
									<option value="3">3일</option>
									<option value="7">7일</option>
								</select>
							</div>
							<div class="col-12 px-5 my-2">
								<input type="datetime-local" name="startDate" id="startDate" 
										class="form-control" readonly>
							</div>
						</div>
						<div class="row">
							<label for="endDate" class="form-label">마감일</label>
							<div class="col-12 px-5 my-2">
								<select id="auctionEndPeriod" class="form-select">
									<option value="" selected hidden>-기간 선택-</option>
									<option value="7">7일</option>
									<option value="15">15일</option>
									<option value="30">30일</option>
								</select>
							</div>
							<div class="col-12 px-5 my-2">
								<input type="datetime-local" name="endDate" id="endDate" 
										class="form-control" readonly>
							</div>
						</div>
						<div class="row">
							<label for="img" class="form-label">사진</label>
							<div class="col px-5 my-2">
								<input type="file" name="img" id="img" class="form-control" required
										accept="image/*" onchange="readURL(this);">
							</div>
						</div>
						<div class="row">
							<div class="col my-5 text-center">
								<input type="submit" value="등록하기" class="btn btn-secondary">
							</div>
						</div>			
					</div>
				</div>
			</div>
		</div>
	</form>
	