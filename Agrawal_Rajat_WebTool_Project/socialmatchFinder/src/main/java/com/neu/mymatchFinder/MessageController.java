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
import org.springframework.web.bind.annotation.ResponseBody;

import com.neu.mymatchFinder.dao.ContactsDAO;
import com.neu.mymatchFinder.dao.MessageDAO;
import com.neu.mymatchFinder.dao.NotificationDAO;
import com.neu.mymatchFinder.dao.PostsDAO;
import com.neu.mymatchFinder.dao.UsersDAO;
import com.neu.mymatchFinder.pojo.Messages;
import com.neu.mymatchFinder.pojo.UserAccount;
import com.neu.mymatchFinder.pojo.Userstable;

@Controller
public class MessageController {
	
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

	@RequestMapping(value = "/inbox", method = RequestMethod.GET)
	public String getInbox(Model model, HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		UserAccount user = (UserAccount) session.getAttribute("user");
		ArrayList<Integer> userIds = messageDAO.getAllMessageList(user);
		ArrayList<Userstable> userList = userDao.getUsersByIds(userIds);
		model.addAttribute("userList", userList);
		
		return "inbox";
	}
	
	@RequestMapping(value = "/getMessage", method = RequestMethod.GET)
	public String getMessages(@RequestParam("userId") int userId, Model model, HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		UserAccount user = (UserAccount) session.getAttribute("user");
		ArrayList<Messages> messages = messageDAO.getMessages(user, userId);
		Userstable u= userDao.getUsersByIds(userId);
		model.addAttribute("messages", messages);
		model.addAttribute("user", u);
		return "messages";
	}
	
	@RequestMapping(value = "/sendMessage", method = RequestMethod.GET)
	public @ResponseBody String sendMessage(@RequestParam("message") String message, @RequestParam("userId") String userId, HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		UserAccount user = (UserAccount) session.getAttribute("user");
		Userstable u = userDao.getUsersByIds(Integer.parseInt(userId));
		String html = messageDAO.sendMessage(user, u, message);
		return html;
	}
	
	@RequestMapping(value = "/markMessageRead", method = RequestMethod.GET, produces = "application/text")
	public @ResponseBody String markMessageRead(HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		UserAccount user = (UserAccount) session.getAttribute("user");
		messageDAO.markAsRead(user);
		session.setAttribute("messageCount", "0");
		return "0";
	}
}
