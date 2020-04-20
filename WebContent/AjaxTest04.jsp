<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath(); // 서블릿 컨텍스트페쓰

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AjaxTest04.jsp</title>
<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
<style type="text/css">

	#result
	{
		display: inline-block;
		width: 250px;
		color: #F33;
	}


</style>
<script type="text/javascript" src="<%=cp%>/js/ajax.js"></script>
<script type="text/javascript">

	
		
	
		function check()
		{
			// 데이터 수집
			var id = document.getElementById("id").value;
			
			// URL 준비
			var url = "ajaxtest03.do?id=" + id;
			
			// XMLHttpRequest 객체 생성
			ajax = createAjax();
			
			// 환경 설정 → open("메소드 방식", "URL", "동기/비동기");
			ajax.open("GET", url, true);
			
			ajax.onreadystatechange = function()
			{
				if(ajax.readyState==4)
				{
					if(ajax.status==200)
					{
						// 업무 처리
						callBack();
					}
				}
			}
			
			ajax.send("");
			
			
			
		}// end check()
		
		
		// 아이디 중복검사의 결과를 통보받아 사용자에게 메세지 출력
		// → span → result
		function callBack()
		{
			var data = ajax.responseText;	// ajax에 필요한 값이 들어가 있는 것. 그럼 ajax 에 담길때 어떤식으로 담기는 걸까..
			
			data = parseInt(data);		//  1 / 0  ←  "1" / "0"
			
			if(data==0)
				document.getElementById("result").innerText = "사용가능한 아이디입니다.";
			else
				document.getElementById("result").innerText = "이미 사용중인 아이디입니다.";
			
			
			
		}
		
		
		
		function searchAddr()
		{
			var addr = document.getElementById("addr").value;
			
			var url = "ajaxtest04.do?addr=" + addr;
			
			ajax = createAjax();
			
			ajax.open("GET", url, true);
			
			ajax.onreadystatechange = function()
			{
				if(ajax.readyState==4)
				{
					if(ajax.status==200)
					{
						// 업무 처리
						callBack2();
					}
				}
			}
			
			ajax.send("");
			
		}
		
		function callBack2()
		{
			
			
			var data = ajax.responseText;	// ajax에 필요한 값이 들어가 있는 것. 그럼 ajax 에 담길때 어떤식으로 담기는 걸까..
			
			var addrarr = data.split(",");
			
			// 테스트
			// alert(addrarr[0]);
			
			for(var i = 0; i<5;i++)
				$("option").eq(i).text(addrarr[i]);
			
			
			/* data = parseInt(data);		//  1 / 0  ←  "1" / "0"
			
			if(data==0)
				document.getElementById("result").innerText = "사용가능한 아이디입니다.";
			else
				document.getElementById("result").innerText = "이미 사용중인 아이디입니다.";
			 */
			
			
		}
		
		
	
	


</script>

</head>
<body>

<div>
	<h1>회원 가입</h1>
	<hr>
</div>

<table class="table">
	<tr>
		<th>아이디</th>
		<td>
			<input type="text" id="id" class="control">
			<input type="button" value="중복검사" class="control" onclick="check()">
			<span id="result"></span>
		</td>
	</tr>
	
	<tr>
		<th>이름</th>
		<td>
			<input type="text" id="name" class="control">
		</td>
	</tr>
	
	<tr>
		<th>주소</th>
		<td>
			<input type="text" id="addr" class="control" placeholder="동 입력"/>
			<input type="button" value="검색하기" class="control"
				onclick="searchAddr()"/>
			<br>
			<select id="addrResult" class="control" onchange="selectZipCode(this)">
				<option>주소를 검색하세요</option>
				<option>주소를 검색하세요</option>
				<option>주소를 검색하세요</option>
				<option>주소를 검색하세요</option>
				<option>주소를 검색하세요</option>
			</select>
		</td>
	</tr>
	
	<tr>
		<th>주소 검색 결과</th>
		<td>
			<input type="text" id="addr1" class="control" readonly="readonly"
				style="width: 200px;">
			<br>
			<input type="text" id="addr2" class="control" readonly="readonly"
				style="width: 400px;">
			<br>
			<input type="text" id="addr3" class="control" placeholder="상세주소를 입력하세요"
				style="width: 400px;">
		</td>
	</tr>
</table>


</body>
</html>