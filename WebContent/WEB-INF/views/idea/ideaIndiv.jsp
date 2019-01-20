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
			<br>
			<spring:url var="comList" value="/comment/list/${idIdea}" context="">
				<spring:param name="idIdea" value="${IdeaShow.idIdea}" />
			</spring:url>

			<div class="jumbotron">
				<h1 class="display-4">${IdeaShow.title}</h1>
				<img alt="" src="https://www.agissons-eco.fr/inc/theme/html/_img/logo.png">
				<br>
				<p class="card-text"><small class="text-muted">posté par : ${IdeaShow.member.firstName} - le ${IdeaShow.date}</small></p>
				Votez !<br><br>
				<a href="../../votes/add/${IdeaShow.idIdea}/Top" class="btn btn-secondary btn-lg active"
					role="button" aria-pressed="true"><i class="far fa-thumbs-up fa-2x"></i></a>
				<a href="../../votes/add/${IdeaShow.idIdea}/Flop" class="btn btn-secondary btn-lg active"
					role="button" aria-pressed="true"><i class="far fa-thumbs-down fa-2x"></i></a>
					
				<br><br>
					
				<p class="lead">${IdeaShow.description}</p>
				<hr class="my-4">
				<jsp:include page="${comList}/>" />
			</div>


		</div>
		<div class="col-sm-2"></div>
	</div>
</div>

<br>
<jsp:include page="../include/footer.jsp" />

