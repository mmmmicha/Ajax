/*=================
 *  Test04.java
 * =================*/

package com.test.ajax;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.db.WordDTO;
import com.test.db.ZipCodeDTO;

public class Test05 extends HttpServlet
{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{

		doGetPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGetPost(request, response);

	}

	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		request.setCharacterEncoding("UTF-8");
		
		// 데이터 수신
		// → AjaxTest05.jsp 로 부터
		// - search 이라는 이름으로
		// - 넘어온 『검색 단어』 데이터 수신
		String search = request.getParameter("search");
		
		// db 연결 및 액션 처리
		// 검색 정책에 따라
		// 『..... where column like 'search%';』
		// 또는
		// 『..... where column like '%search%';』 와 같은 쿼리문 수행
		// 그에 따른 결과 수신
		
		// 위와 같이 조회한 결과를 가지고 ArrayList 자료구조 활용
		ArrayList<WordDTO> list = new ArrayList<WordDTO>();
		
		if(search.equals("가"))
		{
			list.add(new WordDTO("가"));
			list.add(new WordDTO("가방"));
			list.add(new WordDTO("가방끈"));
			list.add(new WordDTO("가방끈 매듭"));
			list.add(new WordDTO("가방끈 매듭 만드는 법"));
			list.add(new WordDTO("가방끈 매듭 풀기"));
			list.add(new WordDTO("가사"));
			list.add(new WordDTO("가요"));
			list.add(new WordDTO("가위"));
			list.add(new WordDTO("가장자리 다듬기"));
		}
		else if(search.equals("가방"))
		{
			list.add(new WordDTO("가방"));
			list.add(new WordDTO("가방끈"));
			list.add(new WordDTO("가방끈 매듭"));
			list.add(new WordDTO("가방끈 매듭 만드는 법"));
			list.add(new WordDTO("가방끈 매듭 풀기"));
			list.add(new WordDTO("가방 판매점"));
			list.add(new WordDTO("가방 판매할 때 요령"));
			list.add(new WordDTO("가방 팔이"));
		}
		else if(search.equals("가요"))
		{
			list.add(new WordDTO("가요"));
			list.add(new WordDTO("가요 듣기"));
			list.add(new WordDTO("가요 순위"));
			list.add(new WordDTO("가요 순위 리스트"));
			list.add(new WordDTO("가요 순위 100"));
			list.add(new WordDTO("가요 트랜드"));
		}
		else if(search.equals("가방끈"))
		{
			list.add(new WordDTO("가방끈"));
			list.add(new WordDTO("가방끈 구매"));
			list.add(new WordDTO("가방끈 매듭"));
			list.add(new WordDTO("가방끈 매듭 만드는 법"));
			list.add(new WordDTO("가방끈 매듭 풀기"));
			list.add(new WordDTO("가방끈 판매"));
		}
		else if(search.equals("가방끈 매듭"))
		{
			list.add(new WordDTO("가방끈 매듭"));
			list.add(new WordDTO("가방끈 매듭 만드는 법"));
			list.add(new WordDTO("가방끈 매듭 풀기"));
		}
		
		request.setAttribute("list", list);
		
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("Test05ok.jsp");
		dispatcher.forward(request, response);
		
	}

}
