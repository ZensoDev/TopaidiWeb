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

	<spring:url var="comList" value="/comment/list/${idIdea}" 
		context="">
		<spring:param name="idIdea" value="${IdeaShow.idIdea}" />
	</spring:url>


	<div class="container-fluid">
	<div class="card mb-3">
  <div class="card-body">
    <h5 class="card-title">${IdeaShow.title}</h5>
    <p class="card-text">${IdeaShow.category}<br>
   <div class="col-10"><div
		style="width: 150px; height: 90px; background: url('${IdeaShow.photo}'); background-size: contain; background-repeat: no-repeat;"></div>
			</div> ${IdeaShow.description}</p>
    <p class="card-text"><small class="text-muted">by ${IdeaShow.member.firstName}</small></p>
  </div>
		<div class="row">
			<div class="col-1"></div>
			<div class="col-sm-10 text-center">${IdeaShow.title}</div>
			<div class="col-1"></div>
		</div>
		<div class="row">
			<div class="col-1"></div>

			<div class="col-10"><div
		style="width: 150px; height: 90px; background: url('${IdeaShow.photo}'); background-size: contain; background-repeat: no-repeat;"></div>
			</div>
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
			<div class="col-5">
				<a class="btn btn-primary" href="../edit/${IdeaShow.idIdea}">Edit</a>
			</div>
			<div class="col-5">
				<a class="btn btn-primary" href="../delete/${IdeaShow.idIdea}">Delete</a>
			</div>
			<div class="col-1"></div>
		</div>
		<div class="row">
			<div class="col-3"></div>
			<div class="col-3">
				<a class="btn btn-primary"
					href="../../votes/add/${IdeaShow.idIdea}/Top">Top</a>
			</div>
			<div class="col-3">
				<a class="btn btn-primary"
					href="../../votes/add/${IdeaShow.idIdea}/Flop">Flop</a>
			</div>
			<div class="col-3"></div>
		</div>
		<div class="row">
			<div class="col-3"></div>
			<div class="col-6"><jsp:include page="${comList}/>" />
				<div class="col-3"></div>
			</div>
		</div>
</body>

</html>