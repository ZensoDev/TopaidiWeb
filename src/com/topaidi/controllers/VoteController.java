package com.topaidi.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cgi.dao.VoteDao;
import com.cgi.dao.VoteDaoImpl;
import com.cgi.model.Vote;


@Controller
@RequestMapping("/votes")
public class VoteController {
	@Autowired
	VoteDao vDao;
	
	/*
	 * Method to display the top classement
	 */
	@GetMapping("/top")
	public String topClassement(Model model) {
		model.addAttribute("tops", vDao.topsClassement());
		return "classement/top";
	}
	
	/*
	 * Method to display the buzz classement
	 */
	@GetMapping("/buzz")
	public String buzzClassement(Model model) {
		//List<Vote> voteBuzzList = ((VoteDaoImpl) vDaoImpl).buzzClassement();
		List<Vote> voteBuzzList = ((VoteDaoImpl) vDao).buzzClassement();
		model.addAttribute("buzz", voteBuzzList);
		return "classement/buzz";
	}
	
	// faire le get et dans jsp bouton top, flop ou rien quand par défaut
//	@PostMapping("/add")
//	public String add(Model model) {
//		List<Vote> voteBuzzList = vDaoImpl.buzzClassment();
//		model.addAttribute("tops", voteBuzzList);
//		return "redirect:/ideas/list";
//	}

}
