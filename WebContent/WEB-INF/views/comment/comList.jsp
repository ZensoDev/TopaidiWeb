<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Liste des commentaires</title>


<div class="container">
	<div class="row">
		<div class="col-sm-2"></div>
		<div class="col-sm-8 text-center">
			<br> <br>
			<h1>Liste des commentaires</h1>

			<br> <a href="insert" class="btn btn-secondary btn-lg active"
				role="button" aria-pressed="true"><i class="fas fa-user-plus"></i></a>
			<br> <br>
			<table class="table">
				<thead class="thead-primary">
					<tr>
						<th scope="col">Id</th>
						<th scope="col">Date</th>
						<th scope="col">Commentaire</th>
						<th scope="col">Id member</th>
						<th scope="col">Actions</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${idea.comments}" var="comment">
						<tr>
							<td>${comment.idCom}</td>
							<td>${comment.date}</td>
							<td>${comment.text}</td>
							<td>${comment.member}</td>
							<td><a href="delete/${comment.idCom}"
								class="btn btn-primary btn-lg active" role="button"
								aria-pressed="true"><i class="fas fa-trash-alt"></i></a> <a
								href="edit/${comment.idCom}"
								class="btn btn-danger btn-lg active" role="button"
								aria-pressed="true"><i class="fas fa-edit"></i></a> <a
								href="../comment/insert/${comment.idCom}"
								class="btn btn-secondary btn-lg active" role="button"
								aria-pressed="true"><i class="fas fa-compact-disc fa-spin"></i></a>
							</td>

						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="col-sm-2"></div>
	</div>
</div>
</body>
</html>