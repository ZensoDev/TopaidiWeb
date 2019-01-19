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
import com.cgi.model.Category;
import com.cgi.model.Idea;
import com.cgi.model.Member;
import com.topaidi.validator.CategoryValidator;

@Controller
@RequestMapping("/categories")
public class CategoryController {

	@Autowired
	CategoryDao cDao;

	@Autowired
	IdeaDao iDao;

	/*
	 * Method to display categories
	 */
	@GetMapping("/list")
	public String list(HttpSession session, Model model) {
		Member member = (Member) session.getAttribute("member");
		if (member.isAdmin()) {
			List<Category> categoriesList = cDao.findAll();
			model.addAttribute("categories", categoriesList);
			return "categories/categorypage";
		} else {
			return "noadmin";
		}

	}

	/*
	 * Method to add one category to database
	 */

	@GetMapping("/add")
	public String form(HttpSession session, Model model) {
		Member member = (Member) session.getAttribute("member");
		Category c = new Category();
		if (member.isAdmin()) {
			model.addAttribute("categoryForm", c);
			return "categories/categoryformpage";
		} else {
			return "noadmin";
		}

	}

	/*
	 * Method to edit one category and save it in the database
	 */

	@GetMapping("/update/{idCategory}")
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

	@PostMapping("/processForm")
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
	 * Method to delete one category from database
	 */

	@GetMapping("/delete/{idCat}")
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
