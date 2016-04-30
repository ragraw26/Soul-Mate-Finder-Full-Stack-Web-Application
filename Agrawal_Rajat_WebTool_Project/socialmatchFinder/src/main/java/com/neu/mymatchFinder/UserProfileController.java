package com.neu.mymatchFinder;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.neu.mymatchFinder.dao.ContactsDAO;
import com.neu.mymatchFinder.dao.MessageDAO;
import com.neu.mymatchFinder.dao.NotificationDAO;
import com.neu.mymatchFinder.dao.PostsDAO;
import com.neu.mymatchFinder.dao.UsersDAO;
import com.neu.mymatchFinder.pojo.Posts;
import com.neu.mymatchFinder.pojo.UserAccount;
import com.neu.mymatchFinder.pojo.Userstable;


@Controller
public class UserProfileController {

	@Autowired
	private UsersDAO usersDAO;
	
	@Autowired
	private PostsDAO postsDao;
	
	@Autowired
	private ContactsDAO contactsDao;
	
	@Autowired
	private MessageDAO messageDAO;
	
	@Autowired
	private NotificationDAO notificationDao;

	@RequestMapping(value = "/myProfile", method = RequestMethod.GET)
	public String profileDetails(Model model, UserAccount user, HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserAccount ua = (UserAccount) session.getAttribute("user");		
		model.addAttribute("user", ua);
		return "myProfile";
	}
	
	
	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public String openProfile(@RequestParam("userId") int userId, Model model, HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		UserAccount user = (UserAccount) session.getAttribute("user");
		boolean checkIfFriend = contactsDao.checkIfFriend(user, userId);
		Userstable u = usersDAO.getUsersByIds(userId);
		model.addAttribute("user", u);
		model.addAttribute("checkIfFriend", checkIfFriend);
		return "myProfile";
	}

	
	
	@RequestMapping(value = "/editProfile", method = RequestMethod.GET)
	public String editprofileDetails(Model model, UserAccount user,HttpServletRequest request,HttpSession session){

		
		session = request.getSession();
		UserAccount ua = (UserAccount) session.getAttribute("user");		
		model.addAttribute("user", ua);
		return "editProfile";
	}
	

	@RequestMapping(value = "/editProfile", method = RequestMethod.POST)
	public String editDetails(@ModelAttribute("user") UserAccount user, BindingResult result,HttpServletRequest request,HttpSession session){		
		session = request.getSession();
		
		UserAccount u = (UserAccount) session.getAttribute("user");
		u.setAboutMe1(user.getAboutMe1());
		u.setAboutMe2(user.getAboutMe2());
		u.setActivityLevel(u.getActivityLevel());
		u.setAppearanceImportance(u.getAppearanceImportance());
		u.setBodyType(u.getBodyType());
		u.setCuisine(user.getCuisine());
		u.setCustody(user.getCustody());
		u.setDrinkingHabits(user.getDrinkingHabits());
		u.setEducationLevel(user.getEducationLevel());
		u.setEntertainmentLocation(user.getEntertainmentLocation());
		u.setEthnicity(user.getEthnicity());
		u.setEyeColor(user.getEyeColor());		
		u.setHairColor(user.getHairColor());
		u.setHeight(user.getHeight());
		u.setIdealRelationshipEssay(user.getIdealRelationshipEssay());
		u.setIncomeLevel(user.getIncomeLevel());
		u.setIntelligenceImportance(user.getIntelligenceImportance());
		u.setLanguages(user.getLanguages());
		u.setLearnFromThePastEssay(user.getLearnFromThePastEssay());
		u.setLeisureActivity(user.getLeisureActivity());
		u.setMaritalStatus(user.getMaritalStatus());
		u.setMoreChildrenFlag(user.getMoreChildrenFlag());
		u.setMusic(user.getMusic());
		u.setOccupation(user.getOccupation());
		u.setOccupationDescription(user.getOccupationDescription());
		u.setPerfectFirstDateEssay(user.getPerfectFirstDateEssay());
		u.setPersonalityTrait(user.getPersonalityTrait());
		u.setPhysicalActivity(user.getPhysicalActivity());
		u.setPoliticalOrientation(user.getPoliticalOrientation());
		u.setReading(user.getReading());
		u.setRelationshipType(user.getRelationshipType());
		u.setReligion(user.getReligion());
		u.setRelocateFlag(user.getRelocateFlag());
		u.setSeekingGender(user.getSeekingGender());
		u.setSmokingHabits(user.getSmokingHabits());
		u.setStudiesEmphasis(user.getStudiesEmphasis());
		u.setWeight(user.getWeight());
			
		usersDAO.editDetails(u);
		return "redirect:/myProfile?userId=" + u.getUserId();
	}
	
	
	@RequestMapping(value = "/resetPassword", method = RequestMethod.POST)
	public String resetPassword(Model model, UserAccount user, HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserAccount ua = (UserAccount) session.getAttribute("user");
		ua.setUserPassword(user.getUserPassword());
		ua.setPassword(user.getUserPassword());
		usersDAO.resetPassword(ua);
		session.setAttribute("success", "Password Reset Successfully");
		return "login";
	}
	
	@RequestMapping(value = "/uniqueUsername", method = RequestMethod.GET)
	public @ResponseBody String uniqueUsername(@RequestParam("username") String username)
	{
		UserAccount user = usersDAO.UserByUserName(username);
		if(user != null)
		{
			return "false";
		}
		return "true";
	}

}
