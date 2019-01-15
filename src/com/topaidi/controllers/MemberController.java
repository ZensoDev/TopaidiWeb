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
import com.cgi.dao.MemberDao;
import com.cgi.model.Category;
import com.cgi.model.Idea;
import com.cgi.model.Member;
import com.topaidi.validator.IdeaValidator;
import com.topaidi.validator.MemberValidator;


@Controller
@RequestMapping("/members")
public class MemberController {
	@Autowired
	MemberDao memberDao;
	
	@Autowired
	IdeaDao ideaDao;
	
	
	@GetMapping("/list")
	public String home(Model m) {

		m.addAttribute("MembersList", memberDao.findAll());

		return "member/memberList";
	}

	@GetMapping("/add")
	public String insert(Model m) {

		m.addAttribute("memberform", new Member());

		return "member/memberAdd";
	}

	@PostMapping("/processForm")
	public String subscribe(@ModelAttribute("memberform") Member member, BindingResult result, Model m) {
		new MemberValidator().validate(member, result);
		if (result.hasErrors()) {
			return "member/memberAdd";
		} else {
			if (member.getIdMember() == 0) {
				memberDao.insert(member);
			} else {
				memberDao.update(member);
			}
			return "redirect:/members/list";
		}
	}

	@GetMapping("/edit/{idMember}")
	public String edit(@PathVariable(value = "idMember") int idMember, Model m) {

		Member member = memberDao.findByKey(idMember);
		m.addAttribute("memberform", member);

		return "member/memberAdd";

	}
	@GetMapping("/show/{idMember}")
	public String show(@PathVariable(value = "idIdea") String idMember, Model m) {
		
		Member member = memberDao.findByKey(Integer.parseInt(idMember));
		m.addAttribute("MemberShow", member);
		
		return "member/memberIndiv";
		
	}
	

	@GetMapping("/delete/{idMember}")
	public String find(Model m, @PathVariable(value = "idMember") int idMember) {

		memberDao.delete(memberDao.findByKey(idMember));

		return "redirect:/members/list";
	}
	
	
}
