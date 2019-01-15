package com.topaidi.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cgi.dao.CategoryDao;
import com.cgi.dao.IdeaDao;

@Controller
@RequestMapping("/welcome")
public class WelcomeController {

	@Autowired
	IdeaDao ideaDao;
	@Autowired
	CategoryDao catDao;

	@GetMapping("/welcome")
	public String home(Model m) {

		return "welcome/welcome";

	}
//	@GetMapping("/list")
//	public String listArt(Model m) {
//
//		m.addAttribute("ArtistList", aDao.findAll());
//
//		return "artist/listArtist";
//	}
//
//	@GetMapping("/add")
//	public String insertArt(Model m) {
//
//		m.addAttribute("artistform", new Artist());
//
//
//		return "artist/addArtist";
//	}
//	@GetMapping("/list")
//	public String listCD(Model m) {
//
//		m.addAttribute("CDList", cdDao.findAll());
//
//		return "cd/listCD";
//	}
//
//	@GetMapping("/add")
//	public String insertCD(Model m) {
//
//		m.addAttribute("cdform", new CD());
//		m.addAttribute("styleEnum", Estyle.values());
//		m.addAttribute("artistList", aDao.findAll());
//
//		return "cd/addCD";
//	}

}
