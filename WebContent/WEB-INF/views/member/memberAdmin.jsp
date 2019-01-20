<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gestion du site</title>
</head>
<body>
<jsp:include page="../include/adminNav.jsp" />


	<div class="container">
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-10 text-center">
				<br> <br>
				<h1>Gestion des membres</h1>
				<spring:url value="/admin/processFormMember" var="processUrl" />
				<br> <br>
				<div class="container-fluid">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>Member ID</th>
								<th>Nom</th>
								<th>Prénom</th>
								<th>Login Mail</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${MembersList}" var="member">
								<tr>
									<td>${member.idMember}</td>
									<td>${member.lastName}</td>
									<td>${member.firstName}</td>
									<td>${member.loginMail}</td>
									<td><a class="btn btn-primary"
										href="editMember/${member.idMember}">Editer</a> 
										<a class="btn btn-danger"
										href="deleteMember/${member.idMember}">Delete</a> 
										<a  class="btn btn-secondary"
										href="activeDesactiveMember/${member.idMember}"> <c:choose>
												<c:when test="${member.state}">
									Activer
								</c:when>
												<c:otherwise>
									Desactiver
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
