package com.topaidi.controllers;

import javax.persistence.NoResultException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cgi.dao.IdeaDao;
import com.cgi.dao.MemberDao;
import com.cgi.model.Member;
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

	@GetMapping("/connect")
	public String connect(Model m, HttpSession session) {
		System.out.println();
		m.addAttribute("connectform", new Member());

		return "member/memberConnect";
	}

	@PostMapping("/processForm")
	public String subscribe(@ModelAttribute("memberform") Member member, BindingResult result, Model m,
			HttpSession session) {
		new MemberValidator(memberDao).validate(member, result);

		if (result.hasErrors()) {
			return "member/memberAdd";
		} else {
			new MemberValidator(memberDao).validateExistingMail(member, result);

			if (memberDao.existingMail(member.getLoginMail()) == false) {
				if (member.getIdMember() == 0) {
					memberDao.insert(member);
					session.setAttribute("member", member);
				} else {
					memberDao.update(member);
				}
				return "welcome/welcome";
			} else {
				return "member/memberAdd";
			}
		}

	}

	@PostMapping("/connectForm")
	public String connect(@ModelAttribute("connectform") Member member, BindingResult result, Model m,
			HttpSession session) {
		new MemberValidator(memberDao).validateConnect(member, result);

		if (result.hasErrors()) {
			return "member/memberConnect";
		} else {
			try {
				if (memberDao.existingMailPwd(member.getLoginMail(), member.getPassword()) == true) {
					session.setAttribute("member", member);
					return "welcome/welcome";
				} else {
					System.out.println("else");
					return "member/memberConnect";
				}
			} catch (NoResultException e) {
				System.out.println("catch");
				return "redirect:/members/connect";
			}
		}
	}

	@GetMapping("/edit/{idMember}")
	public String edit(@PathVariable(value = "idMember") int idMember, Model m) {

		Member member = memberDao.findByKey(idMember);

		m.addAttribute("memberform", member);

		return "member/memberAdd";

	}

	@GetMapping("/delete/{idMember}")
	public String find(Model m, @PathVariable(value = "idMember") int idMember) {

		memberDao.delete(memberDao.findByKey(idMember));

		return "redirect:/members/list";
	}

	@GetMapping("activeDesactive/{idMember}")
	public void activeDesactive(Model m, @PathVariable(value = "idMember") int idMember) {
		Member member = memberDao.findByKey(idMember);
		if(member.isState()) {
			member.setState(false);
		} else {
			member.setState(true);
		}		
	}
	

}
