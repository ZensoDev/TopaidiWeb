
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Classement Buzz</title>
<style>
</style>
</head>
<body>
<ul>
 		<c:forEach items="${buzz}" var="buzz">
 				<li>
 				${buzz.idea_iD} : ${buzz.NB_Votes}
 				</li>
 			</c:forEach>
 		</ul>
</body>
</html>