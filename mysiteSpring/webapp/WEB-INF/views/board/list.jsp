<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<!DOCTYPE html>
<html>
<head>
	<title>mysitespring</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<link href="/mysite/assets/css/board.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="container">
		
		<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
		<c:import url="/WEB-INF/views/includes/navigation.jsp"></c:import>
		
		<div id="content">
			<div id="board">
				<form id="search_form" name ="serch" action="/mysite/board" method="get">
					<select name="serch" size="1" >
	    				<option value="name"> 이름</option>
	    				<option value="title"> 제목</option>
	    				<option value="content"> 내용</option>
	    				<option value="reg_date"> 등록날짜</option>
   					</select>				
					<input type="text" id="kwd" name="kwd" value="">
					<input type="hidden" name ="a" value="list">
					
						<!-- 검색 -->
						
					<input type="submit" value="찾기">
					
				</form>
				
				<table class="tbl-ex">
					
					<c:forEach items="${list}" var="vo">
						<tr>
							<td>${vo.no }</td>
							<td><a href="/mysite/board?a=read&no=${vo.no}">${vo.title }</a></td>
							<td>${vo.user_name }</td>
							<td>${vo.hit }</td>
							<td>${vo.reg_date }</td>
							<c:if test="${authUser.no == vo.user_no }">
							<td><a href="/mysite/board?a=delete&no=${vo.no}" class="del">삭제</a></td>
							</c:if>
						</tr>						
					</c:forEach>
					
					<%-- <c:forEach items="${list2}" var="vo">
						<tr>
							<td>${vo.no }</td>
							<td><a href="/mysite/board?a=read&no=${vo.no}">${vo.title }</a></td>
							<td>${vo.user_name }</td>
							<td>${vo.hit }</td>
							<td>${vo.reg_date }</td>
							<c:if test="${authUser.no == vo.user_no }">
							<td><a href="/mysite/board?a=delete&no=${vo.no}" class="del">삭제</a></td>
							</c:if>
						</tr>						
					</c:forEach> --%>
				</table>
				
				<div class ="pager">			
					<ul>
					<c:if test="${paging.prev}">
						<li><a href="/mysite/board?a=list&page=${paging.beginPage-1}">◀</a></li>
					</c:if>		
					<c:forEach begin="${paging.beginPage}" end="${paging.endPage}" step="1" var="index">
						<c:choose>
							 <c:when test="${paging.page == index}">
							    <li class="selected">${index}</li>
							 </c:when>
							 <c:otherwise>
							    <li><a href="/mysite/board?a=list&page=${index}&kwd=${keword}&serch=${serch}">${index}</a></li>
							 </c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${paging.next}">
						<li><a href="/mysite/board?a=list&page=${paging.endPage+1}">▶</a></li>
					</c:if>
					</ul>					   						
				</div>
				
				<c:choose>
					<c:when test="${authUser ne null}">
						<div class="bottom">
							<a href="/mysite/board?a=writeform" id="new-book">글쓰기</a>
						</div>
					</c:when>
				</c:choose>				
			</div>
		</div>
		
		<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
		
	</div>
</body>
</html>