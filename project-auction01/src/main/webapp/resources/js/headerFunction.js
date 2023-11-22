$(function() {

	// 메뉴 위치 맞추기
	$("#menuBody").width($("#headerTop").width());
	$(window).resize(function() {
		$("#menuBody").width($("#headerTop").width());
	});

	// 메뉴 드롭 애니메이션
	$("#menuHead").mouseover(function() { 
		$("#menuBody, #menuBody > *").stop().animate({height : "200px"}, 500);
	});
	$("#menuBody").mouseleave(function() {
		$("#menuBody, #menuBody > *").stop().animate({height : "0"}, 500);
	});
	
	$("#menuBody > a").mouseover(function(e) {
		$(e.target).css("font-weight", "bold");
	});



});