package com.neu.mymatchFinder.dao;

import java.util.ArrayList;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.neu.mymatchFinder.pojo.Contacts;
import com.neu.mymatchFinder.pojo.UserAccount;


public class ContactsDAO extends DAO{
	
	public ArrayList<Integer> getAllContacts(UserAccount user)
	{	
		begin();
		Query q = getSession().createQuery("from Contacts where (fromUser = :userid or toUser = :userid) and isAccepted = 1");
		q.setInteger("userid", user.getUserId());
		ArrayList<Contacts> contactList = (ArrayList<Contacts>) q.list();
		ArrayList<Integer> contactIds = new ArrayList<Integer>();
		
		for(Contacts c : contactList)
		{
			if(c.getFromUser() != user.getUserId())
			{
				contactIds.add(c.getFromUser());
			}
			if(c.getToUser() != user.getUserId())
			{
				contactIds.add(c.getToUser());
			}
		}
		
		return contactIds;
	}
	
	public ArrayList<Contacts> getCRequests(UserAccount user)
	{
		Query q = getSession().createQuery("from Contacts where (fromUser = :userid or toUser = :userid)");
		q.setInteger("userid", user.getUserId());
		ArrayList<Contacts> contactList = (ArrayList<Contacts>) q.list();
		ArrayList<Contacts> contacts = new ArrayList<Contacts>();
		
		for(Contacts c : contactList)
		{
			if(c.getFromUser() != user.getUserId())
			{
				contacts.add(c);
			}
			if(c.getToUser() != user.getUserId())
			{
				contacts.add(c);
			}
		}
		
		return contacts;
	}
	
	public ArrayList<Integer> getFRequests(UserAccount user)
	{
		Query q = getSession().createQuery("select fromUser from Contacts where toUser = :userid and isAccepted = 0");
		q.setInteger("userid", user.getUserId());
		ArrayList<Integer> friendRequests = (ArrayList<Integer>) q.list();
		
		return friendRequests;
	}
	
	public ArrayList<Integer> getPendingRequests(UserAccount user)
	{
		Query q = getSession().createQuery("select toUser from Contacts where fromUser = :userid and isAccepted = 0");
		q.setInteger("userid", user.getUserId());
		ArrayList<Integer> pendingRequests = (ArrayList<Integer>) q.list();
		
		return pendingRequests;
	}
	
	public void sendFriendRequest(UserAccount user, int userId)
	{
		Contacts contacts = new Contacts();
		contacts.setFromUser(user.getUserId());
		contacts.setToUser(userId);
		contacts.setAccepted(false);
		
		try
		{
			begin();
			getSession().save(contacts);
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
	
	public void acceptRequest(UserAccount user, int userId)
	{
		Query q = getSession().createQuery("from Contacts where fromUser = :personId and toUser = :userId");
		q.setInteger("personId", userId);
		q.setInteger("userId", user.getUserId());
		Contacts contacts = (Contacts) q.uniqueResult();
		contacts.setAccepted(true);
		begin();
		getSession().update(contacts);
		commit();
		close();
	}
	
	public void unFriend(UserAccount user, int UserID)
	{		
		try
		{
			begin();
			Query q = getSession().createQuery("delete from Contacts where (toUser = :userid or fromUser = :userid) and (toUser = :userid or fromUser = :userid)");
			q.setInteger("userid", user.getUserId());
			q.setInteger("userid", UserID);
			int result = q.executeUpdate();
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
	
	public boolean checkIfFriend(UserAccount user, int UserID)
	{
		ArrayList<Integer> contactIds = getAllContacts(user);
		for(int f : contactIds)
		{
			if(UserID == f)
				return true;
		}
		
		return false;
	}

	}
