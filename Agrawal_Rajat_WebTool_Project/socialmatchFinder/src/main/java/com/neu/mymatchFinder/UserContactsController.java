package com.neu.mymatchFinder;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.neu.mymatchFinder.dao.ContactsDAO;
import com.neu.mymatchFinder.dao.MessageDAO;
import com.neu.mymatchFinder.dao.NotificationDAO;
import com.neu.mymatchFinder.dao.PostsDAO;
import com.neu.mymatchFinder.dao.UsersDAO;
import com.neu.mymatchFinder.pojo.Notification;
import com.neu.mymatchFinder.pojo.UserAccount;
import com.neu.mymatchFinder.pojo.Userstable;


@Controller
public class UserContactsController {
	
	
	@Autowired
	private UsersDAO userDao;
	
	@Autowired
	private PostsDAO postsDao;
	
	@Autowired
	private ContactsDAO contactsDao;	

	@Autowired
	private MessageDAO messageDAO;
	
	@Autowired
	private NotificationDAO notificationDao;
	
		
	@RequestMapping(value = "/friends", method = RequestMethod.GET)
	public String friends(Model model, HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		UserAccount user = (UserAccount) session.getAttribute("user");
		model.addAttribute("user", user);
		ArrayList<Integer> friendIds = contactsDao.getAllContacts(user); 
		
		ArrayList<Notification> notificationList = notificationDao.getUnseenNotifications(user);
		session.setAttribute("notificationCount", notificationList.size());
		model.addAttribute("notificationCount",notificationList.size());
		session.setAttribute("notificationList", notificationList);				
		model.addAttribute("notificationList",notificationList);
		
		ArrayList<Integer> userIds = messageDAO.getUnreadMessages(user);
		ArrayList<Userstable> userList1 = userDao.getUsersByIds(userIds);
		session.setAttribute("messageCount", String.valueOf(userList1.size()));
		model.addAttribute("messageCount", String.valueOf(userList1.size()));
		session.setAttribute("messageList",userList1);
		model.addAttribute("messageList", userList1);
		
		if(friendIds.size() > 0)
		{
			ArrayList<Userstable> userList = userDao.getUsersByIds(friendIds);
			model.addAttribute("userList", userList);
		}
		return "friends";
	}
	
	@RequestMapping(value = "/friendRequests", method = RequestMethod.GET)
	public String friendRequests(Model model, HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		UserAccount user = (UserAccount) session.getAttribute("user");
		ArrayList<Integer> friendRequests = contactsDao.getFRequests(user); 
		if(friendRequests.size() > 0)
		{
			ArrayList<Userstable> userList = userDao.getUsersByIds(friendRequests);
			model.addAttribute("userList", userList);
		}
		return "friendRequests";
	}
	
	@RequestMapping(value = "/pendingRequests", method = RequestMethod.GET)
	public String pendingRequests(Model model, HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		UserAccount user = (UserAccount) session.getAttribute("user");
		ArrayList<Integer> pendingRequests = contactsDao.getPendingRequests(user); 
		
		ArrayList<Notification> notificationList = notificationDao.getUnseenNotifications(user);
		session.setAttribute("notificationCount", notificationList.size());
		model.addAttribute("notificationCount",notificationList.size());
		session.setAttribute("notificationList", notificationList);				
		model.addAttribute("notificationList",notificationList);
		
		ArrayList<Integer> userIds = messageDAO.getUnreadMessages(user);
		ArrayList<Userstable> userList1 = userDao.getUsersByIds(userIds);
		session.setAttribute("messageCount", String.valueOf(userList1.size()));
		model.addAttribute("messageCount", String.valueOf(userList1.size()));
		session.setAttribute("messageList", userList1);
		model.addAttribute("messageList", userList1);
		
		
		if(pendingRequests.size() > 0)
		{
			ArrayList<Userstable> userList = userDao.getUsersByIds(pendingRequests);
			model.addAttribute("userList", userList);
		}
		return "pendingRequests";
	}
	
	@RequestMapping(value ="/sendRequest", method = RequestMethod.POST)
	public String sendRequest(Model model, HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		UserAccount user = (UserAccount) session.getAttribute("user");
		String userId = (String) request.getParameter("userId");
		contactsDao.sendFriendRequest(user, Integer.parseInt(userId));
		return "redirect:index";
	}
	
	@RequestMapping(value = "/acceptRequest", method = RequestMethod.POST)
	public String acceptRequest(@RequestParam("userId") String userId, Model model, HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		UserAccount user = (UserAccount) session.getAttribute("user");
		contactsDao.acceptRequest(user, Integer.parseInt(userId));
		return "index";
	}
	
	@RequestMapping(value = "/unFriend", method = RequestMethod.POST)
	public String delete(@RequestParam("userId") String userId, Model model, HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		UserAccount user = (UserAccount) session.getAttribute("user");
		contactsDao.unFriend(user, Integer.parseInt(userId));
		return "index";
	}

}
