<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<title>Ideas List</title>

</head>

<body><div class="container-fluid">
			<table class="table table-hover">
						<thead>
							<tr>
								<th>Title</th>
								<th>Member</th>
								<th>Category</th>
								<th>CD list</th>
							</tr>
						</thead>
						<tbody>

							<c:forEach items="${IdeasList}" var="idea">
							<tr>
	
					<td>${idea.title} </td>
					<td>${idea.Member} </td>
					<td>${idea..category} </td>
					<td>${idea.date} </td>
							<td><a class="btn btn-primary" href="edit/${idea.ideaId}">Edit</a></td>
							<td><a class="btn btn-primary" href="delete/${idea.ideaId}">Delete</a></td>
							</tr>

							</c:forEach>
						</tbody>
					</table>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
</body>

</html>