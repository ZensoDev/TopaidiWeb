package com.topaidi.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminGestionController {
	
	@GetMapping("/gestion")
	public String home() {

		return "include/adminPage";

	}

}
