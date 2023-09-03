package com.example.demo.model;

import com.example.demo.entity.Users;

import lombok.Data;
@Data
public class MailUserInfo {
	String from;
	String to;
	String subject;
	Users body;

	public MailUserInfo(String to, String subject, Users body) {
		this.from = "Zuhot Store <zuhot@gmail.com>";
		this.to = to;
		this.subject = subject;
		this.body = body;
	}

}
