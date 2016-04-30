package com.neu.mymatchFinder.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;

import org.apache.commons.lang.StringEscapeUtils;
import org.hibernate.Query;

import com.neu.mymatchFinder.pojo.Messages;
import com.neu.mymatchFinder.pojo.UserAccount;
import com.neu.mymatchFinder.pojo.Userstable;

public class MessageDAO extends DAO{
	
	public ArrayList<Integer> getUnreadMessages(UserAccount user)
	{
		Query q = getSession().createQuery("from Messages where toUser = :userid and isRead = 0");
		q.setInteger("userid", user.getUserId());
		@SuppressWarnings("unchecked")
		ArrayList<Messages> messageList = (ArrayList<Messages>) q.list();
		HashSet<Integer> userIds = new HashSet<Integer>();
		
		for(Messages i : messageList)
		{
			userIds.add(i.getFromUser().getUserId());
			userIds.add(i.getToUser().getUserId());
		}
		
		userIds.remove(user.getUserId());
		
		ArrayList<Integer> userList = new ArrayList<Integer>(userIds);
		return userList;
	}
	
	public void markAsRead(UserAccount user)
	{		
		try
		{
			begin();
			Query q = getSession().createQuery("from Messages where toUser = :userid and isRead = 0");
			q.setInteger("userid", user.getUserId());
			@SuppressWarnings("unchecked")
			ArrayList<Messages> messageList = (ArrayList<Messages>) q.list();
						
			for(Messages i : messageList)
			{
				i.setRead(true);
				getSession().update(i);
			}
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
	
	public ArrayList<Integer> getAllMessageList(UserAccount user)
	{
		Query q = getSession().createQuery("from Messages where toUser = :userid or fromUser = :userid");
		q.setInteger("userid", user.getUserId());
		@SuppressWarnings("unchecked")
		ArrayList<Messages> messages = (ArrayList<Messages>) q.list();
		HashSet<Integer> userIds = new HashSet<Integer>();
		
		for(Messages i : messages)
		{
			userIds.add(i.getFromUser().getUserId());
			userIds.add(i.getToUser().getUserId());
		}
		
		userIds.remove(user.getUserId());
		
		ArrayList<Integer> userList = new ArrayList<Integer>(userIds);
		return userList;
		
	}
	
	public String sendMessage(UserAccount user, Userstable u, String message)
	{
		
		try
		{
			begin();
			String safe_message = StringEscapeUtils.escapeHtml(message);
			Messages m = new Messages();
			m.setDateOfMessage(new Date());
			m.setFromUser(user);
			m.setToUser(u);
			m.setMessage(safe_message);
			m.setRead(false);
			
			getSession().save(m);
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
		
		String html = "<div style='background-color:#68dff0;' class='message form-panel pull-right'>" +
                        "<img src='${pageContext.servletContext.contextPath}/resources/img/default.jpg' width=20px class='img-circle pull-left' />" +
                        "<h6>&nbsp; " + user.getUserfullName() +"</a></h6>" +
                        "<p>" + message + "</p>" +
                     "</div>";

        return html;
	}
	
	public ArrayList<Messages> getMessages(UserAccount user, int userId)
	{
		Query q = getSession().createQuery("from Messages where (toUser = :userid and fromUser = :uid) or (toUser = :uid and fromUser = :userid) order by dateOfMessage");
		q.setInteger("userid", user.getUserId());
		q.setInteger("uid", userId);
		@SuppressWarnings("unchecked")
		ArrayList<Messages> messages = (ArrayList<Messages>) q.list();
		
		return messages;
	}


}
