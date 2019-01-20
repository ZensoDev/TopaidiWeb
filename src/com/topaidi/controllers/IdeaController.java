package com.topaidi.controllers;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
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
import com.cgi.dao.CommentDao;
import com.cgi.dao.IdeaDao;
import com.cgi.dao.MemberDao;
import com.cgi.model.Category;
import com.cgi.model.Comment;
import com.cgi.model.Idea;
import com.cgi.model.Member;
import com.topaidi.validator.IdeaValidator;

@Controller
@RequestMapping("/ideas")
@Transactional
public class IdeaController {
	@Autowired
	IdeaDao ideaDao;

	@Autowired
	CategoryDao catDao;

	@Autowired
	CommentDao comDao;
	
	@Autowired
	MemberDao mDao;

	@GetMapping("/list")
	public String home(Model m) {

		m.addAttribute("IdeasList", ideaDao.findAll());

		return "idea/ideaList";
	}

	@GetMapping("/add")
	public String insert(HttpSession session, Model m) {
		if(session.getAttribute("member") == null) {
			return "redirect:/members/connect";
		}
		
		Member member = (Member) session.getAttribute("member");

		m.addAttribute("ideaform", new Idea());
		m.addAttribute("categories", catDao.findAll());

		return "idea/ideaAdd";
	}

	@PostMapping("/processForm")
	public String subscribe(@ModelAttribute("ideaform") Idea idea, BindingResult result, HttpSession session, Model m) {
		
		new IdeaValidator().validate(idea, result);
		Member member =mDao.findByKey(((Member) session.getAttribute("member")).getIdMember());
		
		idea.setMember(member);
		m.addAttribute("categories", catDao.findAll());
		
		System.out.println(idea);
		
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
	public String edit(@PathVariable(value = "idIdea") String idIdea, HttpSession session, Model m) {

		Member member = (Member) session.getAttribute("member");
		Idea Idea = ideaDao.findByKey(Integer.parseInt(idIdea));
		
		if (member.isAdmin()) {
		m.addAttribute("ideaform", Idea);

		return "idea/ideaAdd";} 
		
		else {return "noadmin";
			}
		

	}

	@GetMapping("/show/{idIdea}")
	public String showIdea(@PathVariable(value = "idIdea") String idIdea, Model m) {
		Comment com = new Comment();
		Idea idea = ideaDao.findByKey(Integer.parseInt(idIdea));
		com.setIdea(idea);
		m.addAttribute("IdeaShow", idea);

		return "idea/ideaIndiv";

	}

	@GetMapping("/list/{idCat}")
	public String showIdeaCat(@PathVariable(value = "idCat") int idCat, Model m) {

		Category cat = catDao.findByKey(idCat);

		m.addAttribute("IdeaCat", cat);

		return "idea/ideaCat";

	}

	@GetMapping("/delete/{idIdea}")
	public String find(Model m, @PathVariable(value = "idIdea") int idIdea, HttpSession session) {

		Member member = (Member) session.getAttribute("member");

		if (member.isAdmin()) {
			ideaDao.delete(ideaDao.findByKey(idIdea));

			return "redirect:/ideas/list";

		} else {
			return "noadmin";

		}
	}

}
