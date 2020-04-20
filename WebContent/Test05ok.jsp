<%@ page contentType="text/html; charset=UTF-8"%><%@ 
taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath(); // 서블릿 컨텍스트페쓰
	
	// 이전 실습 내용(Test04ok.jsp) 과 내용 동일
	// 추천 검색어들을 XML 로 목록화해서 돌려준다.
	
	response.setContentType("text/xml");
	
%><?xml version="1.0" encoding="UTF-8" ?>
<list>
	<c:forEach var="item" items="${list }">
	<item >
		${item.word }
	</item>
	</c:forEach>
</list>
