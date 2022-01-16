<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="/mysiteSpring/assets/css/user.css" rel="stylesheet" type="text/css">
	<title>Insert title here</title>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
   $(document).ready(function (){   
     // 아이디체크  url : "api/emailCheck.jsp", "/mysite/user",
     $("#btn-checkid").on("click", function(){
       
       // json 형식으로 데이터 set
       var params = { a      : "idcheck"
                     , email  : $("[name=email]").val() }
    
       $.ajax({
         url : "api/emailCheck.jsp",
         type : "post",
         data : params,
         dataType : "json",
         success : function(isExist) {
           console.log(isExist);
           if(isExist == false){
             $("#checkid-msg").text("사용할 수 있는 아이디 입니다.")
             $("#checkid-msg").css("color", "green")
           }else {
             $("#checkid-msg").text("다른 아이디로 가입해 주세요.")
             $("#checkid-msg").css("color", "red")
           }
         },
         error : function(XHR, status, error) {
           console.error(status + " : " + error);
         }
       });
     });
     
   });//ready
</script>
</head>
<body>

	<div id="container">		
		<c:import url ="/WEB-INF/views/includes/header.jsp"></c:import>
		<c:import url ="/WEB-INF/views/includes/navigation.jsp"></c:import>
							
		<div id="wrapper">
			<div id="content">
				<div id="user">
	
					<form id="join-form" name="joinForm" method="post" action="/mysite/user">
						<input type="hidden" name="a" value="join" /> 
						<label class="block-label" for="name">이름</label>
						<input id="name" name="name" type="text" value="${param.name}">
	
						<label class="block-label" for="email">이메일</label>
						<input id="email" name="email" type="text" value="${param.email}">
						<input id="btn-checkid" type="button" value="id 중복체크">
						  <p id="checkid-msg" class="form-error">
            					&nbsp;
            			 </p>
						<input name="password" type="password" value="${param.password}">
						
						<fieldset>
							<legend>성별</legend>
							<label>여</label> <input type="radio" name="gender" value="female" checked="checked">
							<label>남</label> <input type="radio" name="gender" value="male">
						</fieldset>
						
						<fieldset>
							<legend>약관동의</legend>
							<input id="agree-prov" type="checkbox" name="agreeProv" value="y">
							<label>서비스 약관에 동의합니다.</label>
						</fieldset>
						
						<input type="submit" value="가입하기">
						
					</form>
					
				</div><!-- /user -->
			</div><!-- /content -->
		</div><!-- /wrapper -->
		
		<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>

</body>
</html>