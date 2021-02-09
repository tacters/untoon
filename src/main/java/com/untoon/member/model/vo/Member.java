package com.untoon.member.model.vo;

import java.sql.Date;

public class Member {

		private String id;
		private String pwd;
		private String name;
		private String email;
		private String eamil_cert;
		private String nickname;
		private int user_lv;
		private String tcher_upload;
		private String tcher_cert;
		private String loginok;
		private String birtyday;
		private String gender;
		private String phone;
		private Date enroll_date;
		private Date update_date;
		private String m_status;
		private int bank_acct;
		
		public Member() {}

		public Member(String id, String pwd, String name, String email, String eamil_cert, String nickname, int user_lv,
				String tcher_upload, String tcher_cert, String loginok, String birtyday, String gender, String phone,
				Date enroll_date, Date update_date, String m_status, int bank_acct) {
			super();
			this.id = id;
			this.pwd = pwd;
			this.name = name;
			this.email = email;
			this.eamil_cert = eamil_cert;
			this.nickname = nickname;
			this.user_lv = user_lv;
			this.tcher_upload = tcher_upload;
			this.tcher_cert = tcher_cert;
			this.loginok = loginok;
			this.birtyday = birtyday;
			this.gender = gender;
			this.phone = phone;
			this.enroll_date = enroll_date;
			this.update_date = update_date;
			this.m_status = m_status;
			this.bank_acct = bank_acct;
		}

		public String getId() {
			return id;
		}

		public void setId(String id) {
			this.id = id;
		}

		public String getPwd() {
			return pwd;
		}

		public void setPwd(String pwd) {
			this.pwd = pwd;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}

		public String getEamil_cert() {
			return eamil_cert;
		}

		public void setEamil_cert(String eamil_cert) {
			this.eamil_cert = eamil_cert;
		}

		public String getNickname() {
			return nickname;
		}

		public void setNickname(String nickname) {
			this.nickname = nickname;
		}

		public int getUser_lv() {
			return user_lv;
		}

		public void setUser_lv(int user_lv) {
			this.user_lv = user_lv;
		}

		public String getTcher_upload() {
			return tcher_upload;
		}

		public void setTcher_upload(String tcher_upload) {
			this.tcher_upload = tcher_upload;
		}

		public String getTcher_cert() {
			return tcher_cert;
		}

		public void setTcher_cert(String tcher_cert) {
			this.tcher_cert = tcher_cert;
		}

		public String getLoginok() {
			return loginok;
		}

		public void setLoginok(String loginok) {
			this.loginok = loginok;
		}

		public String getBirtyday() {
			return birtyday;
		}

		public void setBirtyday(String birtyday) {
			this.birtyday = birtyday;
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

		public Date getEnroll_date() {
			return enroll_date;
		}

		public void setEnroll_date(Date enroll_date) {
			this.enroll_date = enroll_date;
		}

		public Date getUpdate_date() {
			return update_date;
		}

		public void setUpdate_date(Date update_date) {
			this.update_date = update_date;
		}

		public String getM_status() {
			return m_status;
		}

		public void setM_status(String m_status) {
			this.m_status = m_status;
		}

		public int getBank_acct() {
			return bank_acct;
		}

		public void setBank_acct(int bank_acct) {
			this.bank_acct = bank_acct;
		}

		@Override
		public String toString() {
			return "Member [id=" + id + ", pwd=" + pwd + ", name=" + name + ", email=" + email + ", eamil_cert="
					+ eamil_cert + ", nickname=" + nickname + ", user_lv=" + user_lv + ", tcher_upload=" + tcher_upload
					+ ", tcher_cert=" + tcher_cert + ", loginok=" + loginok + ", birtyday=" + birtyday + ", gender="
					+ gender + ", phone=" + phone + ", enroll_date=" + enroll_date + ", update_date=" + update_date
					+ ", m_status=" + m_status + ", bank_acct=" + bank_acct + "]";
		}
		
		
		
}
