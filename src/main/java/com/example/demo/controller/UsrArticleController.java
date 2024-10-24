package com.example.demo.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dto.Article;
import com.example.demo.dto.ResultData;
import com.example.demo.service.ArticleService;
import com.example.demo.util.Util;

@Controller
public class UsrArticleController {
	
	private ArticleService articleService;
	
	public UsrArticleController(ArticleService articleService) {
		this.articleService = articleService;
	}
	
	@GetMapping("/usr/article/doWrite")
	@ResponseBody
	public ResultData<Article> doWrite(String title, String body) {
		
		if (Util.isEmpty(title)) {
			return ResultData.from("F-1", "제목을 입력해주세요");
		}
		
		if (Util.isEmpty(body)) {
			return ResultData.from("F-2", "내용을 입력해주세요");
		}
		
		articleService.writeArticle(title, body);
		
		int id = articleService.getLastInsertId();
		
		return ResultData.from("S-1", String.format("%d번 게시물을 작성했습니다", id), articleService.getArticleById(id));
	}

	@GetMapping("/usr/article/showList")
	@ResponseBody
	public ResultData<List<Article>> showList() {
		
		List<Article> articles = articleService.getArticles();
		
		if (articles.size() == 0) {
			return ResultData.from("F-1", "게시물이 존재하지 않습니다");
		}
		
		return ResultData.from("S-1", "리스트 조회 성공", articles);
	}
	
	
	@GetMapping("/usr/article/showDetail")
	@ResponseBody
	public ResultData<Article> showDetail(int id) {
		
		Article foundArticle = articleService.getArticleById(id);
		
		if (foundArticle == null) {
			return ResultData.from("F-1", String.format("%d번 게시물은 존재하지 않습니다", id));
		}
		
		return ResultData.from("S-1", String.format("%d번 게시물 상세보기", id), foundArticle);
	}
	
	@GetMapping("/usr/article/doModify")
	@ResponseBody
	public ResultData<Article> doModify(int id, String title, String body) {
		
		Article foundArticle = articleService.getArticleById(id);
		
		if (foundArticle == null) {
			return ResultData.from("F-1", String.format("%d번 게시물은 존재하지 않습니다", id));
		}
		
		articleService.modifyArticle(id, title, body);
		
		return ResultData.from("S-1", String.format("%d번 게시물을 수정했습니다", id), articleService.getArticleById(id));
	}

	@GetMapping("/usr/article/doDelete")
	@ResponseBody
	public ResultData doDelete(int id) {
		
		Article foundArticle = articleService.getArticleById(id);
		
		if (foundArticle == null) {
			return ResultData.from("F-1", String.format("%d번 게시물은 존재하지 않습니다", id));
		}
		
		articleService.deleteArticle(id);
		return ResultData.from("S-1", String.format("%d번 게시물을 삭제했습니다", id));
	}
}