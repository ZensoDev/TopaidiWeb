<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ideas List</title>
<jsp:include page="../include/header.jsp" />


	<div class="container-fluid">
		<table class="table table-hover">
			<thead>
				<tr>
					<th>Title</th>
					<th>Member</th>
					<th>Category</th>
					<th>Description</th>
					<th>Date</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${cat.ideas}" var="idea">
					<tr>
						<td>${idea.title}</td>
						<td>${idea.member}</td>
						<td>${idea.category}</td>
						<td>${idea.description}</td>
						<td>${idea.date}</td>
						<td><a class="btn btn-primary" href="edit/${idea.idIdea}">Edit</a></td>
						<td><a class="btn btn-primary" href="delete/${idea.idIdea}">Delete</a></td>
					</tr>
					</c:forEach>
			</tbody>
		</table>
		</div>
		
</body>

</html>