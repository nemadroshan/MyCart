package com.nt.entity;

import java.util.Arrays;
import java.util.Base64;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Transient;
@Entity
public class Product {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int pid;
	private String pName;
	@Column(length = 3000)
	private String pDesc;
	private String pPhoto;
	private int pPrice;
	private int pDiscount;
	private int pQuantity;
	
//	@Column(name = "category_categoryId")
//	private int catId;
	@ManyToOne
	private Category category;
	
	//for image storing in db
	
	@Column(name = "image")
	private byte[] image;
	@Column
	private String imagePath;
	
	@Transient
	private String base64Image;
	
	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public Product() {
		System.out.println("Product - zero param constructor");
	}

	public Product(String pName, String pDesc, String pPhoto, int pPrice, int pDiscount, int pQuantity) {
		System.out.println("Product - param constructor");
		this.pName = pName;
		this.pDesc = pDesc;
		this.pPhoto = pPhoto;
		this.pPrice = pPrice;
		this.pDiscount = pDiscount;
		this.pQuantity = pQuantity;
	}

public Product(String pName, String pDesc, String pPhoto, int pPrice, int pDiscount, int pQuantity,
			Category category) {
		this.pName = pName;
		this.pDesc = pDesc;
		this.pPhoto = pPhoto;
		this.pPrice = pPrice;
		this.pDiscount = pDiscount;
		this.pQuantity = pQuantity;
		this.category = category;
	
	}
	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public String getpDesc() {
		return pDesc;
	}

	public void setpDesc(String pDesc) {
		this.pDesc = pDesc;
	}

	public String getpPhoto() {
		return pPhoto;
	}

	public void setpPhoto(String pPhoto) {
		this.pPhoto = pPhoto;
	}

	public int getpPrice() {
		return pPrice;
	}

	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}

	public int getpDiscount() {
		return pDiscount;
	}

	public void setpDiscount(int pDiscount) {
		this.pDiscount = pDiscount;
	}

	public int getpQuantity() {
		return pQuantity;
	}

	public void setpQuantity(int pQuantity) {
		this.pQuantity = pQuantity;
	}
	
	
	//`caluclate price by Discount
	
//	public int getCatId() {
//		return catId;
//	}
//
//	public void setCatId(int catId) {
//		this.catId = catId;
//	}

	public int getPriceafterDescount() {
		int descountAmt=0;
		descountAmt= (int) ((this.getpDiscount()/100.0) * this.getpPrice());
		return this.getpPrice()- descountAmt;
	}

	public byte[] getImage() {
		return image;
	}

	public void setImage(byte[] image) {
		this.image = image;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	
	@Transient
	public String getBase64Image() {
		if(image!=null) {
		//System.err.println("image -->" + Arrays.toString(image));
	    base64Image = Base64.getEncoder().encodeToString(this.image);
	    	return base64Image;
		}
		else {
		return pPhoto;
		}
	}
}
