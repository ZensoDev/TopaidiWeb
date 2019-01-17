package com.topaidi.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cgi.dao.IdeaDao;
import com.cgi.dao.TopDao;

@Controller
@RequestMapping("/classement")
public class TopClassementController {
	@Autowired
	TopDao tDao;

	/*
	 * Method to display the top classement
	 */
	@GetMapping("/top")
	public String topsClassement(Model model) {
		model.addAttribute("tops", tDao.topClassement());
		return "classement/top";
	}

}
