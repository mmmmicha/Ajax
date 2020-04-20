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
<title>AjaxTest05.jsp</title>
<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="js/ajax.js"></script>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
<style type="text/css">

	#search { width: 500px;}
	#list
	{
		border: 1px solid gray;
		width: 500px;
		
		position: absolute;
		left: 62px;
		top: 120px;
		
		display : none;
	}
	
	#list.item {padding:2px;}
	#list #footer
	{
		background-color: #ddd;
		text-align: right;
		padding: 5px;
		font-size: 8pt;
	}

</style>
<script type="text/javascript">

	// 사용자가 검색어 입력창에서 키보드를 누를 때마다
	// 그 때 까지의 입력된 단어를 서버로 보내고,
	// 그에 맞는 추천 검색어를 받아올 수 있도록 처리.
	function search()
	{
		// 데이터 수집
		var search = document.getElementById("search").value;
		
		// 테스트
		// alert(search);
		
		// 검색어가 존재할 때만 보낼 수 있도록 처리.
		if(search.replace(" ", "") == "")
		{
			document.getElementById("list").style.display = "none";
			return;
		}
		
		// 완성형 한글일 때에만 검색 키워드 보내기
		var regEx = /^[가-힣]*$/;	//-- ← / / 꼭 필요함
		
		if(!regEx.test(search))
			return;
		
		// URL 
		var url = "ajaxtest05.do?search=" + search;
		
		// XMLHttpRequest 객체 생성
		ajax = createAjax();
		
		// 설정
		ajax.open("GET", url, true);
		
		ajax.onreadystatechange = function()
		{
			if(ajax.readyState==4)
			{
				if(ajax.status==200)
				{
					callBack();
				}
			}
		}
		
		ajax.send("");
		
	}
	
	function callBack()
	{
		// XML 문서 객체
		var doc = ajax.responseXML;
		
		// XML 문서의 최상위 엘리먼트... 현재는... 『<list></list>』
		var root = doc.documentElement;
		
		// 모든 『<item></item>』 태그 반환받기
		var itemList = root.getElementsByTagName("item");
		
		// <div id="items"> 박스 초기화
		document.getElementById("items").innerHTML = "";
		
		// 추천 검색어 삽입하기
		for(var i=0; i<itemList.length; i++)
		{
			//var word = itemList[i].innerHTML;
			var word = itemList[i].firstChild.nodeValue; // 왜 이렇게 쓰는거야.. 말이 잘 안되는데
			
			// items 에 추가하기
			document.getElementById("items").innerHTML += "<div class='item'>" + word + "</div>";
			
		}
		
		// 렌더링을 하지 않은 컨트럴을 다시 그려내기
		document.getElementById("list").style.display = "block";
		
		
	}

</script>

</head>
<body>

<div>
	<h1>추천 검색어 AJAX 처리 실습</h1>
	<hr>
</div>

<div>
	검색어
	<input type="text" id="search" class="control" placeholder="검색어를 입력하세요"
		onkeyup="search()">
</div>
<!-- 
<div id="list">
	<div id="items">
		<div class="item">가방</div>
		<div class="item">가방끈</div>
		<div class="item">가방끈 매듭</div>
		<div class="item">가방끈 매듭 만드는 법</div>
		<div class="item">가방끈 매듭 풀기</div>
		<div class="item">가사</div>
		<div class="item">가요</div>
		<div class="item">가위</div>
		<div class="item">가장자리 다듬기</div>
	</div>
	<div id="footer">
		추천 검색어
	</div>
</div>
 -->
 
 <div id="list">
	<div id="items">
		<div class="item"></div>
	</div>
	<div id="footer">
		추천 검색어
	</div>
</div>
</body>
</html>





