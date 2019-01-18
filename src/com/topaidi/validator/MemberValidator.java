package com.topaidi.validator;

import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.cgi.dao.MemberDao;
import com.cgi.model.Idea;
import com.cgi.model.Member;

public class MemberValidator implements Validator{

	private MemberDao mDao;
	
	public MemberValidator(MemberDao mDao) {
		super();
		this.mDao = mDao;
	}

	@Override
	public boolean supports(Class<?> clazz) {
		return Member.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		Member m = (Member) target;
		ValidationUtils.rejectIfEmpty(errors, "loginMail", "member.loginMail.empty", "Une adresse mail doit être saisie");
		ValidationUtils.rejectIfEmpty(errors, "password", "member.password.empty", "Un mot de passe doit être saisi");
		ValidationUtils.rejectIfEmpty(errors, "lastName", "member.lastName.empty", "Un nom doit être saisi");
		ValidationUtils.rejectIfEmpty(errors, "firstName", "member.firstName.empty", "Un prénom doit être saisi");		
	}
		
	public void validateExistingMail(Object target, Errors errors) {
		Member m = (Member) target;
		
		if (mDao.existingMail(m.getLoginMail()) == true) {
			errors.rejectValue("loginMail", "member.loginMail.exist", "L'adresse utilisée existe déjà");
		}
	}

	public void validateConnect(Object target, Errors errors) {
		Member m = (Member) target;
		ValidationUtils.rejectIfEmpty(errors, "loginMail", "member.loginMail.empty", "Une adresse mail doit être saisie");
		ValidationUtils.rejectIfEmpty(errors, "password", "member.password.empty", "Un mot de passe doit être saisi");
	}
}
