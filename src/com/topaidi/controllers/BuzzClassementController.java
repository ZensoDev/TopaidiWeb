package com.topaidi.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cgi.dao.BuzzDao;
import com.cgi.dao.IdeaDao;

@Controller
@RequestMapping("/classement")
public class BuzzClassementController {
	@Autowired
	BuzzDao bDao;

	/*
	 * Method to display the buzz classement
	 */
	@GetMapping("/buzz")
	public String buzzClassement(Model model) {
		model.addAttribute("buzz", bDao.buzzClassement());
		return "classement/buzz";
	}

}
