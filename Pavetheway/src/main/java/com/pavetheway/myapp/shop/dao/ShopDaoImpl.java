package com.pavetheway.myapp.shop.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.pavetheway.myapp.shop.dto.ShopDto;

@Repository
public class ShopDaoImpl implements ShopDao {

	@Autowired
	private SqlSession session;
	/*
	 * Mapper's namespace : shop
	 * sql's id : getList
	 * parameterType : ShopDto
	 * resultType : ShopDto
	 */
	//shop 의 모든 리스트 가져오기
	@Override
	public List<ShopDto> getList(ShopDto dto) {
		
		return session.selectList("shop.getList", dto);
	}
	/*
	 * Mapper's namespace : shop
	 * sql's id : getCount
	 * resultType : int
	 */
	//row 의 총 개수 구하기
	@Override
	public int getCount(ShopDto dto) {
		return session.selectOne("shop.getCount",dto);
	}
	/*
	 * Mapper's namespace : shop
	 * sql's id : getDetail
	 * parameterType : int
	 * resultType : ShopDto
	 */
	//DB 에서 상품리스트 하나의 정보를 가져오기
	@Override
	public ShopDto getDetail(int num) {
		return session.selectOne("shop.getDetail", num);
	}
	/*
	 * Mapper's namespace : shop
	 * sql's id : getData
	 * resultType : ShopDto
	 */
	//키워드를 활용한 상품 data 얻어오기
	@Override
	public ShopDto getData(ShopDto dto) {
		
		return session.selectOne("shop.getData", dto);
	}
	/*
	 * Mapper's namespace : shop
	 * sql's id : insert
	 * parameterType : ShopDto
	 */
	@Override
	public void insert(ShopDto dto) {
		session.insert("shop.insert", dto);
		
	}
	
}