package com.example.demo.service;

import org.springframework.stereotype.Service;

import com.example.demo.dao.ReplyDao;

@Service
public class ReplyService {
	
	private ReplyDao replyDao;
	
	public ReplyService(ReplyDao replyDao) {
		this.replyDao = replyDao;
	}

	public void writeReply(int loginedMemberId, String body, int articleId) {
		replyDao.writeReply(loginedMemberId, body, articleId);
	}
}