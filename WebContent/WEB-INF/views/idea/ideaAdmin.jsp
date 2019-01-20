<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gestion du site</title>
</head>
<body><jsp:include page="../include/adminNav.jsp" />
	<spring:url value="/admin/processFormIdea" var="processUrl" />


	<div class="container">
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-10 text-center">
				<br> <br>
				<h1>Gestion des idées</h1>
				<br> <br>
				<div class="container-fluid">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>Id</th>
								<th>Title</th>
								<th>Member</th>
								<th>Category</th>
								<th>Date</th>
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
									<td><a class="btn btn-primary" href="editIdea/${idea.idIdea}">Edit</a> 
										<a class="btn btn-danger"
										href="deleteIdea/${idea.idIdea}">Delete</a> 
										<a class="btn btn-secondary"
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
				</div>
				<div class="col-sm-1"></div>
			</div>
		</div>
		<br> <br> <br> <br> <br> <br> <br>

		<jsp:include page="../include/footer.jsp" />
</body>
</html>