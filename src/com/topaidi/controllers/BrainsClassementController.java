package com.topaidi.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cgi.dao.BrainsDao;
import com.cgi.dao.BuzzDao;
import com.cgi.dao.IdeaDao;

@Controller
@RequestMapping("/classement")
public class BrainsClassementController {
	@Autowired
	BrainsDao brDao;

	/*
	 * Method to display the buzz classement
	 */
	@GetMapping("/brains")
	public String brainsClassement(Model model) {
		model.addAttribute("brains", brDao.brainsClassement());
		return "classement/brains";
	}

}
