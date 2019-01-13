package com.topaidi.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cgi.dao.VoteDao;
import com.cgi.model.Vote;
import com.topaidi.validator.VoteValidator;


@Controller
@RequestMapping("/votes")
public class VoteController {
	@Autowired
	VoteDao voteDao;
	//@Autowired
	//CategoryDao catDao;
	
	
	@GetMapping("/list")
	public String home(Model m) {

		m.addAttribute("VotesList", voteDao.findAll());

		return "vote/voteList";
	}

	@GetMapping("/add")
	public String insert(Model m) {

		m.addAttribute("voteform", new Vote());


		return "vote/voteAdd";
	}

	@PostMapping("/processForm")
	public String subscribe(@ModelAttribute("voteform") Vote vote, BindingResult result, Model m) {
		new VoteValidator().validate(vote, result);
		if (result.hasErrors()) {
			return "vote/voteAdd";
		} else {
			if (vote.getIdVote() == 0) {
				voteDao.insert(vote);
			} else {
				voteDao.update(vote);
			}
			return "redirect:/votes/list";
		}
	}

	@GetMapping("/edit/{idVote}")
	public String edit(@PathVariable(value = "idVote") String idVote, Model m) {

		Vote Vote = voteDao.findByKey(Integer.parseInt(idVote));
		m.addAttribute("voteform", Vote);

		return "vote/voteAdd";

	}
	
	
//	@GetMapping("/list/{idCat}")
//	public String edit(@PathVariable(value = "idCat") int idCat, Model m) {
//		
//		Category cat = catDao.findByKey(idCat);
//		m.addAttribute("VoteCat", cat);
//		
//		return "vote/voteCat";
//		
//	}
	

	@GetMapping("/delete/{idVote}")
	public String find(Model m, @PathVariable(value = "idVote") int idVote) {

		voteDao.delete(voteDao.findByKey(idVote));

		return "redirect:/votes/list";
	}
	
	
}
