package com.untoon.home.model.vo;

public class HomeUpfile implements java.io.Serializable{
	private static final long serialVersionUID = 3333L;
	
	private int huid;
	private int adid;
	private String ad_file;
	private int hid;
	private String banner1_img;
	private String logo_cat1;
	private String logo_cat2;
	private String logo_cat3;
	private String logo_cat4;
	private String logo_cat5;
	private String logo_cat6;
	private String howto_file;
	private String banner2_img;
	
	public HomeUpfile() {}

	public HomeUpfile(int huid, int adid, String ad_file, int hid, String banner1_img, String logo_cat1,
			String logo_cat2, String logo_cat3, String logo_cat4, String logo_cat5, String logo_cat6, String howto_file,
			String banner2_img) {
		super();
		this.huid = huid;
		this.adid = adid;
		this.ad_file = ad_file;
		this.hid = hid;
		this.banner1_img = banner1_img;
		this.logo_cat1 = logo_cat1;
		this.logo_cat2 = logo_cat2;
		this.logo_cat3 = logo_cat3;
		this.logo_cat4 = logo_cat4;
		this.logo_cat5 = logo_cat5;
		this.logo_cat6 = logo_cat6;
		this.howto_file = howto_file;
		this.banner2_img = banner2_img;
	}

	public int getHuid() {
		return huid;
	}

	public void setHuid(int huid) {
		this.huid = huid;
	}

	public int getAdid() {
		return adid;
	}

	public void setAdid(int adid) {
		this.adid = adid;
	}

	public String getAd_file() {
		return ad_file;
	}

	public void setAd_file(String ad_file) {
		this.ad_file = ad_file;
	}

	public int getHid() {
		return hid;
	}

	public void setHid(int hid) {
		this.hid = hid;
	}

	public String getBanner1_img() {
		return banner1_img;
	}

	public void setBanner1_img(String banner1_img) {
		this.banner1_img = banner1_img;
	}

	public String getLogo_cat1() {
		return logo_cat1;
	}

	public void setLogo_cat1(String logo_cat1) {
		this.logo_cat1 = logo_cat1;
	}

	public String getLogo_cat2() {
		return logo_cat2;
	}

	public void setLogo_cat2(String logo_cat2) {
		this.logo_cat2 = logo_cat2;
	}

	public String getLogo_cat3() {
		return logo_cat3;
	}

	public void setLogo_cat3(String logo_cat3) {
		this.logo_cat3 = logo_cat3;
	}

	public String getLogo_cat4() {
		return logo_cat4;
	}

	public void setLogo_cat4(String logo_cat4) {
		this.logo_cat4 = logo_cat4;
	}

	public String getLogo_cat5() {
		return logo_cat5;
	}

	public void setLogo_cat5(String logo_cat5) {
		this.logo_cat5 = logo_cat5;
	}

	public String getLogo_cat6() {
		return logo_cat6;
	}

	public void setLogo_cat6(String logo_cat6) {
		this.logo_cat6 = logo_cat6;
	}

	public String getHowto_file() {
		return howto_file;
	}

	public void setHowto_file(String howto_file) {
		this.howto_file = howto_file;
	}

	public String getBanner2_img() {
		return banner2_img;
	}

	public void setBanner2_img(String banner2_img) {
		this.banner2_img = banner2_img;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "HomeUpfile [huid=" + huid + ", adid=" + adid + ", ad_file=" + ad_file + ", hid=" + hid
				+ ", banner1_img=" + banner1_img + ", logo_cat1=" + logo_cat1 + ", logo_cat2=" + logo_cat2
				+ ", logo_cat3=" + logo_cat3 + ", logo_cat4=" + logo_cat4 + ", logo_cat5=" + logo_cat5 + ", logo_cat6="
				+ logo_cat6 + ", howto_file=" + howto_file + ", banner2_img=" + banner2_img + "]";
	}
	
	
	

}
