package com.neu.mymatchFinder;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.HibernateException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.neu.mymatchFinder.dao.AdminDAO;
import com.neu.mymatchFinder.dao.ContactsDAO;
import com.neu.mymatchFinder.dao.MessageDAO;
import com.neu.mymatchFinder.dao.NotificationDAO;
import com.neu.mymatchFinder.dao.PostsDAO;
import com.neu.mymatchFinder.dao.UsersDAO;
import com.neu.mymatchFinder.pojo.Notification;
import com.neu.mymatchFinder.pojo.Posts;
import com.neu.mymatchFinder.pojo.UserAccount;
import com.neu.mymatchFinder.pojo.Userstable;

@Controller
@RequestMapping("/")
public class UserLoginController {

	private static final Logger logger = LoggerFactory.getLogger(UserLoginController.class);

	@Autowired
	private UsersDAO userDao;

	@Autowired
	private PostsDAO postsDao;

	@Autowired
	private ContactsDAO contactsDao;

	@Autowired
	private NotificationDAO notificationDao;

	@Autowired
	private AdminDAO adminDao;
	
	@Autowired
	private MessageDAO messageDao;
	
	

	@RequestMapping(value = "/index", method = RequestMethod.POST)
	protected String doSubmitAction(@ModelAttribute("userAccount") UserAccount userAccount, ModelMap model,
			BindingResult result, HttpServletRequest request, HttpSession session) throws Exception {

		if (result.hasErrors()) {
			return "login";
		}

		else {
			try {

				UserAccount ua = userDao.queryUserByUserNameAndPassword(userAccount.getUsername(),
						userAccount.getPassword());
				if (ua != null) {
					if (ua.getRole().equalsIgnoreCase("user")) {
						model.addAttribute("userAccount", ua);
						session = request.getSession();
						session.setAttribute("user", ua);
						ArrayList<Integer> contactList = contactsDao.getAllContacts(ua);
						ArrayList<Posts> postList = postsDao.getPosts(ua, contactList);
						model.addAttribute("posts", postList);

						ArrayList<Notification> notificationList = notificationDao.getUnseenNotifications(ua);

						session.setAttribute("notificationCount", notificationList.size());
						model.addAttribute("notificationCount", notificationList.size());
						session.setAttribute("notificationList", notificationList);
						model.addAttribute("notificationList", notificationList);
						
						ArrayList<Integer> userIds = messageDao.getUnreadMessages(ua);
						ArrayList<Userstable> usList = userDao.getUsersByIds(userIds);
						session.setAttribute("messageCount", String.valueOf(usList.size()));
						session.setAttribute("messageList", usList);

						return "index";
					} else if (ua.getRole().equalsIgnoreCase("admin")) {
						model.addAttribute("userAccount", ua);
						session = request.getSession();
						session.setAttribute("user", ua);
						ArrayList<UserAccount> userList = adminDao.getTotalUsers(ua);
						session.setAttribute("userListCount", userList.size());
						model.addAttribute("userListCount", userList.size());
						ArrayList<UserAccount> usertodayList = adminDao.getTotalUsersregisterToday(ua);
						session.setAttribute("usertodayListCount", usertodayList.size());
						model.addAttribute("usertodayListCount", usertodayList.size());
						ArrayList<UserAccount> uList = userDao.getAllUser(ua);
						session.setAttribute("uList", uList);
						model.addAttribute("uList", uList);
						return "Dashboard";

					}
				}

			} catch (HibernateException e) {
				System.out.println("Exception: " + e.getMessage());
			}
			session.setAttribute("errorMessage","Wrong UserName/Password");
			return "login";
		}

	}

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	protected String myProfilePage(@ModelAttribute("userAccount") UserAccount userAccount, ModelMap model,
			BindingResult result, HttpServletRequest request, HttpSession session) throws Exception {

		session = request.getSession();
		UserAccount ua = (UserAccount) session.getAttribute("user");
		if (ua != null) {
			if (ua.getRole().equalsIgnoreCase("user")) {
				model.addAttribute("userAccount", ua);
				session = request.getSession();
				session.setAttribute("user", ua);
				ArrayList<Integer> contactList = contactsDao.getAllContacts(ua);
				ArrayList<Posts> postList = postsDao.getPosts(ua, contactList);
				model.addAttribute("posts", postList);

				ArrayList<Notification> notificationList = notificationDao.getUnseenNotifications(ua);

				session.setAttribute("notificationCount", notificationList.size());
				model.addAttribute("notificationCount", notificationList.size());
				session.setAttribute("notificationList", notificationList);
				model.addAttribute("notificationList", notificationList);
				
				ArrayList<Integer> userIds = messageDao.getUnreadMessages(ua);
				ArrayList<Userstable> usList = userDao.getUsersByIds(userIds);
				session.setAttribute("messageCount", String.valueOf(usList.size()));
				session.setAttribute("messageList", usList);

				return "index";
			} else if (ua.getRole().equalsIgnoreCase("admin")) {
				model.addAttribute("userAccount", ua);
				session = request.getSession();
				session.setAttribute("user", ua);
				ArrayList<UserAccount> userList = adminDao.getTotalUsers(ua);
				session.setAttribute("userListCount", userList.size());
				model.addAttribute("userListCount", userList.size());
				ArrayList<UserAccount> usertodayList = adminDao.getTotalUsersregisterToday(ua);
				session.setAttribute("usertodayListCount", usertodayList.size());
				model.addAttribute("usertodayListCount", usertodayList.size());
				ArrayList<UserAccount> uList = userDao.getAllUser(ua);
				session.setAttribute("uList", uList);
				model.addAttribute("uList", uList);
				return "Dashboard";
			}

			}
		return "index";
			
		}
	
	/*User Logout Mapping*/
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/";
	}

	@RequestMapping(method = RequestMethod.GET)
	public String initializeForm(@ModelAttribute("userAccount") UserAccount userAccount, BindingResult result) {

		return "login";

	}

}
