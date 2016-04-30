package com.neu.mymatchFinder;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.neu.mymatchFinder.pojo.UserAccount;
import com.neu.mymatchFinder.pojo.Userstable;

import org.springframework.validation.ValidationUtils;

public class UserValidator implements Validator {

	public boolean supports(Class aClass) {
		return aClass.equals(UserAccount.class);
	}

	public void validate(Object obj, Errors errors) {
		UserAccount user = (UserAccount) obj;
		Pattern pattern;
		Matcher matcher;
		String ID_PATTERN = "[0-9]+";
		String STRING_PATTERN = "[a-zA-Z\\s']+";
		String AGE_PATTERN = "/\\s[0-1]{1}[0-9]{0,2}/";

		final String EMAIL_PATTERN = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
				+ "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "userfullName", "error.invalid.userfullName", " Name Required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "userName", "error.invalid.userName", "userName Required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "age", "error.invalid.user", "Age Required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "userName", "error.invalid.user", "UserName Required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "userPassword", "error.invalid.userPassword",
				"Password Required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "error.invalid.emailId", "Email Required");

		if (user.getUserfullName() != null) {
			pattern = Pattern.compile(STRING_PATTERN);
			matcher = pattern.matcher(user.getUserfullName());
			if (!matcher.matches()) {
				errors.rejectValue("userfullName", "error.invalid.userfullName", "Name is not string");
			}
		}

		if (user.getCountry() != null) {
			pattern = Pattern.compile(STRING_PATTERN);
			matcher = pattern.matcher(user.getCountry());
			if (!matcher.matches()) {
				errors.rejectValue("country", "error.invalid.country", "Country is not string");
			}
		}

		if (user.getState() != null) {
			pattern = Pattern.compile(STRING_PATTERN);
			matcher = pattern.matcher(user.getState());
			if (!matcher.matches()) {
				errors.rejectValue("state", "error.invalid.country", "state is not string");
			}
		}

		if (user.getCity() != null) {
			pattern = Pattern.compile(STRING_PATTERN);
			matcher = pattern.matcher(user.getCity());
			if (!matcher.matches()) {
				errors.rejectValue("city", "error.invalid.city", "city is not string");
			}
		}

		if (user.getAge() > 120) {
			errors.rejectValue("age", "error.invalid.age", "Too old");
		}

		if (user.getDobday() > 31) {
			errors.rejectValue("dobday", "error.invalid.dobday", "Date is large");
		}

		if (user.getDobmonth() > 12) {
			errors.rejectValue("dobmonth", "error.invalid.dobmonth", "Month is not in range");
		}

		if (user.getDobyear() > 2000) {
			errors.rejectValue("dobyear", "error.invalid.dobyear", "Sorry!! You cannot register");
		}

		pattern = Pattern.compile(EMAIL_PATTERN);
		matcher = pattern.matcher(user.getEmail());
		if (!matcher.matches()) {
			errors.rejectValue("email", "error.invalid.email", "Email not valid");
		}
	}
}
