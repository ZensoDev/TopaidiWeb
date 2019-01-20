package com.topaidi.controllers;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cgi.dao.IdeaDao;
import com.cgi.dao.MemberDao;

import com.cgi.dao.VoteDaoImpl;

import com.cgi.enumeration.VoteEnum;
import com.cgi.model.Idea;
import com.cgi.model.Vote;
import com.cgi.model.Member;


@Controller
@RequestMapping("/votes")
public class VoteController {
	
	@Autowired
	VoteDaoImpl vDao;
	
	@Autowired
	IdeaDao iDao;
	
	@Autowired
	MemberDao mDao;
	
	@GetMapping("/add/{idIdea}/{voteEnum}")
	public String add(@PathVariable(value = "voteEnum") VoteEnum voteEnum,@PathVariable(value = "idIdea") int idIdea, HttpSession session, Model model) {
	
		Member member =mDao.findByKey(((Member) session.getAttribute("member")).getIdMember());
		Idea idea = iDao.findByKey(idIdea);
		Vote vote = new Vote();
		vote.setIdea(idea);
		vote.setMember(member);
		
		if (voteEnum.getMark()==1) {
			voteEnum.setMark(1);
			vote.setVoteEnum(voteEnum);
			vDao.insert(vote);
		}else if(voteEnum.getMark()==0) {
			voteEnum.setMark(0);
			vote.setVoteEnum(voteEnum);
			vDao.insert(vote);
		}
	
		return "redirect:/ideas/show/{idIdea}";
	}
	

}

