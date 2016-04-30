package com.neu.mymatchFinder.pojo;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Transient;

@Entity
public class Forum {

	@Id
	@GeneratedValue
	@Column(name = "forumid", unique = true, nullable = false)
	private long id;

	@Column(name = "title")
	private String title;

	@Column(name = "message")
	private String message;

	@Transient
	private String postedBy;

	// keep one and comment other and vice-versa to explain the result in
	// console
	@ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinColumn(name = "UserID")
	private Userstable userstable;

	@Transient
	private String category_name;

	public Userstable getUserstable() {
		return userstable;
	}

	public void setUserstable(Userstable userstable) {
		this.userstable = userstable;
	}

	@JoinColumn(name = "categoryid")
	private long category;

	public Forum(String title, String message, Userstable user, long category_id, String categoryName) {
		this.title = title;
		this.message = message;
		this.userstable = user;
		this.category = category_id;
		this.category_name = categoryName;
	}

	public Forum() {
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	protected long getId() {
		return id;
	}

	protected void setId(long id) {
		this.id = id;
	}

	public String getCategory_name() {
		return category_name;
	}

	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}

	public String getPostedBy() {
		return this.postedBy;
	}

	public void setPostedBy(String pb) {
		this.postedBy = pb;
	}

	public long getCategory() {
		return category;
	}

	public void setCategory(long category) {
		this.category = category;
	}

}
