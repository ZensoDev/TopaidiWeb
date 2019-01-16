package com.topaidi.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.cgi.model.Comment;

public class CommentValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return Comment.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		// TODO Auto-generated method stub
		Comment comment = (Comment) target;
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "text", "comment.text", "Le commentaire ne peut pas être vide");
		
	}
}
