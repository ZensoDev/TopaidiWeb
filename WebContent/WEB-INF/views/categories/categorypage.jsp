<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gestion des catégories</title>
</head>
<body>
	<jsp:include page="../include/adminNav.jsp" />

	<div class="container">
		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-8 text-center">
				<br> <br>
				<h1>Gestion des catégories</h1>
				<br> <br> 
				<a href="addCat" class="btn btn-secondary btn-lg active"
				role="button" aria-pressed="true"><i class="fas fa-feather"></i> Ajouter une catégorie</a>
				<br> <br>
				<div class="container-fluid">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>Catégorie ID</th>
								<th>Nom de la catégorie</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${categories}" var="cat">
								<tr>
									<td>${cat.idCat}</td>
									<td>${cat.name}</td>
									<td><a class="btn btn-danger" href="../categories/delete/${cat.idCat}">Supprimer</a>
										<a class="btn btn-primary" href="updateCat/${cat.idCat}">Edit</a></td>
								</tr>
							</c:forEach>

						</tbody>
					</table>
				</div>
				<div class="col-sm-2"></div>
			</div>
		</div>
		<br> <br> <br> <br> <br> <br> <br>

		<jsp:include page="../include/footer.jsp" />