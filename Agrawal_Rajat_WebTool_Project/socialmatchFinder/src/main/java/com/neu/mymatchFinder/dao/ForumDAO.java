package com.neu.mymatchFinder.dao;

import org.hibernate.HibernateException;

import com.neu.mymatchFinder.exception.AdException;
import com.neu.mymatchFinder.pojo.Forum;
import com.neu.mymatchFinder.pojo.Userstable;

public class ForumDAO extends DAO {

	public Forum create(String title, String message, Userstable user, long category_id, String categoryName)
			throws AdException {
		try {
			begin();
			Forum forum = new Forum(title, message, user, category_id, categoryName);
			getSession().save(forum);
			commit();
			return forum;
		} catch (HibernateException e) {
			rollback();

			throw new AdException("Exception while creating Forum: " + e.getMessage());
		}
	}

	public void delete(Forum forum) throws AdException {
		try {
			begin();
			getSession().delete(forum);
			commit();
		} catch (HibernateException e) {
			rollback();
			throw new AdException("Could not delete Forum", e);
		}
	}
}