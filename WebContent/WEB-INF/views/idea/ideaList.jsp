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


<div class="container">
	<div class="row">
		<div class="col-sm-2"></div>
		<div class="col-sm-8 text-center">
			<br> <br>
			<h1>Liste des idées</h1>
			<br> <a href="../ideas/add" class="btn btn-secondary btn-lg active"
				role="button" aria-pressed="true"><i class="fas fa-feather"></i> Proposer une idée</a>
			<br>
			<br>
			<div class="container-fluid">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>Title</th>
							<th>Member</th>
							<th>Category</th>
							<th>Date</th>
							<th>Actions</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${IdeasList}" var="idea">
							<tr>
								<td>${idea.title}</td>
								<td>${idea.member.firstName}</td>
								<td>${idea.category.name}</td>
								<td>${idea.date}</td>
								<td><a class="btn btn-primary" href="show/${idea.idIdea}"><i
										class="fas fa-search"></i></a></td>
							</tr>
						</c:forEach>
						
					</tbody>

				</table>
			</div>
		<div class="col-sm-2"></div>
	</div>
</div>
<br><br><br><br><br><br><br>
<jsp:include page="../include/footer.jsp" />