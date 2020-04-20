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

public class Test04 extends HttpServlet
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
		
		String addr = request.getParameter("addr");
		
		String arr = "김포시 청송로8,김포시 청송로70,김포시 청송로50,김포시 청송로36,김포시 청송로20";
		
		if(addr.equals("김포"))
		{
			request.setAttribute("result", arr);
		}
		else
		{
			request.setAttribute("result", "결과 없음");
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("Test04ok.jsp");
		dispatcher.forward(request, response);
		
	}
	
}
