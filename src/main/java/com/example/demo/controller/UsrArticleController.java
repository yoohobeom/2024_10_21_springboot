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
	public ResultData doWrite(String title, String body) {
		
		if (Util.isEmpty(title)) {
			return ResultData.from("F-1", "제목 을(를) 입력해주세요");
		}
		
		if (Util.isEmpty(body)) {
			return ResultData.from("F-2", "내용 을(를) 입력해주세요");
		}
		
		articleService.writeArticle(title, body);

//		Article article = articleService.getLastInsertArticle();

		return ResultData.from("S-1", "게시물 작성성공", articleService.getLastInsertArticle());
	}

	@GetMapping("/usr/article/showList")
	@ResponseBody
	public List<Article> showList() {
		return articleService.getArticles();
	}

	@GetMapping("/usr/article/showDetail")
	@ResponseBody
	public Object showDetail(int id) {

		Article foundArticle = articleService.getArticleById(id);

		if (foundArticle == null) {
			return ResultData.from("F-3", String.format("[ %d ]번 게시물은 존재하지 않습니다", id));
		}

		return foundArticle;
	}

	@GetMapping("/usr/article/doModify")
	@ResponseBody
	public ResultData doModify(int id, String title, String body) {

		Article foundArticle = articleService.getArticleById(id);

		if (foundArticle == null) {
			return ResultData.from("F-3", String.format("[ %d ]번 게시물은 존재하지 않습니다", id));
		}

		articleService.modifyArticle(id, title, body);

		return ResultData.from("S-2", String.format("[ %d ]번 게시물을 정상적으로 수정했습니다", id));
	}

	@GetMapping("/usr/article/doDelete")
	@ResponseBody
	public ResultData doDelete(int id) {

		Article foundArticle = articleService.getArticleById(id);

		if (foundArticle == null) {
			return ResultData.from("F-3", String.format("[ %d ]번 게시물은 존재하지 않습니다", id));
		}

		articleService.deleteArticle(id);

		return ResultData.from("S-3", String.format("[ %d ]번 게시물을 정상적으로 삭제했습니다", id));
	}
}