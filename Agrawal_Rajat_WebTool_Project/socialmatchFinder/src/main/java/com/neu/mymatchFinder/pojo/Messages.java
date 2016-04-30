package com.neu.mymatchFinder.pojo;

import static javax.persistence.GenerationType.IDENTITY;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "messages")

public class Messages {

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "InboxId", unique = true, nullable = false)

	private int inboxId;

	@Column(name = "Message")
	private String message;

	// Inbox-->User
	@ManyToOne
	@JoinColumn(name = "toUser")
	private Userstable toUser;

	// Inbox-->User
	@ManyToOne
	@JoinColumn(name = "fromUser")
	private Userstable fromUser;

	@Column(name = "isRead")
	private boolean isRead;

	@Column(name = "DateOfMessage")
	private Date dateOfMessage;

	public Date getDateOfMessage() {
		return dateOfMessage;
	}

	public void setDateOfMessage(Date dateOfMessage) {
		this.dateOfMessage = dateOfMessage;
	}

	public boolean isRead() {
		return isRead;
	}

	public void setRead(boolean isRead) {
		this.isRead = isRead;
	}

	public int getInboxId() {
		return inboxId;
	}

	public void setInboxId(int inboxId) {
		this.inboxId = inboxId;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Userstable getToUser() {
		return toUser;
	}

	public void setToUser(Userstable toUser) {
		this.toUser = toUser;
	}

	public Userstable getFromUser() {
		return fromUser;
	}

	public void setFromUser(Userstable fromUser) {
		this.fromUser = fromUser;
	}

}
