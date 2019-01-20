
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Classement Buzz</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
</head>
<body>

<ul>
 		</ul>
=======

	<table class="table">
		<thead>
			<tr>
				<th scope="col">Titre</th>
				<th scope="col">Catégorie</th>
				<th scope="col">Note</th>
				<th scope="col">Nombre de vote</th>
			</tr>
		</thead>
		<tbody>
 		<c:forEach items="${buzz}" var="buzz">
 		<tr>
 				
 				<td>${buzz.key.title}</td>
 				<td>${buzz.key.category}</td>
 				<td>${buzz.value}</td>
 				<td>${buzz.value}</td>
 				
 			</c:forEach>
 		</tr>
		</tbody>
	</table>

</body>
</html>