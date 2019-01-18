package com.topaidi.controllers;


import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cgi.dao.BrainsDao;
import com.cgi.model.BrainsView;
import com.cgi.model.Member;

@Controller
@RequestMapping("/classement")
public class BrainsClassementController {
	@Autowired
	BrainsDao brDao;
	
	
//	@Autowired
//	Member member;

	/*
	 * Method to display the buzz classement
	 */
	
	@GetMapping("/brains")
	public String brainsShow(Model model) {
//		Member m = new Member();
		Map<Member, BigInteger> brainMembers = brDao.brainsRanking();
		
		model.addAttribute("brains",brainMembers);
		return "classement/brains";
	}
//	@GetMapping("/brains")
//	public String brainsClassement(Model model) {
//		
//		
//		model.addAttribute("brainsMem", brDao.brainsMember());
//		return "classement/brains";
//	}

}
