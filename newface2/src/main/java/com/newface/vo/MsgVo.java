package com.newface.vo;

import java.util.Date;

public class MsgVo {
	private int msg_num;
	private String content;
	private String send_del;
	private String recv_del;
	private String regdate;
	private String send_clx;
	private String chk;
	private String sender;
	private String receiver;
	
	public MsgVo() {}

	public MsgVo(int msg_num, String content, String send_del, String recv_del, String regdate, String send_clx,
			String chk, String sender, String receiver) {
		super();
		this.msg_num = msg_num;
		this.content = content;
		this.send_del = send_del;
		this.recv_del = recv_del;
		this.regdate = regdate;
		this.send_clx = send_clx;
		this.chk = chk;
		this.sender = sender;
		this.receiver = receiver;
	}

	public int getMsg_num() {
		return msg_num;
	}

	public void setMsg_num(int msg_num) {
		this.msg_num = msg_num;
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

	public String getSend_clx() {
		return send_clx;
	}

	public void setSend_clx(String send_clx) {
		this.send_clx = send_clx;
	}

	public String getChk() {
		return chk;
	}

	public void setChk(String chk) {
		this.chk = chk;
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
