<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Classement Top</title>
<style>
</style>
</head>
<body>

 		
  		<ul>
 		<c:forEach items="${tops}" var="top">
 				<li> ${top.idea_ID} : ${top.NB_Vote}
 				</li>
 			</c:forEach>
 		</ul> 
</body>
</html>