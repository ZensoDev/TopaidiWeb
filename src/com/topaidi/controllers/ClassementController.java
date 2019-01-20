package com.topaidi.controllers;

import java.math.BigInteger;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cgi.dao.BrainsDao;
import com.cgi.dao.VoteDaoImpl;
import com.cgi.model.Idea;
import com.cgi.model.Member;

@Controller
@RequestMapping("/classement")
public class ClassementController {
	
	@Autowired
	VoteDaoImpl vDao;
	
	@Autowired
	BrainsDao brDao;
	
	
	
		/*
	 * Method to display the top classement
	 */
	@GetMapping("/top")
	public String topsClassement(Model model) {
		
		Map<Idea, BigInteger> topIdeas = vDao.topRanking();
		model.addAttribute("tops",topIdeas);
		return "classement/top";
	}
	
	@GetMapping("/buzz")
	public String buzzClassement(Model model) {
		Map<Idea, BigInteger> buzzIdeas = vDao.buzzRanking();
		model.addAttribute("buzz", buzzIdeas);
		return "classement/buzz";
	}
	
	@GetMapping("/brains")
	public String brainsShow(Model model) {
//		Member m = new Member();
		Map<Member, BigInteger> brainMembers = brDao.brainsRanking();
		
		model.addAttribute("brains",brainMembers);
		return "classement/brains";
	}

}
