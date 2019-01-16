package com.topaidi.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.cgi.model.Idea;



public class IdeaValidator implements Validator{
	
	@Override
	public boolean supports(Class<?> clazz) {
		return Idea.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		Idea l = (Idea) target;
		ValidationUtils.rejectIfEmpty(errors, "title", "idea.title.empty", "Le titre doit être saisi");
		ValidationUtils.rejectIfEmpty(errors, "description", "idea.description.empty", "La description doit être saisie");
		//ValidationUtils.rejectIfEmpty(errors, "date", "date.description.empty", "La date doit être saisie");
		
		//if(l.getTitle().equals("Bieber"))
			//errors.rejectValue("firstName", "artist.firstName.bieber", "Noooo");
	}

}
