package com.liberation.lab.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="systemconfig")
public class SystemConfig {
	
	@Id
    @Column(name="configId")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int configId;
	
	@Column(name = "slide1")
	private String slide1;
	
	@Column(name = "slide2")
	private String slide2;
	
	@Column(name = "slide3")
	private String slide3;
	
	@Column(name = "slide4")
	private String slide4;
	
	@Column(name = "slideText1")
	private String slideText1;
	
	@Column(name = "slideText2")
	private String slideText2;
	
	@Column(name = "slideText3")
	private String slideText3;
	
	@Column(name = "slideText4")
	private String slideText4;
	
	@Column(name = "banner")
	private String banner;
	
	@Column(name = "logo")
	private String logo;
	
	@Column(name = "footerBanner")
	private String footerBanner;
	
	@Column(name = "video")
	private String video;
	
	@Column(name = "fanpage")
	private String fanpage;
	
	@Column(name = "contact")
	private String contact;

	public int getConfigId() {
		return configId;
	}

	public void setConfigId(int configId) {
		this.configId = configId;
	}

	public String getSlide1() {
		return slide1;
	}

	public void setSlide1(String slide1) {
		this.slide1 = slide1;
	}

	public String getSlide2() {
		return slide2;
	}

	public void setSlide2(String slide2) {
		this.slide2 = slide2;
	}

	public String getSlide3() {
		return slide3;
	}

	public void setSlide3(String slide3) {
		this.slide3 = slide3;
	}

	public String getSlide4() {
		return slide4;
	}

	public void setSlide4(String slide4) {
		this.slide4 = slide4;
	}

	public String getSlideText1() {
		return slideText1;
	}

	public void setSlideText1(String slideText1) {
		this.slideText1 = slideText1;
	}

	public String getSlideText2() {
		return slideText2;
	}

	public void setSlideText2(String slideText2) {
		this.slideText2 = slideText2;
	}

	public String getSlideText3() {
		return slideText3;
	}

	public void setSlideText3(String slideText3) {
		this.slideText3 = slideText3;
	}

	public String getSlideText4() {
		return slideText4;
	}

	public void setSlideText4(String slideText4) {
		this.slideText4 = slideText4;
	}

	public String getBanner() {
		return banner;
	}

	public void setBanner(String banner) {
		this.banner = banner;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	public String getFooterBanner() {
		return footerBanner;
	}

	public void setFooterBanner(String footerBanner) {
		this.footerBanner = footerBanner;
	}

	public String getVideo() {
		return video;
	}

	public void setVideo(String video) {
		this.video = video;
	}

	public String getFanpage() {
		return fanpage;
	}

	public void setFanpage(String fanpage) {
		this.fanpage = fanpage;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}
	
	
	
	
	
	
 
    

}
