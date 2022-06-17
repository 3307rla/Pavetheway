package com.pavetheway.myapp.shop.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.pavetheway.myapp.shop.dto.ReviewDto;

public class ReviewDaoImpl implements ReviewDao {
    
	@Autowired
	private SqlSession session;
	
	/*
	 *  mapper's namespace : review
	 *  sql's id : insert
	 *  parameterType : ReviewDto
	 */
	@Override
	public void insert(ReviewDto dto) {
		
		session.insert("review.insert", dto);
		
	}
	/*
	 * Mapper's namespace : review
	 * sql's id : getData
	 * parameterType : int
	 * resultType : ReviewDto
	 */
	@Override
	public ReviewDto getData(int num) {
		
		return session.selectOne("review.getData", num);
	}
	/*
	 * Mapper's namespace : review
	 * sql's id : delete
	 * parameterType : int
	 */
	@Override
	public void delete(int num) {
		session.delete("file.delete", num);
		
	}
	/*
	 * Mapper's namespace : review
	 * sql's id : getList
	 * parameterType : ReviewDto
	 * resultType : ReviewDto
	 */
	@Override
	public List<ReviewDto> getList(ReviewDto dto) {
		
		return session.selectList("review.getList", dto);
	}
	/*
	 * Mapper's namespace : review
	 * sql's id : getCount
	 * parameterType : ReviewDto
	 * resultType : int
	 */
	@Override
	public int getCount(ReviewDto dto) {
		
		return session.selectOne("review.getCount", dto);
	}
	
	
}
