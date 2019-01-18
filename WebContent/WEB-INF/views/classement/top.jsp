<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Classement Top</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
</head>
<body>

<<<<<<< Updated upstream
 		
  		<ul>
 		<c:forEach items="${tops}" var="top">
 				<li> ${top.idIdea} : ${top.title}
 				</li>
 			</c:forEach>
 		</ul> 
=======
	test pour affichage page Image taille 200 x 200 px
	<br>
	<img src="http://www.mathly.fr/images/sun.jpg">
	<br> Image redimentionnée : 150 x 90px
	<br>
	<div
		style="width: 150px; height: 90px; background: url('http://www.mathly.fr/images/sun.jpg'); background-size: contain; background-repeat: no-repeat;"></div>

	<table class="table">
		<thead>
			<tr>
				<th scope="col">Titre</th>
				<th scope="col">Catégorie</th>
				<th scope="col">Note</th>
				<th scope="col">Nombre de vote</th>
			</tr>
		</thead>
	</table>
>>>>>>> Stashed changes
</body>
</html>