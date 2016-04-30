package com.neu.mymatchFinder.dao;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.hibernate.Query;

import com.neu.mymatchFinder.pojo.Category;
import com.neu.mymatchFinder.pojo.UserAccount;

public class AdminDAO extends DAO{
	
	public ArrayList<UserAccount> getTotalUsers(UserAccount user)
	{
		Query q = getSession().createQuery("from UserAccount");
		ArrayList<UserAccount> userList = (ArrayList<UserAccount>) q.list();
		return userList;
	}
	
	public ArrayList<UserAccount> getTotalUsersregisterToday(UserAccount user)
	{
		Query q = getSession().createQuery("from UserAccount where registerDate = :date");
		Date d = new Date();
	    DateFormat df = new SimpleDateFormat("yyyy/MM/dd");
	    String date= df.format(d);
		q.setString("date", date);
		ArrayList<UserAccount> userList = (ArrayList<UserAccount>) q.list();
		return userList;
	}
	
	public Category createCategory(Category category) {
	
		try {
			begin();			

			getSession().save(category);
			commit();
			return category;

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			close();
		}
		return category;

	}


}
