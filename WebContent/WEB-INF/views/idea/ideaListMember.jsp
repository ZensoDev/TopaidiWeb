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
					<th>Date</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${IdeasList}" var="idea">
					<tr>
						<td>${idea.title}</td>
						<td>${idea.member.firstName}</td>
						<td>${idea.category.name}</td>
						<td>${idea.date}</td>
					</tr>
					</c:forEach>
			</tbody>
		</table>
		</div>
		<br> <br> <br> <br> <br> <br>
</body>

</html>