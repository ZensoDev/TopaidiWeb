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

<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-1"></div>
			<div class="col-10">${IdeaShow.title}</div>
			<div class="col-1"></div>
		</div>
		<div class="row">
			<div class="col-1"></div>
			<div class="col-10">by ${IdeaShow.member.firstName}</div>
			<div class="col-1"></div>
		</div>
		<div class="row">
			<div class="col-1"></div>
			<div class="col-10">${IdeaShow.category}</div>
			<div class="col-1"></div>
		</div>

		<div class="row">
			<div class="col-1"></div>
			<div class="col-10">${IdeaShow.description}</div>
			<div class="col-1"></div>
		</div>
		<div class="row">
			<div class="col-1"></div>
			<div class="col-10">${IdeaShow.date}</div>
			<div class="col-1"></div>
		</div>
		<div class="row">
			<div class="col-1"></div>
			<div class="col-5"><a class="btn btn-primary" href="../edit/${IdeaShow.idIdea}">Edit</a></div>
			<div class="col-5"><a class="btn btn-primary" href="../delete/${IdeaShow.idIdea}">Delete</a></div>
			<div class="col-1"></div>
		</div>
		<div class="row">
			<div class="col-3"></div>
			<div class="col-3"><a class="btn btn-primary" href="../VoteController/add/${voteEnum}">Top</a></div>
			<div class="col-3">Flop</div>
			<div class="col-3"></div>
		</div>
	</div>
</body>

</html>