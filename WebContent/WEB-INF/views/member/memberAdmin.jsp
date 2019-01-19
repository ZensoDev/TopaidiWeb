<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
	<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ideas List</title>
</head>
<body><jsp:include page="../include/adminNav.jsp" />
	<spring:url value="/admin/processFormMember" var="processUrl" />
	<table>
		<thead>
			<tr>
				<th>Member ID</th>
				<th>Last Name</th>
				<th>First Name</th>
				<th>Login Mail</th>
				<th>Password</th>
				<th>Statut</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${MembersList}" var="member">
				<tr>
					<td>${member.idMember}</td>
					<td>${member.firstName}</td>
					<td>${member.firstName}</td>
					<td>${member.loginMail}</td>
					<td>${member.password}</td>
					<td>${member.state}</td>
					<td><a href="editMember/${member.idMember}">Edit</a> <a
						href="deleteMember/${member.idMember}">Delete</a> <a
						href="activeDesactiveMember/${member.idMember}"> 
						<c:choose>
								<c:when test="${member.state}">
								Desactiver
								</c:when>
								<c:otherwise>
									Activer
								</c:otherwise>
							</c:choose></a></td>
				</tr>
			</c:forEach>
		</tbody>
</body>
</html>