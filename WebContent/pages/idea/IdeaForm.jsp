<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Idea Form</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
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
				<form action="ideaController" method="post" class="form-inline">
					<input type="hidden" name="id" value="${ideaObj.idIdea}"> <input
						type="hidden" name="state" value="true">

					<div class="form-group mb-2">
						<label for="title">Title : </label> <input type="text"
							class="form-control" id="title" name="title"
							value="${ideaObj.title}">
					</div>
					<div class="form-group mx-sm-3 mb-2">

						<label for="photo">photo : </label> <input type="text"
							class="form-control" id="photo" name="photo"
							value="${ideaObj.photo}">
					</div>

					<div class="form-group mx-sm-3 mb-2">

						<label for="description">description : </label> <input type="text"
							class="form-control" id="description" name="description"
							value="${ideaObj.description}">
					</div>

					<div class="form-group mx-sm-3 mb-2">

						<label for="date">date : </label> <input type="date"
							class="form-control" id="date" name="date"
							value="${ideaObj.date}">

					</div>
					<div class="form-group mx-sm-3 mb-2">

						<label for="inputState">Category : </label> <select id="inputState"
							class="form-control">

							<option selected>Choose...</option>

							<option>Patate</option>
							<option>Courgette</option>

						</select>

					</div>

					<button type="submit" class="btn btn-primary mb-2">Se
						connecter</button>

				</form>

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

