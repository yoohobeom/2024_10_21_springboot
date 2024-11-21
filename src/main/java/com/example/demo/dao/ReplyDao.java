package com.example.demo.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReplyDao {

	@Insert("""
			INSERT INTO reply
				SET regDate = NOW()
			        , updateDate = NOW()
			        , memberId = #{loginedMemberId}
			        , relTypeCode = 'article'
			        , relId = #{articleId}
			        , `body` = #{body};
			""")
	void writeReply(int loginedMemberId, String body, int articleId);

}