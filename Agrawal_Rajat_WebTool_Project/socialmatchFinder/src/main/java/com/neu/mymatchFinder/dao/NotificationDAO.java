package com.neu.mymatchFinder.dao;

import java.util.ArrayList;

import org.hibernate.Query;

import com.neu.mymatchFinder.pojo.Notification;
import com.neu.mymatchFinder.pojo.UserAccount;


public class NotificationDAO extends DAO{
	
	public ArrayList<Notification> getUnseenNotifications(UserAccount user)
	{
		Query q = getSession().createQuery("from Notification where toUser = :userid and isseen = 0");
		q.setInteger("userid", user.getUserId());
		ArrayList<Notification> notificationList = (ArrayList<Notification>) q.list();
		return notificationList;
	}
	
	public void markAsRead(UserAccount user)
	{		
		Query q = getSession().createQuery("from Notification where toUser = :userid and isseen = 0");
		q.setInteger("userid", user.getUserId());
		ArrayList<Notification> notificationList = (ArrayList<Notification>) q.list();
		try
		{
			begin();
			for(Notification n : notificationList)
			{
				n.setSeen(true);
				getSession().update(n);
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


}
