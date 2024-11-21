package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dto.Rq;
import com.example.demo.service.ReplyService;
import com.example.demo.util.Util;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class UsrReplyController {

	private ReplyService replyService;

	public UsrReplyController(ReplyService replyService) {
		this.replyService = replyService;
	}
	
	@PostMapping("/usr/article/doReply")
	@ResponseBody
	public String doReply(HttpServletRequest req, String body, int articleId) {
		
		Rq rq = (Rq) req.getAttribute("rq");
		
		replyService.writeReply(rq.getLoginedMemberId(), body, articleId);
		
		return Util.jsReturn("댓글작성완료", String.format("detail?id=%d", articleId));
	}
}