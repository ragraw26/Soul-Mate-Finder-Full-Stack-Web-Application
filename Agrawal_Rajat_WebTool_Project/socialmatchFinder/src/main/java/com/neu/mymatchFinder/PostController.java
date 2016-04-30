package com.neu.mymatchFinder;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.neu.mymatchFinder.dao.ContactsDAO;
import com.neu.mymatchFinder.dao.NotificationDAO;
import com.neu.mymatchFinder.dao.PostsDAO;
import com.neu.mymatchFinder.dao.UsersDAO;
import com.neu.mymatchFinder.pojo.Notification;
import com.neu.mymatchFinder.pojo.Posts;
import com.neu.mymatchFinder.pojo.UserAccount;


@Controller
public class PostController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserLoginController.class);
	
	
	@Autowired
	private UsersDAO userDao;
	
	@Autowired
	private PostsDAO postsDao;
	
	@Autowired
	private ContactsDAO contactsDao;
	
	@Autowired
	private NotificationDAO notificationDao;
	
	@RequestMapping(value = "/addPosts", method = RequestMethod.POST)
	public String sharePosts(Model model, Posts post, HttpServletRequest request)
	{
		if(post!=null || post.getStatus() != null || !post.getStatus().isEmpty())
		{
			HttpSession session = request.getSession();
			UserAccount user = (UserAccount) session.getAttribute("user");
			post.setUserstable(user);
			postsDao.addPost(post);
			ArrayList<Integer> cList = contactsDao.getAllContacts(user);
			ArrayList<Posts> pList = postsDao.getPosts(user, cList);
			model.addAttribute("posts", pList);
		}
		return "index";
	}
	
	@RequestMapping(value = "/addLike", method = RequestMethod.GET)
	public @ResponseBody String like(@RequestParam("id") String id, HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		UserAccount user = (UserAccount) session.getAttribute("user");
		int pId = Integer.parseInt(id);
		int likes = postsDao.addLikes(pId, user);
		return String.valueOf(likes);
	}
	
	@RequestMapping(value = "/addComment", method = RequestMethod.GET)
	public @ResponseBody String comment(@RequestParam("id") String id, @RequestParam("comment") String comment, HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		UserAccount user = (UserAccount) session.getAttribute("user");
		int pId = Integer.parseInt(id);
		String html = postsDao.addComments(pId, comment, user);
		return html;
	}
	
	@RequestMapping(value = "/markRead", method = RequestMethod.GET)
	public @ResponseBody String markRead(HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		UserAccount user = (UserAccount) session.getAttribute("user");
		notificationDao.markAsRead(user);
		return "0";
	}
	
	@RequestMapping(value = "/post", method = RequestMethod.GET)
	public String getPost(Model model, @RequestParam("postId") String postId, HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		UserAccount user = (UserAccount) session.getAttribute("user");
		Posts post = postsDao.getPost(user, Integer.parseInt(postId));
		
		ArrayList<Notification> notificationList = notificationDao.getUnseenNotifications(user);
		session.setAttribute("notificationCount", String.valueOf(notificationList.size()));
		session.setAttribute("notificationList", notificationList);
		
		model.addAttribute("post", post);
		
		return "post";
	}

}
