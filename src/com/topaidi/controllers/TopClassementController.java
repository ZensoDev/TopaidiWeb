package com.topaidi.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cgi.dao.BuzzDao;
import com.cgi.dao.IdeaDao;
import com.cgi.dao.TopDao;
import com.cgi.model.Idea;

@Controller
@RequestMapping("/classement")
public class TopClassementController {
	@Autowired
	TopDao tDao;
	
	@Autowired
	BuzzDao bDao;
	
	
		/*
	 * Method to display the top classement
	 */
	@GetMapping("/top")
	public String topsClassement(Model model) {
		
		model.addAttribute("tops", tDao.topRanking());
		return "classement/top";
	}

}
