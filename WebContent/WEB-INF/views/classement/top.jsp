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

test pour affichage page
Image taille 200 x 200 px<br>
<img src="http://www.mathly.fr/images/sun.jpg"><br>
Image redimentionnée : 150 x 90px<br>
<div style="width:150px;height:90px;background:url('http://www.mathly.fr/images/sun.jpg'); background-size:contain; background-repeat: no-repeat;"></div>
 		
  		<ul>
 		<c:forEach items="${tops}" var="top">
 				<li> ${top.idea_ID} : ${top.NB_Vote}
 				</li>
 			</c:forEach>
 		</ul> 
</body>
</html>