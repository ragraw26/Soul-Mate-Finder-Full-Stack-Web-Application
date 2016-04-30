package com.neu.mymatchFinder.pojo;

import static javax.persistence.GenerationType.IDENTITY;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "comments")
public class Comments {

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "CommentId", unique = true, nullable = false)
	private int cId;

	@Column(name = "Comment")
	private String comment;

	@Column(name = "DateOfComment")
	private Date dateOfComment;

	// Person-->Comments
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "UserID")
	private Userstable userstable;

	@ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinColumn(name = "PostId")
	private Posts posts;

	public Posts getPosts() {
		return posts;
	}

	public void setPosts(Posts posts) {
		this.posts = posts;
	}

	public Userstable getUserstable() {
		return userstable;
	}

	public void setUserstable(Userstable userstable) {
		this.userstable = userstable;
	}

	public int getcId() {
		return cId;
	}

	public void setcId(int cId) {
		this.cId = cId;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public Date getDateOfComment() {
		return dateOfComment;
	}

	public void setDateOfComment(Date dateOfComment) {
		this.dateOfComment = dateOfComment;
	}

}
