package com.untoon.member.model.vo;

import java.sql.Date;

public class PayMember {
	
	private String id;
	private String email;
	private String name;
	private String nickname;
	private String birthday;
	private String gender;
	private String phone;
	private String pid;
	private int cid;
	private int pstatus;
	
	public PayMember() {}

	public PayMember(String id, String email, String name, String nickname, String birthday, String gender,
			String phone, String pid, int cid, int pstatus) {
		super();
		this.id = id;
		this.email = email;
		this.name = name;
		this.nickname = nickname;
		this.birthday = birthday;
		this.gender = gender;
		this.phone = phone;
		this.pid = pid;
		this.cid = cid;
		this.pstatus = pstatus;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public int getPstatus() {
		return pstatus;
	}

	public void setPstatus(int pstatus) {
		this.pstatus = pstatus;
	}

	@Override
	public String toString() {
		return "PayMember [id=" + id + ", email=" + email + ", name=" + name + ", nickname=" + nickname + ", birthday="
				+ birthday + ", gender=" + gender + ", phone=" + phone + ", pid=" + pid + ", cid=" + cid + ", pstatus="
				+ pstatus + "]";
	}
	
	
	
}
