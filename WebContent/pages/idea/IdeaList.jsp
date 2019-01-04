<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<title>Idea List</title>

</head>

<body>

	<br>
	<br>
	<br>
	<br>
	<br>
	<br>

	<div class="container">

		<div class="row">

			<div class="col-sm-2"></div>

			<div class="col-sm-8">

				<h1>Idea list</h1>

				<ul>
					<c:forEach items="${ideasList}" var="idea">

						<li>${idea.idIdea}:${idea.title} 
						<a href="?action=delete&id=${idea.idIdea}"class="btn btn-primary btn-lg active"
					role="button" aria-pressed="true">Supprimer</a>
							<a href="?action=edit&id=${idea.idIdea}" class="btn btn-primary btn-lg active"
					role="button" aria-pressed="true">Edit</a>
						</li>

					</c:forEach>

				</ul>

				<a href="?action=new" class="btn btn-primary btn-lg active"
					role="button" aria-pressed="true">Add a new idea</a>

			</div>

			<div class="col-sm-2"></div>

		</div>


	</div>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
		crossorigin="anonymous"></script>

	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
		integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
		crossorigin="anonymous"></script>

</body>

</html>