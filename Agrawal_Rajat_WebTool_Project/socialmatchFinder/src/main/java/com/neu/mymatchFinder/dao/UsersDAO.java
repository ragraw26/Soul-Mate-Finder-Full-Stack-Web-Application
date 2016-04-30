package com.neu.mymatchFinder.dao;

import java.util.ArrayList;
import java.util.Date;

import org.hibernate.HibernateException;
import org.hibernate.Query;

import com.neu.mymatchFinder.pojo.Contacts;
import com.neu.mymatchFinder.pojo.UserAccount;
import com.neu.mymatchFinder.pojo.Userstable;

public class UsersDAO extends DAO {

	public UsersDAO() {
	}

	public UserAccount UserByUserName(String username) {
		UserAccount user = null;
		try {
			Query q = getSession().createQuery("from UserAccount where username = :username");
			q.setString("username", username);
			user = (UserAccount) q.uniqueResult();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;

	}

	public UserAccount queryUserByUserNameAndPassword(String username, String password) throws Exception {
		try {
			
			Query q = getSession()
					.createQuery("from UserAccount where username = :username1 and password = :password1");

			q.setString("username1", username);
			q.setString("password1", password);
			UserAccount user = (UserAccount) q.uniqueResult();
						
			//System.out.println(user.getUserId());

			return user;
		} catch (HibernateException e) {
			throw new Exception("Could not get user " + username, e);
		}
	}

	public UserAccount create(UserAccount userAccount) {
		// TODO Auto-generated method stub

		try {
			begin();
			Date date = new Date();

			String userName = userAccount.getUserName();
			String userPassword = userAccount.getUserPassword();

			userAccount.setUsername(userName);
			userAccount.setPassword(userPassword);
			userAccount.setRole("user");
			userAccount.setRegisterDate(date);
			userAccount.setLastLoginDate(date);

			getSession().save(userAccount);
			commit();
			return userAccount;

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			close();
		}
		return userAccount;

	}

	public UserAccount editDetails(UserAccount u) {
		try {
			begin();
			Date date = new Date();
			u.setLastLoginDate(date);				

			getSession().update(u);
			commit();

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			close();
		}
		return u;
	}
	
	
	public void deleteUser(UserAccount u, int UserID) {
		try {
			begin();			
			Query q = getSession().createQuery("delete from UserAccount where userId = :userid");
			Query query = getSession().createQuery("delete from Contacts where (toUser = :userid or fromUser = :userid)");
			q.setInteger("userid", UserID);
			query.setInteger("userid", UserID);
			int r = query.executeUpdate();
			int result = q.executeUpdate();		
			
			commit();

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			close();
		}
		
	}

	public String searchAll(UserAccount user, String value, ArrayList<Contacts> contactList) {
		Query q = getSession().createQuery(
				"from Userstable where (userfullName LIKE :value OR userId LIKE :value) and userId != :userId");
		q.setString("value", value + "%");
		q.setInteger("userId", user.getUserId());
		ArrayList<Userstable> result = (ArrayList<Userstable>) q.list();
		StringBuilder html = new StringBuilder();

		for (Userstable u : result) {
			String action = "sendRequest";
			String btnFriend = "<button type='submit' class='pull-right btn btn-primary btn-sm'>Show Interest</button></h3></form>";
			String decline = "";

			for (Contacts c : contactList) {
				if (((u.getUserId() == c.getToUser()) || (u.getUserId() == c.getFromUser())) && c.isAccepted()) {
					decline = "<a href='getMessage?userId=" + u.getUserId()
							+ "' class='pull-right btn btn-warning btn-sm'>Send Message</a></h3>" + "</form>";
					action = "unFriend";
					btnFriend = "<button type='submit' class='pull-right btn btn-danger btn-sm'>Remove Interest</button></form>";
					break;
				} else if ((u.getUserId() == c.getToUser()) && !c.isAccepted()) {
					decline = "";
					action = "profile";
					btnFriend = "<button type='submit' disabled class='pull-right btn btn-primary btn-sm'>Interest Sent</button></h3></form>";
					break;
				} else if ((u.getUserId() == c.getFromUser()) && !c.isAccepted()) {
					action = "acceptRequest";
					btnFriend = "<button type='submit' class='pull-right btn btn-primary btn-sm'>Accept Interest</button></form>";
					decline = "<form method='POST' class='pull-right' action='unFriend'>"
							+ "<button type='submit' name='submitDecline' class='pull-right btn btn-danger btn-sm'>Decline Interest</button></h3>"
							+ "<input type='hidden' name='userId' value='" + u.getUserId() + "' />" + "</form>";
					break;
				}
			}


			html.append("<div class='row mtpost'>" + "<div class='form-panel'>" + "<form method='POST' action='"
					+ action + "'>" + "" + "<input type='hidden' name='userId' value='" + u.getUserId() + "'/>"
					+ "<h3><i class='fa fa-angle-right'></i><a href='profile?userId=" + u.getUserId() + "'><img src='${pageContext.servletContext.contextPath}/resources/img/default.jpg' width=150 height=150 class='img-circle' /> " + u.getUserfullName()
					+ "</a>" + btnFriend + decline + "</div></div>");

		}
		return html.toString();
	}

	public ArrayList<Userstable> getUsersByIds(ArrayList<Integer> usersIds) {
		ArrayList<Userstable> users;

		if (usersIds.size() > 0) {
			Query q = getSession().createQuery("from Userstable where userId in (:usersIds)");
			q.setParameterList("usersIds", usersIds);
			users = (ArrayList<Userstable>) q.list();
		} else
			users = new ArrayList<Userstable>();

		return users;
	}
	
	public ArrayList<UserAccount> getAllUser(UserAccount u) {
		ArrayList<UserAccount> users;

		
			Query q = getSession().createQuery("from Userstable where userId not in (:usersId)");
			q.setParameter("usersId", u.getUserId());
			users = (ArrayList<UserAccount>) q.list();

		return users;
	}

	public Userstable getUsersByIds(int userId) {
		Query q = getSession().createQuery("from Userstable where userId = :userId");
		q.setInteger("userId", userId);
		Userstable user = (Userstable) q.uniqueResult();
		return user;
	}

	public UserAccount resetPassword(UserAccount ua) {
		// TODO Auto-generated method stub
		try {
			begin();
			Date date = new Date();
			ua.setLastLoginDate(date);		

			getSession().update(ua);
			commit();

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			close();
		}
		return ua;
		
	}
	
	
	public String searchAllUsers(UserAccount user, String gender, String country, String city,ArrayList<Contacts> contactList) {
		// TODO Auto-generated method stub
		Query q = getSession().createQuery(
				"from Userstable where (gender LIKE :gender AND city LIKE :city) and userId != :userId");
		
		q.setInteger("userId",user.getUserId());
		q.setString("gender",gender);		
		q.setString("city",city);		;
		ArrayList<Userstable> result = (ArrayList<Userstable>) q.list();
		StringBuilder html = new StringBuilder();

		for (Userstable u : result) {
			String action = "sendRequest";
			String btnFriend = "<button type='submit' class='pull-right btn btn-primary btn-sm'>Show Interest</button></h3></form>";
			String decline = "";

			for (Contacts c : contactList) {
				if (((u.getUserId() == c.getToUser()) || (u.getUserId() == c.getFromUser())) && c.isAccepted()) {
					decline = "<a href='getMessage?userId=" + u.getUserId()
							+ "' class='pull-right btn btn-warning btn-sm'>Send Message</a></h3>" + "</form>";
					action = "unFriend";
					btnFriend = "<button type='submit' class='pull-right btn btn-danger btn-sm'>Remove Interest</button></form>";
					break;
				} else if ((u.getUserId() == c.getToUser()) && !c.isAccepted()) {
					decline = "";
					action = "profile";
					btnFriend = "<button type='submit' disabled class='pull-right btn btn-primary btn-sm'>Interest Sent</button></h3></form>";
					break;
				} else if ((u.getUserId() == c.getFromUser()) && !c.isAccepted()) {
					action = "acceptRequest";
					btnFriend = "<button type='submit' class='pull-right btn btn-primary btn-sm'>Accept Interest</button></form>";
					decline = "<form method='POST' class='pull-right' action='unFriend'>"
							+ "<button type='submit' name='submitDecline' class='pull-right btn btn-danger btn-sm'>Decline Interest</button></h3>"
							+ "<input type='hidden' name='userId' value='" + u.getUserId() + "' />" + "</form>";
					break;
				}
			}

			html.append("<div class='row mtpost'>" + "<div class='form-panel'>" + "<form method='POST' action='"
					+ action + "'>" + "" + "<input type='hidden' name='userId' value='" + u.getUserId() + "'/>"
					+ "<h3><i class='fa fa-angle-right'></i><a href='profile?userId=" + u.getUserId() + "'><img src='${pageContext.servletContext.contextPath}/resources/img/default.jpg' width=150 height=150 class='img-circle' /> " + u.getUserfullName()
					+ "</a>" + btnFriend + decline + "</div></div>");

		}
		return html.toString();
	
	}

}
