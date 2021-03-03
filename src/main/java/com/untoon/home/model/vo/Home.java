package com.untoon.home.model.vo;

public class Home  implements java.io.Serializable {
	
	private static final long serialVersionUID = 3333L;
	
	private int hid;
	private String banner1_txt;
	private String search_txt;
	private String menu_cat1;
	private String menu_cat2;
	private String menu_cat3;
	private String menu_cat4;
	private String menu_cat5;
	private String menu_cat6;
	private String trending_txt;
	private String howto_title;
	private String howto_txt;
	private String banner2_txt;
	
	public Home() {}

	public Home(int hid, String banner1_txt, String search_txt, String menu_cat1, String menu_cat2, String menu_cat3,
			String menu_cat4, String menu_cat5, String menu_cat6, String trending_txt, String howto_title,
			String howto_txt, String banner2_txt) {
		super();
		this.hid = hid;
		this.banner1_txt = banner1_txt;
		this.search_txt = search_txt;
		this.menu_cat1 = menu_cat1;
		this.menu_cat2 = menu_cat2;
		this.menu_cat3 = menu_cat3;
		this.menu_cat4 = menu_cat4;
		this.menu_cat5 = menu_cat5;
		this.menu_cat6 = menu_cat6;
		this.trending_txt = trending_txt;
		this.howto_title = howto_title;
		this.howto_txt = howto_txt;
		this.banner2_txt = banner2_txt;
	}

	public int getHid() {
		return hid;
	}

	public void setHid(int hid) {
		this.hid = hid;
	}

	public String getBanner1_txt() {
		return banner1_txt;
	}

	public void setBanner1_txt(String banner1_txt) {
		this.banner1_txt = banner1_txt;
	}

	public String getSearch_txt() {
		return search_txt;
	}

	public void setSearch_txt(String search_txt) {
		this.search_txt = search_txt;
	}

	public String getMenu_cat1() {
		return menu_cat1;
	}

	public void setMenu_cat1(String menu_cat1) {
		this.menu_cat1 = menu_cat1;
	}

	public String getMenu_cat2() {
		return menu_cat2;
	}

	public void setMenu_cat2(String menu_cat2) {
		this.menu_cat2 = menu_cat2;
	}

	public String getMenu_cat3() {
		return menu_cat3;
	}

	public void setMenu_cat3(String menu_cat3) {
		this.menu_cat3 = menu_cat3;
	}

	public String getMenu_cat4() {
		return menu_cat4;
	}

	public void setMenu_cat4(String menu_cat4) {
		this.menu_cat4 = menu_cat4;
	}

	public String getMenu_cat5() {
		return menu_cat5;
	}

	public void setMenu_cat5(String menu_cat5) {
		this.menu_cat5 = menu_cat5;
	}

	public String getMenu_cat6() {
		return menu_cat6;
	}

	public void setMenu_cat6(String menu_cat6) {
		this.menu_cat6 = menu_cat6;
	}

	public String getTrending_txt() {
		return trending_txt;
	}

	public void setTrending_txt(String trending_txt) {
		this.trending_txt = trending_txt;
	}

	public String getHowto_title() {
		return howto_title;
	}

	public void setHowto_title(String howto_title) {
		this.howto_title = howto_title;
	}

	public String getHowto_txt() {
		return howto_txt;
	}

	public void setHowto_txt(String howto_txt) {
		this.howto_txt = howto_txt;
	}

	public String getBanner2_txt() {
		return banner2_txt;
	}

	public void setBanner2_txt(String banner2_txt) {
		this.banner2_txt = banner2_txt;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Home [hid=" + hid + ", banner1_txt=" + banner1_txt + ", search_txt=" + search_txt + ", menu_cat1="
				+ menu_cat1 + ", menu_cat2=" + menu_cat2 + ", menu_cat3=" + menu_cat3 + ", menu_cat4=" + menu_cat4
				+ ", menu_cat5=" + menu_cat5 + ", menu_cat6=" + menu_cat6 + ", trending_txt=" + trending_txt
				+ ", howto_title=" + howto_title + ", howto_txt=" + howto_txt + ", banner2_txt=" + banner2_txt + "]";
	}
	
	

}
