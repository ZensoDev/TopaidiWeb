package com.topaidi.controllers;

import java.util.List;

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

import com.cgi.dao.CategoryDao;
import com.cgi.dao.IdeaDao;
import com.cgi.dao.MemberDao;
import com.cgi.model.Category;
import com.cgi.model.Idea;
import com.cgi.model.Member;
import com.topaidi.validator.CategoryValidator;
import com.topaidi.validator.IdeaValidator;
import com.topaidi.validator.MemberValidator;

@Controller
@RequestMapping("/admin")
public class AdminGestionController {
	@Autowired
	MemberDao memberDao;

	@Autowired
	CategoryDao cDao;

	@Autowired
	IdeaDao iDao;

	/*
	 * First administration page
	 */
	@GetMapping("/gestion")
	public String home() {
		return "admin";
	}

	/*
	 * Method to access of members gestion page
	 */

	@GetMapping("/member")
	public String member(Model model, HttpSession session) {

		model.addAttribute("MembersList", memberDao.findAll());
		return "member/memberAdmin";
	}

	/*
	 * Method to edit information member
	 */

	@GetMapping("/editMember/{idMember}")
	public String edit(@PathVariable(value = "idMember") int idMember, Model m) {
		Member member = memberDao.findByKey(idMember);
		m.addAttribute("memberform", member);
		return "member/memberAdd";
	}

	/*
	 * Method to obtain the form to edit
	 */

	@PostMapping("/processFormMember")
	public String subscribe(@ModelAttribute("memberform") Member member, BindingResult result, Model m,
			HttpSession session) {
		memberDao.update(member);
		return "member/memberAdd";

	}

	/*
	 * Method to delete one member
	 */
	@GetMapping("/deleteMember/{idMember}")
	public String deleteMember(Model m, @PathVariable(value = "idMember") int idMember) {
		memberDao.delete(memberDao.findByKey(idMember));
		return "redirect:/admin/member";
	}

	/*
	 * Method to activate/desactivate a member
	 */
	@GetMapping("activeDesactiveMember/{idMember}")
	public String activeDesactiveM(Model m, @PathVariable(value = "idMember") int idMember) {
		Member member = memberDao.findByKey(idMember);
		if (member.isState()) {
			member.setState(false);
		} else {
			member.setState(true);
		}
		memberDao.update(member);

		return "redirect:/admin/member";
	}

	/*
	 * Method to access of ideas gestion page
	 */

	@GetMapping("/idea")
	public String idea(Model model) {
		model.addAttribute("IdeasList", iDao.findAll());
		return "idea/ideaAdmin";
	}

	/*
	 * Method to edit information idea
	 */
	@GetMapping("/editIdea/{idIdea}")
	public String edit(@PathVariable(value = "idIdea") String idIdea, Model m) {
		Idea Idea = iDao.findByKey(Integer.parseInt(idIdea));
		m.addAttribute("ideaform", Idea);
		return "idea/ideaAdd";

	}

	/*
	 * Method to obtain the form to edit
	 */

	@PostMapping("/processFormIdea")
	public String subscribe(@ModelAttribute("ideaform") Idea idea, BindingResult result, Model m) {
		new IdeaValidator().validate(idea, result);
		m.addAttribute("categories", cDao.findAll());
		System.out.println(iDao);
		iDao.update(idea);
		return "redirect:/admin/idea";
	}

	/*
	 * Method to delete one idea
	 */

	@GetMapping("/deleteIdea/{idIdea}")
	public String deleteIdea(Model m, @PathVariable(value = "idIdea") int idIdea) {
		iDao.delete(iDao.findByKey(idIdea));
		return "redirect:/admin/idea";
	}

	/*
	 * Method to act/vate/desactivate a idea
	 */
	@GetMapping("activeDesactiveIdea/{idIdea}")
	public String activeDesactive(Model m, @PathVariable(value = "idIdea") int idIdea) {
		Idea idea = iDao.findByKey(idIdea);
		if (idea.isState()) {
			idea.setState(false);
		} else {
			idea.setState(true);
		}
		iDao.update(idea);
		return "redirect:/admin/idea";
	}

	/*
	 * Method to display categories
	 */
	@GetMapping("/category")
	public String list(HttpSession session, Model model) {
		{
			Member member = (Member) session.getAttribute("member");
			if (member.isAdmin()) {
				List<Category> categoriesList = cDao.findAll();
				model.addAttribute("categories", categoriesList);
				return "categories/categorypage";
			} else {
				return "noadmin";
			}

		}
	}

	/*
	 * Method to add one category to database
	 */

	@GetMapping("/addCat")
	public String form(HttpSession session, Model model) {

		Category c = new Category();

		model.addAttribute("categoryForm", c);
		return "categories/categoryformpage";

	}

	/*
	 * Method to edit one category and save it in the database
	 */

	@GetMapping("/updateCat/{idCategory}")
	public String update(@PathVariable("idCategory") int idC, HttpSession session, Model model) {
		Member member = (Member) session.getAttribute("member");
		if (member.isAdmin()) {
			Category category = cDao.findByKey(idC);
			model.addAttribute("categoryForm", category);
			return "categories/categoryformpage";
		} else {
			return "noadmin";
		}
	}

	/**
	 * Method to have one form and choose if use is for edit or add one category
	 */

	@PostMapping("/processFormCat")
	public String updateProcess(@ModelAttribute("categoryForm") Category category, HttpSession session, Model model,
			BindingResult result) {
		Member member = (Member) session.getAttribute("member");
		if (member.isAdmin()) {
			new CategoryValidator().validate(category, result);
			if (result.hasErrors()) {
				return "categories/categoryformpage";
			}

			else {
				if (category.getIdCat() == 0) {
					cDao.insert(category);
				} else {
					cDao.update(category);
				}

				return "redirect:/categories/list";
			}
		} else {
			return "noadmin";
		}

	}

	/**
	 * Method to delete one category
	 */

	@GetMapping("/deleteCat/{idCat}")
	public String delete(@PathVariable("idCat") int idCategory, HttpSession session, Model model) {
		Member member = (Member) session.getAttribute("member");
		if (member.isAdmin()) {
			cDao.delete(cDao.findByKey(idCategory));
			return "redirect:/categories/list";
		} else {
			return "noadmin";
		}
	}

}
