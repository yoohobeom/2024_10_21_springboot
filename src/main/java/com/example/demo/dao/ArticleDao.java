package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.demo.dto.Article;

@Mapper
public interface ArticleDao {

	@Insert("""
			INSERT INTO article
				SET regDate = NOW()
					, updateDate = NOW()
					, title = #{title}
					, `body` = #{body}
			""")
	public void writeArticle(String title, String body);

	@Select("""
			SELECT *
				FROM article
				ORDER BY id DESC
			""")
	public List<Article> getArticles();

	@Select("""
			SELECT *
				FROM article
				WHERE id = #{id}
			""")
	public Article getArticleById(int id);

	@Update("""
			<script>
			UPDATE article
				SET updateDate = NOW()
				<if test="title != null and title != ''">
					title = #{title}
				</if>
				<if test="body != null and body != ''">
					`body` = #{body}
				</if>
				WHERE id = #{id}
			</script>
			""")
	public void modifyArticle(int id, String title, String body);

	@Delete("""
			DELETE FROM article
				WHERE id = #{id}
			""")
	public void deleteArticle(int id);

	@Select("""
			SELECT *
				FROM article
				ORDER BY id DESC
				LIMIT 1;
			""")
	public Article getLastInsertArticle();
}