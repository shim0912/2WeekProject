package com.pr.dto;

public class UserDto {
	private int pr_no;
	private String pr_id;
	private String pr_pw;
	private String pr_name;
	private String pr_addr;
	private String pr_phone;
	private String pr_email;
	private String pr_enabled;
	private String pr_role;

	public UserDto() {
		super();
	}

	public UserDto(int pr_no, String pr_id, String pr_pw, String pr_name, String pr_addr, String pr_phone,
			String pr_email, String pr_enabled, String pr_role) {
		super();
		this.pr_no = pr_no;
		this.pr_id = pr_id;
		this.pr_pw = pr_pw;
		this.pr_name = pr_name;
		this.pr_addr = pr_addr;
		this.pr_phone = pr_phone;
		this.pr_email = pr_email;
		this.pr_enabled = pr_enabled;
		this.pr_role = pr_role;
	}

	public int getPr_no() {
		return pr_no;
	}

	public void setPr_no(int pr_no) {
		this.pr_no = pr_no;
	}

	public String getPr_id() {
		return pr_id;
	}

	public void setPr_id(String pr_id) {
		this.pr_id = pr_id;
	}

	public String getPr_pw() {
		return pr_pw;
	}

	public void setPr_pw(String pr_pw) {
		this.pr_pw = pr_pw;
	}

	public String getPr_name() {
		return pr_name;
	}

	public void setPr_name(String pr_name) {
		this.pr_name = pr_name;
	}

	public String getPr_addr() {
		return pr_addr;
	}

	public void setPr_addr(String pr_addr) {
		this.pr_addr = pr_addr;
	}

	public String getPr_phone() {
		return pr_phone;
	}

	public void setPr_phone(String pr_phone) {
		this.pr_phone = pr_phone;
	}

	public String getPr_email() {
		return pr_email;
	}

	public void setPr_email(String pr_email) {
		this.pr_email = pr_email;
	}

	public String getPr_enabled() {
		return pr_enabled;
	}

	public void setPr_enabled(String pr_enabled) {
		this.pr_enabled = pr_enabled;
	}

	public String getPr_role() {
		return pr_role;
	}

	public void setPr_role(String pr_role) {
		this.pr_role = pr_role;
	}

	@Override
	public String toString() {
		return "userDto [pr_no=" + pr_no + ", pr_id=" + pr_id + ", pr_pw=" + pr_pw + ", pr_name=" + pr_name
				+ ", pr_addr=" + pr_addr + ", pr_phone=" + pr_phone + ", pr_email=" + pr_email + ", pr_enabled="
				+ pr_enabled + ", pr_role=" + pr_role + "]";
	}
}
