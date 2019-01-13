package com.topaidi.controllers;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cgi.dao.CategoryDao;
import com.cgi.dao.IdeaDao;
import com.cgi.model.Category;
import com.cgi.model.Idea;
import com.topaidi.validator.IdeaValidator;


@Controller
@RequestMapping("/ideas")
public class IdeaController {
	@Autowired
	IdeaDao ideaDao;
	//@Autowired
	//CategoryDao catDao;




@InitBinder
public void initBinder(final WebDataBinder binder){
  final SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy"); 
  binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
}


	
	@GetMapping("/list")
	public String home(Model m) {

		m.addAttribute("IdeasList", ideaDao.findAll());

		return "idea/ideaList";
	}

	@GetMapping("/add")
	public String insert(Model m) {

		m.addAttribute("ideaform", new Idea());


		return "idea/ideaAdd";
	}

	@PostMapping("/processForm")
	public String subscribe(@ModelAttribute("ideaform") Idea idea, BindingResult result, Model m) {
		new IdeaValidator().validate(idea, result);
		if (result.hasErrors()) {
			return "idea/ideaAdd";
		} else {
			if (idea.getIdIdea() == 0) {
				ideaDao.insert(idea);
			} else {
				ideaDao.update(idea);
			}
			return "redirect:/ideas/list";
		}
	}

	@GetMapping("/edit/{idIdea}")
	public String edit(@PathVariable(value = "idIdea") String idIdea, Model m) {

		Idea Idea = ideaDao.findByKey(Integer.parseInt(idIdea));
		m.addAttribute("ideaform", Idea);

		return "idea/ideaAdd";

	}
	@GetMapping("/show/{idIdea}")
	public String show(@PathVariable(value = "idIdea") String idIdea, Model m) {
		
		Idea Idea = ideaDao.findByKey(Integer.parseInt(idIdea));
		m.addAttribute("IdeaShow", Idea);
		
		return "idea/ideaIndiv";
		
	}
	
//	@GetMapping("/list/{idCat}")
//	public String edit(@PathVariable(value = "idCat") int idCat, Model m) {
//		
//		Category cat = catDao.findByKey(idCat);
//		m.addAttribute("IdeaCat", cat);
//		
//		return "idea/ideaCat";
//		
//	}
	

	@GetMapping("/delete/{idIdea}")
	public String find(Model m, @PathVariable(value = "idIdea") int idIdea) {

		ideaDao.delete(ideaDao.findByKey(idIdea));

		return "redirect:/ideas/list";
	}
	
	
}
