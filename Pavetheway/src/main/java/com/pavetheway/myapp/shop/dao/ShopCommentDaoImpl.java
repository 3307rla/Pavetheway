package com.pavetheway.myapp.shop.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pavetheway.myapp.shop.dto.ShopCommentDto;


@Repository
public class ShopCommentDaoImpl implements ShopCommentDao{
	
	@Autowired
	private SqlSession session;

	@Override
	public List<ShopCommentDto> getList(ShopCommentDto dto) {
		
		return session.selectList("shopComment.getList", dto);
	}

	@Override
	public void delete(int num) {
		
		session.delete("shopComment.delete", num);
		
	}

	@Override
	public void insert(ShopCommentDto dto) {
		
		session.insert("shopComment.insert", dto);
		
	}

	@Override
	public int getSequence() {
		
		return session.selectOne("shopComment.getSequence");
	}

	@Override
	public void update(ShopCommentDto dto) {
		
		session.update("shopComment.update", dto);
		
	}

	@Override
	public ShopCommentDto getData(int num) {
		
		return session.selectOne("shopComment.getData", num);
	}

	@Override
	public int getCount(int ref_group) {
		
		return session.selectOne("shopComment.getCount", ref_group);
	}
}
