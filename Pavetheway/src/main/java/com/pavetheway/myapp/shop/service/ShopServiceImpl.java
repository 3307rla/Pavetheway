package com.pavetheway.myapp.shop.service;

import java.io.File;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.pavetheway.myapp.cart.dto.CartDto;
import com.pavetheway.myapp.exception.NotDeleteException;
import com.pavetheway.myapp.shop.dao.OrderDao;
import com.pavetheway.myapp.shop.dao.ShopCommentDao;
import com.pavetheway.myapp.shop.dao.ShopDao;
import com.pavetheway.myapp.shop.dto.OrderDto;
import com.pavetheway.myapp.shop.dto.ShopCommentDto;
import com.pavetheway.myapp.shop.dto.ShopDto;

@Service
public class ShopServiceImpl implements ShopService{
    
	@Autowired ShopDao dao;
	
	@Autowired
	private ShopCommentDao shopCommentDao;
	
	@Autowired
	private OrderDao orderDao;

	@Override
	//상품 list
	public void getList(HttpServletRequest request) {
		//한 페이지에 몇개씩 표시할 것인지
		final int PAGE_ROW_COUNT=8;
		//하단 페이지를 몇개씩 표시할 것인지
		final int PAGE_DISPLAY_COUNT=5;
	    
		String category = request.getParameter("category");
		
		//보여줄 페이지의 번호를 일단 1이라고 초기값 지정
		int pageNum=1;
		//페이지 번호가 파라미터로 전달되는지 읽어와 본다.
		String strPageNum = request.getParameter("pageNum");
		//만일 페이지 번호가 파라미터로 넘어 온다면
		if(strPageNum != null){
			//숫자로 바꿔서 보여줄 페이지 번호로 지정한다.
			pageNum=Integer.parseInt(strPageNum);
		}
	   
		//보여줄 페이지의 시작 ROWNUM
		int startRowNum = 1 + (pageNum-1) * PAGE_ROW_COUNT;
		//보여줄 페이지의 끝 ROWNUM
		int endRowNum = pageNum * PAGE_ROW_COUNT;
	   
		
		
		/*
		[ 검색 키워드에 관련된 처리 ]
		-검색 키워드가 파라미터로 넘어올수도 있고 안넘어 올수도 있다.		
		*/
		String keyword=request.getParameter("keyword");
		String condition=request.getParameter("condition");
		//만일 키워드가 넘어오지 않는다면 
		if(keyword==null){
			//키워드와 검색 조건에 빈 문자열을 넣어준다. 
			//클라이언트 웹브라우저에 출력할때 "null" 을 출력되지 않게 하기 위해서  
			keyword="";
			condition=""; 
		}
	
		//특수기호를 인코딩한 키워드를 미리 준비한다. 
		String encodedK=URLEncoder.encode(keyword);
		
		//startRowNum 과 endRowNum  을 ShopDto 객체에 담고
		ShopDto dto = new ShopDto();
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);
		dto.setCategory(category);
	
		//만일 검색 키워드가 넘어온다면 
		if(!keyword.equals("")){
			//검색 조건이 무엇이냐에 따라 분기 하기
			if(condition.equals("name")){//제목 + 내용 검색인 경우
				//검색 키워드를 InquiryDto 에 담아서 전달한다.
				dto.setName(keyword);
				
			}// 다른 검색 조건을 추가 하고 싶다면 아래에 else if() 를 계속 추가 하면 된다.
		}
	   
		//ShopDao 객체를 이용해서 상품목록을 얻어온다.
		List<ShopDto> list = dao.getList(dto);
	   
		//하단 시작 페이지 번호 
		int startPageNum = 1 + ((pageNum-1)/PAGE_DISPLAY_COUNT) * PAGE_DISPLAY_COUNT;
		//하단 끝 페이지 번호
		int endPageNum = startPageNum + PAGE_DISPLAY_COUNT - 1;
	   
		//전체 row 의 갯수
		int totalRow = dao.getCount();
		//전체 페이지의 갯수 구하기
		int totalPageCount = (int)Math.ceil(totalRow / (double)PAGE_ROW_COUNT);
		//끝 페이지 번호가 이미 전체 페이지 갯수보다 크게 계산되었다면 잘못된 값이다.
		if(endPageNum > totalPageCount){
			endPageNum = totalPageCount; //보정해 준다. 
		}
		
		//request 영역에 담아주기
		request.setAttribute("list", list);	//shop list
		request.setAttribute("category", category);
		request.setAttribute("startPageNum", startPageNum);	//시작 페이지 번호
		request.setAttribute("endPageNum", endPageNum);	//끝 페이지 번호
		request.setAttribute("pageNum", pageNum);	//현재 페이지 번호
		request.setAttribute("totalPageCount", totalPageCount);	//모든 페이지 count
		request.setAttribute("totalRow", totalRow);
		request.setAttribute("condition", condition);
		request.setAttribute("keyword", keyword);
		request.setAttribute("encodedK", encodedK);
	}

	

	@Override
	public void insert(ShopDto dto, HttpServletRequest request) {
		//dto : infoimagePath, imagePath 가지고 있다.
		//dto 에 writer(id) 추가
		//dto.setWriter((String)request.getSession().getAttribute("id"));
		
		//ShopDao 를 이용해서 DB 에 저장하기
		dao.insert(dto);
		
	}

	@Override
	//갤러리 detail 페이지에 필요한 data를 ModelAndView 에 저장
	public void getDetail(ModelAndView mView, int num) {
		//dao 로 해당 게시글 num 에 해당하는 데이터(dto)를 가져온다.
		ShopDto dto = dao.getDetail(num);
		//ModelAndView 에 가져온 GalleryDto 를 담는다.
		mView.addObject("dto", dto);
		
		/*
		[ 댓글 페이징 처리에 관련된 로직 ]
		*/
		//한 페이지에 몇개씩 표시할 것인지
		final int PAGE_ROW_COUNT=10;
	
		//detail.jsp 페이지에서는 항상 1페이지의 댓글 내용만 출력한다. 
		int pageNum=1;
	
		//보여줄 페이지의 시작 ROWNUM
		int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
		//보여줄 페이지의 끝 ROWNUM
		int endRowNum=pageNum*PAGE_ROW_COUNT;
	
		//원글의 글번호를 이용해서 해당글에 달린 댓글 목록을 얻어온다.
		ShopCommentDto commentDto=new ShopCommentDto();
		commentDto.setRef_group(num);
		//1페이지에 해당하는 startRowNum 과 endRowNum 을 dto 에 담아서  
		commentDto.setStartRowNum(startRowNum);
		commentDto.setEndRowNum(endRowNum);
	
		//1페이지에 해당하는 댓글 목록만 select 되도록 한다. 
		List<ShopCommentDto> commentList=shopCommentDao.getList(commentDto);
	
		//원글의 글번호를 이용해서 댓글 전체의 갯수를 얻어낸다.
		int totalRow=shopCommentDao.getCount(num);
		//댓글 전체 페이지의 갯수
		int totalPageCount=(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
		
		mView.addObject("commentList", commentList);
		mView.addObject("totalPageCount", totalPageCount);
	}

	@Override
	public void getSearch(HttpServletRequest request) {
	}
	
	@Override
	public void saveComment(HttpServletRequest request) {
		//폼 전송되는 파라미터 추출 
		int ref_group=Integer.parseInt(request.getParameter("ref_group"));
		String target_id=request.getParameter("target_id");
		String content=request.getParameter("content");
		/*
		 *  원글의 댓글은 comment_group 번호가 전송이 안되고
		 *  댓글의 댓글은 comment_group 번호가 전송이 된다.
		 *  따라서 null 여부를 조사하면 원글의 댓글인지 댓글의 댓글인지 판단할수 있다. 
		 */
		String comment_group=request.getParameter("comment_group");

		//댓글 작성자는 session 영역에서 얻어내기
		String writer=(String)request.getSession().getAttribute("id");
		//댓글의 시퀀스 번호 미리 얻어내기
		int seq=shopCommentDao.getSequence();
		//저장할 댓글의 정보를 dto 에 담기
		ShopCommentDto dto=new ShopCommentDto();
		dto.setNum(seq);
		dto.setWriter(writer);
		dto.setTarget_id(writer);
		dto.setContent(content);
		dto.setRef_group(ref_group);
		//원글의 댓글인경우
		if(comment_group == null){
			//댓글의 글번호를 comment_group 번호로 사용한다.
			dto.setComment_group(seq);
		}else{
			//전송된 comment_group 번호를 숫자로 바꾸서 dto 에 넣어준다. 
			dto.setComment_group(Integer.parseInt(comment_group));
		}
		//댓글 정보를 DB 에 저장하기
		shopCommentDao.insert(dto);
		
	}

	@Override
	public void deleteComment(HttpServletRequest request) {
		int num=Integer.parseInt(request.getParameter("num"));
		//삭제할 댓글 정보를 읽어와서 
		ShopCommentDto dto=shopCommentDao.getData(num);
		String id=(String)request.getSession().getAttribute("id");
		//글 작성자와 로그인된 아이디와 일치하지 않으면
		if(!dto.getWriter().equals(id)) {
			throw new NotDeleteException("다른 사람의 댓글 삭제는 안 돼요~");
		}
		
		shopCommentDao.delete(num);
	}

	@Override
	public void updateComment(ShopCommentDto dto) {
		shopCommentDao.update(dto);
		
	}

	@Override
	public void moreCommentList(HttpServletRequest request) {
		//로그인된 아이디
		String id=(String)request.getSession().getAttribute("id");
		//ajax 요청 파라미터로 넘어오는 댓글의 페이지 번호를 읽어낸다
		int pageNum=Integer.parseInt(request.getParameter("pageNum"));
		//ajax 요청 파라미터로 넘어오는 원글의 글 번호를 읽어낸다
		int num=Integer.parseInt(request.getParameter("num"));
		/*
			[ 댓글 페이징 처리에 관련된 로직 ]
		*/
		//한 페이지에 몇개씩 표시할 것인지
		final int PAGE_ROW_COUNT=10;

		//보여줄 페이지의 시작 ROWNUM
		int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
		//보여줄 페이지의 끝 ROWNUM
		int endRowNum=pageNum*PAGE_ROW_COUNT;

		//원글의 글번호를 이용해서 해당글에 달린 댓글 목록을 얻어온다.
		ShopCommentDto commentDto=new ShopCommentDto();
		commentDto.setRef_group(num);
		//1페이지에 해당하는 startRowNum 과 endRowNum 을 dto 에 담아서  
		commentDto.setStartRowNum(startRowNum);
		commentDto.setEndRowNum(endRowNum);

		//pageNum에 해당하는 댓글 목록만 select 되도록 한다. 
		List<ShopCommentDto> commentList=shopCommentDao.getList(commentDto);
		//원글의 글번호를 이용해서 댓글 전체의 갯수를 얻어낸다.
		int totalRow=shopCommentDao.getCount(num);
		//댓글 전체 페이지의 갯수
		int totalPageCount=(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);

		//view page 에 필요한 값 request 에 담아주기
		request.setAttribute("commentList", commentList);
		request.setAttribute("num", num); //원글의 글번호
		request.setAttribute("pageNum", pageNum); //댓글의 페이지 번호
		
	}

	@Override
	public void getData(HttpServletRequest request) {
		// TODO Auto-generated method stub
		
	}



	@Override
	public void saveImage(ShopDto dto, HttpServletRequest request) {
		// TODO Auto-generated method stub
		
	}



	@Override
	public Map<String, Object> uploadAjaxImage(ShopDto dto, HttpServletRequest request) {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public List<OrderDto> getList(String id) {
		
		return orderDao.getList(id);
	}

	@Override
	public List<OrderDto> cartMoney() {
		
		return null;
	}

	@Override
	public void update(int num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insert(OrderDto dto) {
		
		orderDao.insert(dto); 
		
	}

	@Override
	public void delete(int num, HttpServletRequest request) {

		orderDao.delete(num);
		
	}

	@Override
	public void deleteAll(String id) {
		
		orderDao.deleteAll(id);
		
	}

	@Override
	public int sumMoney(String id) {
		
		return orderDao.sumMoney(id);
	}

	@Override
	public int countCart(String id, int code) {
		
		return 0;
	}

	@Override
	public void updateCart(OrderDto dto) {
		
		orderDao.updateCart(dto);
	}

	@Override
	public void modifyCart(OrderDto dto) {
		
		orderDao.modifyCart(dto);
	}

}

