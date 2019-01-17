package com.topaidi.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cgi.dao.IdeaDao;
import com.cgi.dao.MemberDao;
import com.cgi.dao.VoteDao;
import com.cgi.dao.VoteDaoImpl;
import com.cgi.enumeration.VoteEnum;
import com.cgi.model.Idea;
import com.cgi.model.Vote;


@Controller
@RequestMapping("/votes")
public class VoteController {
	@Autowired
	VoteDao vDao;
	
	@Autowired
	IdeaDao iDao;
	
	@Autowired
	MemberDao mDao;
	
	
	// faire le get et dans jsp bouton top, flop ou rien quand par d�faut
	@GetMapping("/add/{idIdea}/{voteEnum}")
	public String add(@PathVariable(value = "voteEnum") VoteEnum voteEnum,@PathVariable(value = "idIdea") int idIdea, Model model) {
		Idea idea = iDao.findByKey(idIdea);
		Vote vote = new Vote();
		vote.setIdea(idea);
		
		if (voteEnum.getMark()==1) {
			vote.getVoteEnum().setMark(voteEnum.getMark());
			vDao.insert(vote);
		}else {
			vote.getVoteEnum().setMark(voteEnum.getMark());
			vDao.insert(vote);
		}
	
		return "redirect:/ideas/ideaIndiv";
	}

}

