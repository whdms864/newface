package com.newface.vo;

public class AdminMsgVo {
	private int adminmsg_num;
	private String content;
	private String send_del;
	private String recv_del;
	private String regdate;
	private String sender;
	private String receiver;
	
	public AdminMsgVo() {}

	public AdminMsgVo(int adminmsg_num, String content, String send_del, String recv_del, String regdate, String sender,
			String receiver) {
		super();
		this.adminmsg_num = adminmsg_num;
		this.content = content;
		this.send_del = send_del;
		this.recv_del = recv_del;
		this.regdate = regdate;
		this.sender = sender;
		this.receiver = receiver;
	}

	public int getAdminmsg_num() {
		return adminmsg_num;
	}

	public void setAdminmsg_num(int adminmsg_num) {
		this.adminmsg_num = adminmsg_num;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getSend_del() {
		return send_del;
	}

	public void setSend_del(String send_del) {
		this.send_del = send_del;
	}

	public String getRecv_del() {
		return recv_del;
	}

	public void setRecv_del(String recv_del) {
		this.recv_del = recv_del;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	
	
}
