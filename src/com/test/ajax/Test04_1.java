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

import com.test.db.ZipCodeDTO;

public class Test04_1 extends HttpServlet
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
		// → AjaxTest04_1.jsp 로 부터
		// - addr 이라는 이름으로
		// - 넘어온 『동 이름』 데이터 수신
		String addr = request.getParameter("addr");
		
		// ※ 여기서도 역시 우편번호 데이터베이스가 있다고 가정하고...
		//    대신 직접 샘플로 ArrayList 구성
		ArrayList<ZipCodeDTO> lists = new ArrayList<ZipCodeDTO>();
		
		if(addr.indexOf("서교")>-1)
		{
			lists.add(new ZipCodeDTO("04044", "서울특별시 마포구 독막로3길 13 (서교동)"));
			lists.add(new ZipCodeDTO("04044", "서울특별시 마포구 독막로3길 17 (서교동)"));
			lists.add(new ZipCodeDTO("04047", "서울특별시 마포구 독막로3길 18 (서교동)"));
			lists.add(new ZipCodeDTO("04047", "서울특별시 마포구 독막로3길 20 (서교동)"));
			lists.add(new ZipCodeDTO("04044", "서울특별시 마포구 독막로3길 21 (서교동)"));
			lists.add(new ZipCodeDTO("04044", "서울특별시 마포구 독막로3길 21-3 (서교동)"));
			lists.add(new ZipCodeDTO("04044", "서울특별시 마포구 독막로3길 21-4 (서교동)"));
			lists.add(new ZipCodeDTO("04044", "서울특별시 마포구 독막로3길 21-6 (서교동)"));
			lists.add(new ZipCodeDTO("04044", "서울특별시 마포구 독막로3길 23 (서교동)"));
			
		}
		if(addr.indexOf("동교")>-1)
		{
			lists.add(new ZipCodeDTO("03992", "서울특별시 마포구 동교로 171 (동교동)"));
			lists.add(new ZipCodeDTO("03995", "서울특별시 마포구 동교로 172 (동교동)"));
			lists.add(new ZipCodeDTO("03992", "서울특별시 마포구 동교로 173 (동교동)"));
			lists.add(new ZipCodeDTO("03995", "서울특별시 마포구 동교로 174 (동교동)"));
			lists.add(new ZipCodeDTO("03992", "서울특별시 마포구 동교로 175 (동교동)"));
			lists.add(new ZipCodeDTO("03995", "서울특별시 마포구 동교로 176 (동교동, 청휘빌딩)"));
			lists.add(new ZipCodeDTO("03992", "서울특별시 마포구 동교로 177 (동교동, 동교동빌딩)"));
		
		}
		
		request.setAttribute("lists", lists);
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("Test04_1ok.jsp");
		dispatcher.forward(request, response);
		
	}

}
