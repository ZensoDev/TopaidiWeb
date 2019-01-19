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
import org.springframework.web.bind.annotation.RequestParam;

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
	public String connect(@RequestParam(value="error",required=false) String error, Model m, HttpSession session) {
		
		m.addAttribute("connectform", new Member());
		if(error!=null) {
			m.addAttribute("error",error);
		}
		
		Member member = (Member) session.getAttribute("member");
		String redirect = null;
		if(member.isAdmin()) {
			redirect = "AdminGestionController/gestion";
		} else {
			redirect = "member/memberConnect";
			
		}
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
					String redirect = null;
					if(member.isAdmin()) {
						redirect = "redirect:AdminGestionController/gestion";
					} else {
						redirect = "redirect:/welcome/welcome";
					}
					return redirect;
				} else {
					memberDao.update(member);
				}
				return "redirect:/welcome/welcome";
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
				if (memberDao.existingMailPwd(member.getLoginMail(), member.getPassword())) {
					session.setAttribute("member", member);
					String redirect = null;
					if(member.isAdmin()) {
						redirect = "AdminGestionController/gestion";
					} else {
						redirect = "welcome/welcome";
					}
					return redirect;
					
				} else {
					return "member/memberConnect";
				}
			} catch (NoResultException e) {
				return "redirect:/members/connect?error=connectionFailed";
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
	
	@GetMapping("/deconnection")
	public String deconnect(Model m, HttpSession session) {
		session.invalidate();
		
		return "redirect:/welcome/welcome";
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
