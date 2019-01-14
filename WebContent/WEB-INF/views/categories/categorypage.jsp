<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gestion des catégories</title>
</head>
<body>
<ul>
 		<c:forEach items="${categories}" var="cat">
 				<li>${cat.idCat} : ${cat.name} <a href="delete/${cat.idCat}">Suppression</a> <a href="update/${cat.idCat}">Edit</a><a href="update/${cat.idCat}">Ajout idée</a>
 				<ul>Liste des idées de la catégorie<li><c:forEach items="${cat.ideas}" var="cd">
				${idea.title},
			</c:forEach></li></ul></li>
 			</c:forEach>
 		</ul>
 		<a href="add">Ajout d'une nouvelle catégorie</a>
</body>
</html>