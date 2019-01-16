<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Classement Top</title>
</head>
<body>
<ul>
 		<c:forEach items="${tops}" var="top">
 				<li>test pour affichage page
 				{top.idIdea} : ${top.VoteEnum}
 				</li>
 			</c:forEach>
 		</ul>
</body>
</html>