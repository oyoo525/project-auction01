package com.project.auction.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.project.auction.domain.Auction;
import com.project.auction.domain.FindBoard;
import com.project.auction.domain.Reply;
import com.project.auction.service.AuctionService;

@Controller
public class AuctionController {

	@Autowired
	private AuctionService auctionService;
	
	private static final String DEFAULT_PATH = "/resources/upload/";
	
	@RequestMapping(value="/main")
	public String mainPage(Model model) {
		// 진행중인 경매
		String printType = "new";
		String period = "progress";
		String keyword = "null";
		int pageNum = 1;
		int pageSize = 8;
		Map<String,Object> modelMap = auctionService.getAuctionList(printType, period, keyword, pageNum, pageSize);
		List<Auction> proList = (List<Auction>)modelMap.get("atList"); 
		model.addAttribute("proList", proList);
		// 예정중인 경매
		period = "upcoming";
		modelMap = auctionService.getAuctionList(printType, period, keyword, pageNum, pageSize);
		List<Auction> upcList = (List<Auction>)modelMap.get("atList"); 
		model.addAttribute("upcList", upcList);
		
		return "main";
	}
	
	// 경매품 상세보기
	@RequestMapping(value="/auctionDetail")
	public String register(Model model, int no) {
		model.addAttribute("auction", auctionService.getAuction(no));
		return "auction/auctionDetail";
	}
	@RequestMapping(value="/detail")
	public String register2(Model model, int no, String period, String keyword) {
		model.addAttribute("auction", auctionService.getAuction(no));
		model.addAttribute("period", period);
		model.addAttribute("keyword", keyword);
		return "auction/detail";
	}
	
	// 경매리스트 출력
	@RequestMapping(value="/auctionList")
	public String progress(Model model, 
			@RequestParam(defaultValue="new", required=false) String printType,
			@RequestParam(defaultValue="progress", required=false) String period, 
			@RequestParam(defaultValue="null", required=false) String keyword,
			@RequestParam(defaultValue="1", required=false) int pageNum) {
		int pageSize = 12;
		model.addAllAttributes(auctionService.getAuctionList(printType, period, keyword, pageNum, pageSize));
		return "auction/auctionList";
	}

	
	// 출품신청서 폼으로 접속
	@RequestMapping(value="/writeAuction")
	public String application2(Model model) {
		// 현재 시간 구하기
		LocalDateTime currentTime = LocalDateTime.now();
		LocalDateTime tomorrowTime = currentTime.plusDays(1);
		
		DateTimeFormatter dateFormat = DateTimeFormatter.ofPattern("yyyy-MM-dd 00:00");
		String formatTomorrowTime = tomorrowTime.format(dateFormat);
		
		model.addAttribute("formatTomorrowTime", formatTomorrowTime);
		
		return "auction/writeAuction";
	}
	
	// 출품기간 설정하기
	@RequestMapping(value="getEndDate", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> auctionPeriod(String startDate, int period) {
		// 시작일자 포맷하기
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
		LocalDateTime formatTomorrowTime = LocalDateTime.parse(startDate, formatter);
		// 마감일자 포맷하기
		LocalDateTime endDate = formatTomorrowTime.plusDays(period);
		DateTimeFormatter dateFormat = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'00:00");
		String formatEndDate = endDate.format(dateFormat);
		
		Map<String, String> param = new HashMap<>();
		param.put("endDate", formatEndDate);
		
		return param;
	}
	
	// 경매물품 등록하기
	@RequestMapping(value="writeAuction", method=RequestMethod.POST)
	public String insertAuction(String id, String name, String content,
							String startDate, String endDate, int startPrice, 
							@RequestParam(value="img") MultipartFile multi, 
							HttpServletRequest request) throws IOException  {
		Auction at = new Auction();
		at.setId(id);
		at.setName(name);
		at.setContent(content);
		
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
		
		LocalDateTime localStartDate = LocalDateTime.parse(startDate, formatter);
		Date sqlStartDate = Date.valueOf(localStartDate.toLocalDate()); 
		at.setStartDate(sqlStartDate);
		
		LocalDateTime localEndDate = LocalDateTime.parse(endDate, formatter);
		Date sqlEndDate = Date.valueOf(localEndDate.toLocalDate()); 
		at.setEndDate(sqlEndDate);

		at.setStartPrice(startPrice);
		
		String filePath = request.getServletContext().getRealPath(DEFAULT_PATH);
		UUID uid = UUID.randomUUID();
		String saveName = uid.toString() + "_" + multi.getOriginalFilename();
		File file = new File(filePath, saveName);
		multi.transferTo(file);
		at.setImg(saveName);
		
		auctionService.insertAuction(at);
		
		return "redirect:main";
	}
	
	// 경매수정폼으로 이동하기
	@RequestMapping(value="updateAuction")
	public String auctionModify(Model model, int no) {
		Auction auction = auctionService.getAuction(no);
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String startDate = format.format(auction.getStartDate());
        String endDate = format.format(auction.getEndDate());
		
		model.addAttribute("auction", auction);
		model.addAttribute("startDate", startDate);
		model.addAttribute("endDate", endDate);
		
		return "auction/auctionModify";
	}
	
	// 옥션 수정폼 서브밋
	@RequestMapping(value="updateAuction", method=RequestMethod.POST)
	public String updateAuction(Model model, int no, String name, String content, 
							String startDate, String endDate,
							int startPrice, @RequestParam(value="img", required=false) MultipartFile multi, 
							HttpServletRequest request) throws IOException {
		Auction at = new Auction();
		at.setNo(no);
		at.setName(name);
		at.setContent(content);
		
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
		
		LocalDateTime localStartDate = LocalDateTime.parse(startDate, formatter);
		Date sqlStartDate = Date.valueOf(localStartDate.toLocalDate()); 
		at.setStartDate(sqlStartDate);
		
		LocalDateTime localEndDate = LocalDateTime.parse(endDate, formatter);
		Date sqlEndDate = Date.valueOf(localEndDate.toLocalDate()); 
		at.setEndDate(sqlEndDate);

		at.setStartPrice(startPrice);
		
		if(!multi.isEmpty()) {
			String filePath = request.getServletContext().getRealPath(DEFAULT_PATH);
			UUID uid = UUID.randomUUID();
			String saveName = uid.toString() + "_" + multi.getOriginalFilename();
			File file = new File(filePath, saveName);
			multi.transferTo(file);
			at.setImg(saveName);
		}
		// sql 업데이트
		auctionService.updateAuction(at);
		// auction 정보 가져오기
		model.addAttribute("auction", auctionService.getAuction(no));
		return "redirect:detail?no=" + no;
	}
	
	// 옥션 삭제하기
	@RequestMapping("deleteAuction")
	public String deleteAuction(int no) {
		auctionService.deleteAuction(no);
		return  "redirect:main";
	}
	
	// 응찰하기
	@RequestMapping(value="bid", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> bid(int no, String buyer, int endPrice) {
		auctionService.bid(no, buyer, endPrice);
		
		Map<String, Object> params = new HashMap<>();
		params.put("auction", auctionService.getAuction(no));
		
		return params;
	}
			
	@RequestMapping("boardList")
	public String boardList(Model model,
					@RequestParam(required=false, defaultValue="null") String id, 
					@RequestParam(required=false, defaultValue="null") String keyword) {
		model.addAttribute("boardList", auctionService.getBoardList(id, keyword));
		model.addAttribute("id", id);
		model.addAttribute("keyword", keyword);
		return "board/boardList";
	}
	
	@RequestMapping("boardDetail")
	public String boardDetail(Model model, int no) {
		model.addAttribute("board", auctionService.getBoard(no));
		model.addAttribute("replyList", auctionService.getReplyList(no));
		
		return "board/boardDetail";
	}
	
	
	// 물건찾기 작성폼으로 이동
	@RequestMapping("writeBoard")
	public String findNotice() {
		return "board/writeBoard";
	}
	
	// 글 등록하기
	@RequestMapping(value="insertFindBoard", method=RequestMethod.POST)
	public String insertFindBoard(FindBoard board) {
		auctionService.insertBoard(board);
		return "redirect:boardList";
	}
	
	// 게시판 수정폼으로 이동
	@RequestMapping("updateBoard")
	public String updateBoard(Model model, int no) {
		model.addAttribute("board", auctionService.getBoard(no));
		return "board/updateBoard";
	}
	// 게시글 수정하기
	@RequestMapping(value="updateFindBoard", method=RequestMethod.POST)
	public String updateFindBoard(Model model, FindBoard board) {
		auctionService.updateBoard(board);
		model.addAttribute("board", auctionService.getBoard(board.getNo()));
		return "redirect:boardDetail?no=" + board.getNo(); 
	}
	// 게시글 삭제하기
	@RequestMapping("deleteBoard")
	public String deleteFindBoard(int no) {
		auctionService.deleteBoard(no);
		return "redirect:boardList";
	}
	
	// 댓글 달기
	@RequestMapping(value="insertReply.ajax", method=RequestMethod.POST)
	@ResponseBody
	public List<Reply> insertReply(String id, String content, int boardNo) {
		// 댓글 인서트 하기  
		Reply re = new Reply(); 
		re.setId(id); 
		re.setContent(content);
		re.setBoardNo(boardNo); 
		auctionService.insertReply(re);
		 // 댓글 리스트 가져오기 
		 return auctionService.getReplyList(boardNo);
	}

	// 댓글 수정하기
	@RequestMapping(value="updateReply.ajax", method=RequestMethod.POST)
	@ResponseBody
	public List<Reply> updateReply(int no, String id, String content, int boardNo) {
		// 댓글 업데이트하기
		Reply re = new Reply(); 
		re.setId(id); 
		re.setContent(content);
		re.setBoardNo(boardNo); 
		re.setNo(no);
		auctionService.updateReply(re);
		// 댓글 리스트 가져오기 
		return auctionService.getReplyList(boardNo);
	}

	// 댓글 삭제하기
	@RequestMapping(value="deleteReply.ajax", method=RequestMethod.POST)
	@ResponseBody
	public List<Reply> deleteReply(int no, int boardNo) {
		// 댓글 삭제하기
		auctionService.deleteReply(no);
		// 댓글 리스트 가져오기 
		return auctionService.getReplyList(boardNo);
	}
	
	// 내 응찰목록 보기
	@RequestMapping("myAuctionList")
	public String getMyAuctionList(Model model, String id, String option, HttpServletRequest request) {
		model.addAttribute("bidList", auctionService.getMyAuctionList(id, option));
		model.addAttribute("option", option);
		request.setAttribute("bidList", auctionService.getMyAuctionList(id, option));
		return "member/myAuctionList";
	}
	
	
	// 경매과정 안내페이지
	@RequestMapping("information")
	public String information() {
		return "auction/information";
	}
	
}
