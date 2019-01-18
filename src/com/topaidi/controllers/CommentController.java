package com.topaidi.controllers;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cgi.dao.CommentDao;
import com.cgi.dao.IdeaDao;
import com.cgi.dao.MemberDao;
import com.cgi.model.Comment;
import com.cgi.model.Idea;
import com.cgi.model.Member;
import com.topaidi.validator.CommentValidator;

@Controller
@Transactional
@RequestMapping("/comment")
public class CommentController {

	@Autowired
	CommentDao comDao;
	
	@Autowired
	IdeaDao iDao;
	
	@Autowired
	MemberDao mDao;
	
	@GetMapping("/list/{idIdea}")
	public String list(Model model, @PathVariable(value = "idIdea") int id) {
		Idea idea = iDao.findByKey(id);
		model.addAttribute("idea", idea); //utiliser dans la jsp idea.comments
		return "comment/comList";
	}
	
	@GetMapping("/insert/{idIdea}")
	public String insert(Model model, @PathVariable(value = "idIdea") int idIdea, HttpSession session) {
		//Member member = mDao.findByKey(Integer.parseInt(session.getId()));
		Member member = (Member) session.getAttribute("member");
		Idea idea = iDao.findByKey(idIdea);
		Comment com = new Comment();

		//com.setMember(member);
		com.setIdea(idea); 
		model.addAttribute("comform", com);
		return "comment/comForm";
	}
	
	@PostMapping("/processForm")
	public String insertComment(Model model, @ModelAttribute("comform") Comment com, HttpSession session,BindingResult result) {
		new CommentValidator().validate(com, result);

		Member member = (Member) session.getAttribute("member");
		if (result.hasErrors()) {
			return "comForm";
		} else {
			if (com.getIdCom() == 0) {
				comDao.insert(com);
			} else {
				comDao.update(com);
			}
		}
		String url = "redirect:/comment/list/"+com.getIdea().getIdIdea();
		
		return url;
	}
	
	@GetMapping("/edit/{id}")
	public String edit(Model model, @PathVariable(value = "id") int id, HttpSession session) {
		Member member = (Member) session.getAttribute("member");
		Comment com = comDao.findByKey(id);
		model.addAttribute("comform", com);

		return "comForm";
	}

	@GetMapping("/delete/{id}")
	public String delete(Model model, @PathVariable(value = "id") int id) {
		comDao.deleteByKey(id);
		return "redirect:/cd/homeCd";
	}
}
