package com.nt.entity;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Transient;

@Entity
public class Category {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int categoryId;
	private String categoryTitle;
	private String categoryDecription;

	@OneToMany(mappedBy = "category")
	// @OneToMany(cascade = CascadeType.ALL,targetEntity = Product.class)
	private List<Product> products;
	
	@Transient
	private boolean select;

	public Category() {
		System.out.println("Category.Category()");
	}

	public Category(String categoryTitle, String categoryDecription) {
		System.out.println("Category() ::: two param construcor");
		this.categoryTitle = categoryTitle;
		this.categoryDecription = categoryDecription;
	}

	public Category(int categoryId, String categoryTitle, String categoryDecription, List<Product> products) {
		this.categoryId = categoryId;
		this.categoryTitle = categoryTitle;
		this.categoryDecription = categoryDecription;
		this.products = products;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public String getCategoryTitle() {
		return categoryTitle;
	}

	public void setCategoryTitle(String categoryTitle) {
		this.categoryTitle = categoryTitle;
	}

	public String getCategoryDecription() {
		return categoryDecription;
	}

	public void setCategoryDecription(String categoryDecription) {
		this.categoryDecription = categoryDecription;
	}

	public List<Product> getProducts() {
		return products;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}

	@Override
	public String toString() {
		return "Category [categoryId=" + categoryId + ", categoryTitle=" + categoryTitle + ", categoryDecription="
				+ categoryDecription + "]";
	}

	public boolean isSelect() {
		return select;
	}

	public void setSelect(boolean select) {
		this.select = select;
	}
	
	

}
