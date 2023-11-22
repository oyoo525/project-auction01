
	// 이미지 미리보기
	 function readURL(input) {
		  if (input.files && input.files[0]) {
		    var reader = new FileReader();
		    reader.onload = function(e) {
		      document.getElementById('preview').src = e.target.result;
		    };
		    reader.readAsDataURL(input.files[0]);
		  } else {
		    document.getElementById('preview').src = "";
		  }
	}
      
	function inputNumReplace() {
		let regExp = /[^0-9]/gi;
		if(regExp.test($(this).val())){
		alert("숫자만 입력해주세요.");
		$(this).val($(this).val().replace(regExp, ""));
		}
	}

$(function() {
	// 캐러샐 이미지 높이 조절
	$("#carousel_container, #carousel_container > *").height($("#carousel_container").width()*0.5);
	$(window).on("resize", function() {
		$("#carousel_container, #carousel_container > *").height($("#carousel_container").width()*0.5);
	});
	// 미리보기 이미지 높이 조절
	$(".image_container").height($(".image_container").width());
	$(window).on("resize", function() {
		$(".image_container").height($(".image_container").width());
	});
	
	// 시작기간 설정하기
	$("#auctionStartPeriod").on("change", function() {
		let period = $(this).val();
		let now = new Date();
		let year = now.getFullYear();
		let month = now.getMonth() + 1;
		let date = now.getDate();
		let hour= String(now.getHours()).padStart(2, "0");
		let minute = String(now.getMinutes()).padStart(2, "0");
		let currentTime = year + "-" + month + "-" + date + "T" + hour + ":" + minute;
		
		console.log(currentTime);
		
		$.ajax({
			"url" : "getEndDate", 
			"data" : {startDate : currentTime,
						period : period}, 
			"type" : "post", 
			"dataType" : "json",
			"success" : function(resData) {
				console.log(resData);
				$("#startDate").val(resData.endDate);
				
			},
			"error" : function(xhr, status, err) {
				console.log("err");				
			}
		});
	});
	// 마감기간 설정하기
	$("#auctionEndPeriod").on("change", function() {
		if($("#startDate").val().length <= 0) {
			alert("시작일을 먼저 설정해주세요.");
			return fasle;
		}	
	
		let period = $(this).val();
		let startDate = $("#startDate").val();
		console.log(startDate);
		
		$.ajax({
			"url" : "getEndDate", 
			"data" : {startDate : startDate,
						period : period}, 
			"type" : "post", 
			"dataType" : "json",
			"success" : function(resData) {
				console.log(resData);
				$("#endDate").val(resData.endDate);
				
			},
			"error" : function(xhr, status, err) {
				console.log("err");				
			}
		});
	});
	
	// 출품신청서 서브밋
	$("#startPrice").on("keyup", inputNumReplace);
	$("#auctionApplicationForm").on("submit", function() {
		if($("#name").val().length <= 0) {
			$("#name").focus();
			return false;
		}
		if($("#content").val().length <= 0) {
			$("#content").focus();
			return false;
		}
		if($("#startPrice").val().length <= 0) {
			$("#startPrice").focus();
			return false;
		}
		if($("#auctionPeriod").val().length <= 0) {
			alert("진행기간을 선택해주세요.");
			$("#auctionPeriod").focus();
			return false;
		}
		if($("#img").val().length <= 0) {
			alert("사진을 업로드해주세요.");
			$("#img").focus();
			return false;
		}
		
		console.log($("#startDate").val());
		console.log($("#endDate").val());
	});
	
	// 응찰버튼 누르기
	$("#bidBtn").on("click",function(){
		if($("#startPrice").val().length <= 0) {
			alert("응찰금액을 입력해주세요");
			$("#startPrice").focus();
			return false;
		}
		
		let count = $("#count").val();
		if(count == "0") {
		    if(Number($("#startPrice").val()) <= Number($("#realStartPrice").val()) - 1){
		        alert("응찰가는 현재가보다 높아야합니다.");
		        $("#startPrice").focus();
		        return false;
		    }
		}
		if(count != "0") {
		    if(Number($("#startPrice").val()) <= Number($("#currentPrice").val())){
		        alert("응찰가는 현재가보다 높아야합니다.");
		        $("#startPrice").focus();
		        return false;
		    }
		}
	
		
	
		let bidPrice = $("#startPrice").val();
		
		$.ajax({
			"url" : "bid",
			"data" : {no : $("#no").val(),
						buyer : $("#buyer").val(),
						endPrice : bidPrice},
			"type" : "post",
			"dataType" : "json",
			"success" : function(resData) {
				console.log(resData);
				
				let endPrice = resData.auction.endPrice;
				$("#currentPrice").val(endPrice);
				console.log(endPrice);
				endPrice = endPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
				
				$("#endPrice").val(endPrice);
				$("#count").val(resData.auction.count);
				
				let buyer = resData.auction.buyer;
				$("#upcBuyer").empty();
				$("#upcBuyer").append(buyer);
			
				$("#startPrice").val("");
			},
			"error" : function(xhr, status, err) {
				console.log("err");
			}
		});
		return false;	
	});
	
	// 게시글 서브밋
	$("#findBoard").on("submit", function() {
		if($("#title").val().length <= 0) {
			$("#title").focus();
			return false;
		}
		if($("#content").val().length <= 0) {
			$("#content").focus();
			return false;
		}
	});
	
	// 게시글 댓글달기
	$(document).on("submit", "#replyForm", function() {
		if($("#content").val().length <= 0) {
			$("#content").focus();
			return false;
		}
		
		$.ajax({
			"url" : "insertReply.ajax", 
			"data" : {id : $("#id").val(),
						content : $("#content").val(),
						boardNo : $("#boardNo").val()},
			"type" : "post", 
			"dataType" : "json", 
			"success" : function(resData) {
				console.log(resData);
				
				$("#replyList > .col").empty();	
				// 댓글 반복
				$.each(resData , function(index, data) {
					
					let date = new Date(data.regDate);
					let strDate = date.getFullYear() + "-" 
									+ (date.getMonth() + 1 < 10 ? 
											"0" + (date.getMonth() + 1) : (date.getMonth() + 1)) + "-" 
									+ (date.getDate() + 1 < 10 ? 
											"0" + (date.getDate() + 1) : (date.getDate() + 1)) + " "
									+(date.getHours() + 1 < 10 ? 
											"0" + (date.getHours() + 1) : (date.getHours() + 1)) + ":"
									+(date.getMinutes() + 1 < 10 ? 
											"0" + (date.getMinutes() + 1) : (date.getMinutes() + 1)) + ":"
									+(date.getSeconds() + 1 < 10 ? 
											"0" + (date.getSeconds() + 1) : (date.getSeconds() + 1));	
					
					let result = 
									 '<div class="row border-bottom p-3">'
					 				+'	<div class="col">'
									+'		<div class="row">'
									+'			<div class="col">'
									+'				<p class="fw-bold">'+ data.id+'</p>'
									+'			</div>'
									+'		</div>'
									+'		<div class="row">'
									+'			<div class="col">'
									+'				<p>' + data.content + '</p>'
									+'				<p>' + strDate + '</p>'
									+'			</div>'
									+'			<div class="col text-end">'
									+'				<input type="button" value="수정" class="modifyReplyBtn" data-no="' + data.no + '">'
									+'				<input type="button" value="삭제" class="deleteReplyBtn" data-no="' + data.no + '">'
									+'			</div>'
									+'		</div>'									
									+'	</div>'
									+'</div>'
					
					$("#replyList > .col").append(result);
					$("#content").val("");
				});
			},
			"error" : function(xhr, status, err) {
				console.log("Err");
			}
		
		});
		
		return false;
	});
	
	// 조회조건 설정하기
	$("#printType").on("change", function() {
		let printType = $(this).val();
		let period = $("#period").val();
		let keyword = $("#keyword").val();
		let pageNum = $("#pageNum").val();
		
		let path ="auctionList?printType=" + printType + 
							"&period=" + period + 
							"&keyword=" + keyword +
							"&pageNum" + pageNum;
							
		location.href=path;

	});
	
	// 댓글수정버튼 클릭
	$(document).on("click", ".modifyReplyBtn", function() {
		$(".replyForm").attr("id", "updateReplyForm");
		let no = $(this).data("no");
		let reply = $(this).parent().prev().children(":first-child").text();

		$("#no").val(no);
		$("#content").val(reply).focus();
	});
	// 댓글 수정하기 process
	$(document).on("submit", "#updateReplyForm", function() {
		let no = $("#no").val()
		let id = $("#id").val()
		let content = $("#content").val()
		let boardNo = $("#boardNo").val()

		$.ajax({
			"url" : "updateReply.ajax",
			"data" : {"no" : no,
						"id" : id,
						"content" : content,
						"boardNo" : boardNo},
			"type" : "post", 
			"dataType" : "json", 
			"success" : function(resData) {
				console.log(resData);
				
				$("#replyList > .col").empty();	
				// 댓글 반복
				$.each(resData , function(index, data) {
					
					let date = new Date(data.regDate);
					let strDate = date.getFullYear() + "-" 
									+ (date.getMonth() + 1 < 10 ? 
											"0" + (date.getMonth() + 1) : (date.getMonth() + 1)) + "-" 
									+ (date.getDate() + 1 < 10 ? 
											"0" + (date.getDate() + 1) : (date.getDate() + 1)) + " "
									+(date.getHours() + 1 < 10 ? 
											"0" + (date.getHours() + 1) : (date.getHours() + 1)) + ":"
									+(date.getMinutes() + 1 < 10 ? 
											"0" + (date.getMinutes() + 1) : (date.getMinutes() + 1)) + ":"
									+(date.getSeconds() + 1 < 10 ? 
											"0" + (date.getSeconds() + 1) : (date.getSeconds() + 1));	
					
					let result = 
									 '<div class="row border-bottom p-3">'
					 				+'	<div class="col">'
									+'		<div class="row">'
									+'			<div class="col">'
									+'				<p class="fw-bold">'+ data.id+'</p>'
									+'			</div>'
									+'		</div>'
									+'		<div class="row">'
									+'			<div class="col">'
									+'				<p>' + data.content + '</p>'
									+'				<p>' + strDate + '</p>'
									+'			</div>'
									+'			<div class="col text-end">'
									+'				<input type="button" value="수정" class="modifyReplyBtn" data-no="' + data.no + '">'
									+'				<input type="button" value="삭제" class="deleteReplyBtn" data-no="' + data.no + '">'
									+'			</div>'
									+'		</div>'									
									+'	</div>'
									+'</div>'
					
					$("#replyList > .col").append(result);
				});
			
				$("#content").val("");
			},
			"error" : function(xhr, status, err) {
				console.log("Err");
			}
		});
		return false;
	});
	// 댓글삭제버튼 클릭
	$(document).on("click", ".deleteReplyBtn", function() {
		let no = $(this).data("no");
		let boardNo = $("#boardNo").val()
		
		$.ajax({
			"url" : "deleteReply.ajax",
			"data" : {"no" : no,
						"boardNo" : boardNo},
			"type" : "post",
			"dataType" : "json", 
			"success" : function(resData) {
				console.log(resData);
				
				$("#replyList > .col").empty();	
				// 댓글 반복
				$.each(resData , function(index, data) {
					
					let date = new Date(data.regDate);
					let strDate = date.getFullYear() + "-" 
									+ (date.getMonth() + 1 < 10 ? 
											"0" + (date.getMonth() + 1) : (date.getMonth() + 1)) + "-" 
									+ (date.getDate() + 1 < 10 ? 
											"0" + (date.getDate() + 1) : (date.getDate() + 1)) + " "
									+(date.getHours() + 1 < 10 ? 
											"0" + (date.getHours() + 1) : (date.getHours() + 1)) + ":"
									+(date.getMinutes() + 1 < 10 ? 
											"0" + (date.getMinutes() + 1) : (date.getMinutes() + 1)) + ":"
									+(date.getSeconds() + 1 < 10 ? 
											"0" + (date.getSeconds() + 1) : (date.getSeconds() + 1));	
					
					let result = 
									 '<div class="row border-bottom p-3">'
					 				+'	<div class="col">'
									+'		<div class="row">'
									+'			<div class="col">'
									+'				<p class="fw-bold">'+ data.id+'</p>'
									+'			</div>'
									+'		</div>'
									+'		<div class="row">'
									+'			<div class="col">'
									+'				<p>' + data.content + '</p>'
									+'				<p>' + strDate + '</p>'
									+'			</div>'
									+'			<div class="col text-end">'
									+'				<input type="button" value="수정" class="modifyReplyBtn" data-no="' + data.no + '">'
									+'				<input type="button" value="삭제" class="deleteReplyBtn" data-no="' + data.no + '">'
									+'			</div>'
									+'		</div>'									
									+'	</div>'
									+'</div>'
					
					$("#replyList > .col").append(result);
				});
			},
			"error" : function(xhr, status, err) {
				console.log("err");
			}
		
		});
		return false;
	});
	
	// 검색키워드 인서트하기
	$("#searchForm").on("submit", function() {
		let id = $("#id").val();
		let keyword = $("#keyword").val();
		
		$.ajax({
			
		
		});
		
	
	});
	
	

});