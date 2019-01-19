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

<body><jsp:include page="../include/adminNav.jsp" />
	<div class="container-fluid">
		<table class="table table-hover">
			<thead>
				<tr>
					<th>Member ID</th>
					<th>Last Name</th>
					<th>First Name</th>
					<th>Login Mail</th>
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
						<td><a class="btn btn-primary" href="edit/${member.idMember}">Edit</a>
							<a class="btn btn-primary" href="delete/${member.idMember}">Delete</a>
							<a class="btn btn-primary" href="show/${member.idMember}">Show
								idea</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
</body>

</html>