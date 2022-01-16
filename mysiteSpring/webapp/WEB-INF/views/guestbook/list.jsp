<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<% pageContext.setAttribute( "newLine", "\n" ); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<link href="/mysiteSpring/assets/css/guestbook.css" rel="stylesheet" type="text/css">
<title>Mysite</title>
</head>
<body>
	<div id="container">
		
		<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
		<c:import url="/WEB-INF/views/includes/navigation.jsp"></c:import>
		
		<div id="wrapper">
			<div id="content">
				<div id="guestbook">				
					<form method="post" action="insert" >						
						<table>
							<tr>								
								<td>이름</td><td><input type="text" name="name" /></td>
								<td>비밀번호</td><td><input type="password" name="password" /></td>
							</tr>
							<tr>
								<td colspan=4><textarea name="content" id="content"></textarea></td>
							</tr>
							<tr>
								<td colspan=4 align=right><input type="submit" VALUE=" 확인 " /></td>
							</tr>
						</table>
						
					</form>
					<ul>
						
						 <c:forEach items="${guestbooklist}" var="guestbook">
							<li>
								<table>
									<tr>
										  <td>${guestbook.no}</td>
									      <td>${guestbook.name}</td>
									      <td>${guestbook.content}</td>
									      <td>${guestbook.reg_date}</td>
										  <td><a href="deleteform?no=${guestbook.no}">삭제</a></td>
									</tr>
									<tr>
										<td colspan=4>
										${fn:replace(vo.content, newLine, "<br>")}
										</td>
									</tr>
								</table>
								<br>
							</li>
						</c:forEach>
					</ul>
					
				</div><!-- /guestbook -->
			</div><!-- /content -->
		</div><!-- /wrapper -->
		
		<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
		
	</div><!-- /container -->
</body>
</html>		
		
		
		