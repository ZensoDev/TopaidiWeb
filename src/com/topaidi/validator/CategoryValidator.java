package com.topaidi.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.cgi.model.Category;


public class CategoryValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return Category.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		Category c = (Category) target;
		ValidationUtils.rejectIfEmpty(errors, "name", "c.name.empty", "Le titre de la cat�gorie est vide");
		//voir par quoi remplacer Yzma
		if(c.getName().contentEquals("parcours de la liste, m�thode contain"))
		{errors.rejectValue("name", "c.name", "Une cat�gorie porte d�j� ce nom");}
	}

}
