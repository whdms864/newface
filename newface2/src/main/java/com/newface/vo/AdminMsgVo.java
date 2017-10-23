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

	public void setAdminmsg_num(int adminmsg_num) {
		this.adminmsg_num = adminmsg_num;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public void setSend_del(String send_del) {
		this.send_del = send_del;
	}

	public void setRecv_del(String recv_del) {
		this.recv_del = recv_del;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	
	
}
