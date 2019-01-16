package com.topaidi.validator;


import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.cgi.model.Vote;

public class VoteValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		return Vote.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		Vote l = (Vote) target;// TODO Auto-generated method stub
		
	}
	
}
