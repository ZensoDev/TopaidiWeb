<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ideas List</title>
</head>
<body><jsp:include page="../include/adminNav.jsp" />
	<spring:url value="/admin/processFormIdea" var="processUrl" />
	<table>
		<thead>
			<tr>
				<th>Id</th>
				<th>Title</th>
				<th>Member</th>
				<th>Category</th>
				<th>Date</th>
				<th>Photo</th>
				<th>Description</th>
				<th>Etat</th>
				<th>Gestion</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${IdeasList}" var="idea">
				<tr>
					<td>${idea.idIdea}</td>
					<td>${idea.title}</td>
					<td>${idea.member.firstName}</td>
					<td>${idea.category.name}</td>
					<td>${idea.date}</td>
					<td>${idea.photo}</td>
					<td>${idea.description}</td>
					<td>${idea.state}</td>
					<td><a href="editIdea/${idea.idIdea}">Edit</a> <a
						href="deleteIdea/${idea.idIdea}">Delete</a> <a
						href="activeDesactiveIdea/${idea.idIdea}"> <c:choose>
								<c:when test="${idea.state}">
								Desactiver
								</c:when>
								<c:otherwise>
									Activer
								</c:otherwise>
							</c:choose></a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>