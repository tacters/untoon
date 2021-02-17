package com.untoon.member.model.vo;

import java.sql.Date;

public class Member {

		private String id;
		private String pwd;
		private String email;
		private String name;
		private String email_cert;
		private String nickname;
		private String user_lv;
		private String tchr_upload;
		private String tchr_cert;
		private String loginok;
		private String birthday;
		private String gender;
		private String phone;
		private Date enroll_date;
		private Date update_date;
		private String m_status;
		private int bank_acct;
		
		
		public Member() {}


		public Member(String id, String pwd, String email, String name, String email_cert, String nickname, String user_lv,
				String tchr_upload, String tchr_cert, String loginok, String birthday, String gender, String phone,
				Date enroll_date, Date update_date, String m_status, int bank_acct) {
			super();
			this.id = id;
			this.pwd = pwd;
			this.email = email;
			this.name = name;
			this.email_cert = email_cert;
			this.nickname = nickname;
			this.user_lv = user_lv;
			this.tchr_upload = tchr_upload;
			this.tchr_cert = tchr_cert;
			this.loginok = loginok;
			this.birthday = birthday;
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


		public String getEmail_cert() {
			return email_cert;
		}


		public void setEmail_cert(String email_cert) {
			this.email_cert = email_cert;
		}


		public String getNickname() {
			return nickname;
		}


		public void setNickname(String nickname) {
			this.nickname = nickname;
		}


		public String getUser_lv() {
			return user_lv;
		}


		public void setUser_lv(String user_lv) {
			this.user_lv = user_lv;
		}


		public String getTchr_upload() {
			return tchr_upload;
		}


		public void setTchr_upload(String tchr_upload) {
			this.tchr_upload = tchr_upload;
		}


		public String getTchr_cert() {
			return tchr_cert;
		}


		public void setTchr_cert(String tchr_cert) {
			this.tchr_cert = tchr_cert;
		}


		public String getLoginok() {
			return loginok;
		}


		public void setLoginok(String loginok) {
			this.loginok = loginok;
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
			return "Member [id=" + id + ", pwd=" + pwd + ", email=" + email + ", name=" + name + ", email_cert="
					+ email_cert + ", nickname=" + nickname + ", user_lv=" + user_lv + ", tchr_upload=" + tchr_upload
					+ ", tchr_cert=" + tchr_cert + ", loginok=" + loginok + ", birthday=" + birthday + ", gender="
					+ gender + ", phone=" + phone + ", enroll_date=" + enroll_date + ", update_date=" + update_date
					+ ", m_status=" + m_status + ", bank_acct=" + bank_acct + "]";
		}
		
		
		
	}
