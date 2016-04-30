package com.neu.mymatchFinder.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="contacts")

public class Contacts {	

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "RelationId", unique = true, nullable = false)
	private int relationId;
	
	@Column(name="toUser")
	private int toUser;
	
	@Column(name="fromUser")
	private int fromUser;
	
	@Column(name="isAccepted")
	private boolean isAccepted;

	public int getRelationId() {
		return relationId;
	}

	public void setRelationId(int relationId) {
		this.relationId = relationId;
	}

	public int getToUser() {
		return toUser;
	}

	public void setToUser(int toUser) {
		this.toUser = toUser;
	}

	public int getFromUser() {
		return fromUser;
	}

	public void setFromUser(int fromUser) {
		this.fromUser = fromUser;
	}

	public boolean isAccepted() {
		return isAccepted;
	}

	public void setAccepted(boolean isAccepted) {
		this.isAccepted = isAccepted;
	}
	
	
}
