package com.neu.mymatchFinder.dao;

import java.util.ArrayList;
import java.util.Date;

import org.apache.commons.lang.StringEscapeUtils;
import org.hibernate.Query;

import com.neu.mymatchFinder.pojo.Comments;
import com.neu.mymatchFinder.pojo.Notification;
import com.neu.mymatchFinder.pojo.Posts;
import com.neu.mymatchFinder.pojo.UserAccount;



public class PostsDAO extends DAO  {
	
	private static int counter;
	private static ArrayList<Integer> contacts;
	
	public Posts getPost(UserAccount user, int postId)
	{
		Query q = getSession().createQuery("from Posts where postid = :postId and UserID = :userId");
		q.setInteger("postId", postId);
		q.setInteger("userId", user.getUserId());
		Posts post = (Posts) q.uniqueResult();
		
		return post;
				
	}
	public ArrayList<Posts> getPosts(UserAccount user, ArrayList<Integer> contactList)
	{
		contactList.add(user.getUserId());
		Query query = getSession().createQuery("from Posts where UserID in (:userid) order by dateofpost desc").setMaxResults(2);
		query.setParameterList("userid", contactList);
		ArrayList<Posts> postList = (ArrayList<Posts>) query.list();
		counter = 2;
		contacts = contactList;
		return postList;
	}
	
	
	public void addPost(Posts post)
	{
		begin();
		try
		{
			Date today = new Date();
			post.setDateOfPost(today);
			getSession().save(post);
			commit();
		}
		catch(Exception e)
		{
			System.out.println("Hello " + e.getMessage());
		}
		finally
		{
			close();
		}
	}
	
		
	public int addLikes(int postId, UserAccount user)
	{
		
		Query query = getSession().createQuery("from Posts where postid = :postId");
		query.setInteger("postId", postId);
		Posts post = (Posts) query.uniqueResult();
		int likes = post.getLikes() + 1;
		try
		{
			begin();
			post.setLikes(likes);
			getSession().update(post);
			commit();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			close();
		}		
		
		String notification = user.getUserfullName() + " liked your post";
		addNotification(user, notification, post);
		
		return likes;
	}
	
	public String addComments(int postId, String comment, UserAccount user)
	{
		String safe_comment = StringEscapeUtils.escapeHtml(comment);
		Query q = getSession().createQuery("from Posts where postid = :postId");
		q.setInteger("postId", postId);
		Posts post = (Posts) q.uniqueResult();
		try
		{
			Comments c = new Comments();
			c.setComment(safe_comment);
			c.setUserstable(user);
			c.setDateOfComment(new Date());
			c.setPosts(post);
			post.getComments().add(c);
			
			begin();			
			getSession().update(post);			
			commit();
		}
		catch(Exception e)
		{
			System.out.println("Could not PostDao");
			e.printStackTrace();
		}
		finally
		{
			close();
		}
		
		String notification = user.getUserfullName() + " commented on your post";
		addNotification(user, notification, post);
		
		String html = "<a href='profile.html'><img src='${pageContext.servletContext.contextPath}/resources/img/default.jpg' width=20px class='img-circle pull-left' />" +
	                      "<h5>&nbsp; " + user.getUserfullName() + "</a></h5>" +
	                      "<p>" + comment + "</p>";
		return html;
	}
	
	public void addNotification(UserAccount user, String notification, Posts post)
	{
		
		try
		{
			
			Notification n = new Notification();
			n.setFromUser(user);
			n.setToUser(post.getUserstable());
			n.setNotification(notification);
			n.setSeen(false);
			n.setPosts(post);
			post.getNotifications().add(n);
			begin();
			getSession().save(n);
			commit();
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			close();
		}
		
	}


}
