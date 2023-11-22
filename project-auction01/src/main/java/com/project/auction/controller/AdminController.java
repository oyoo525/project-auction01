package com.project.auction.controller;

import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.auction.service.AuctionService;

@Controller
public class AdminController {

	@Autowired
	private AuctionService auctionService;
	
	@RequestMapping(value="adminMemberRegister")
	public String adminMemberRegister() {
		
		return "admin/adminMemberRegister";
	}
	@RequestMapping(value="adminMemberUpdate")
	public String adminMemberUpdate() {
		
		return "admin/adminMemberUpdate";
	}
	@RequestMapping(value="adminCommission")
	public String adminCommission(Model model, 
			@RequestParam(required = false, defaultValue = "1000-01-01") String startDate, 
			@RequestParam(required = false, defaultValue = "1000-01-01") String endDate) {
		
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	    LocalDate localStartDate = LocalDate.parse(startDate, formatter);
	    java.sql.Date sqlStartDate = java.sql.Date.valueOf(localStartDate); 
	    LocalDate localEndDate = LocalDate.parse(endDate, formatter);
	    java.sql.Date sqlEndDate = java.sql.Date.valueOf(localEndDate);
		
		model.addAttribute("auctionList", auctionService.getCommissionList(sqlStartDate, sqlEndDate));
		
		return "admin/adminCommission";
	}
	
	
}
