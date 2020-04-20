<%@ page contentType="text/html; charset=UTF-8"%><%@ 
taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath(); // 서블릿 컨텍스트페쓰

	// ※ AJAX 객체에 데이터를 돌려줄 때
	//    브라우저가 이 데이터를 XML로 인식해야 하기 때문에
	//    MIME 타입을 XML 로 선언한다.
	response.setContentType("text/xml");
	
	// ※ (수신해서 처리해야 하는) 데이터가 한개 이상일 경우...
	//	  XML 이나 JSON 과 같이 구조화시킬 수 있는 데이터로 전달하는 것이
	//	  처리 과정에서 용이하다.
	//	  우편번호 결과는 당연히 다량의 데이터를 전송해야 하기 때문에
	//	  텍스트가 아닌 XML 형태로 반환하려고 하는 것이다.
	
	// ※ 『<?xml ... ?>』 와 같이 XML 의 선언문 앞에는
	//    어떠한 공백이나 개행 또는 주석도 있어서는 안된다.
	
%><?xml version="1.0" encoding="UTF-8"?><!-- ※ 이 선언부 앞에는 공백이든 뭐든 아무것도 오면 안된다.  -->
<list>
	<c:forEach var="item" items="${lists }">
		<item>
			<zipcode>${item.zipcode }</zipcode>
			<address>${item.address }</address>
		</item>
	</c:forEach>
</list>