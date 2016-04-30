package com.neu.mymatchFinder.pojo;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Category {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "categoryid", unique = true, nullable = false)
	private long id;

	@Column(name = "title")
	private String title;

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "category")
	private Set<Forum> forums = new HashSet<Forum>();

	public Category(String title) {
		this.title = title;
		this.forums = new HashSet<Forum>();
	}

	Category() {
	}

	public Set<Forum> getForums() {
		return forums;
	}

	public void setForums(Set<Forum> forums) {
		this.forums = forums;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

}
