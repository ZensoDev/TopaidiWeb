<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Administration</title>
</head>
<body>

	<jsp:include page="include/adminNav.jsp" />

	<div class="container">
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6 text-center">
				<br> <br>
				<div class="jumbotron">
					<h1 class="display-4">Bienvenue sur l'Administration de Topaidi</h1>
					<p class="lead">Le premier site de proposition d'idées pour
						améliorer la planète sur lequel tout le monde a droit à la parole
						et où chacun peut montrer son soutien.</p>
					<hr class="my-4">
					
				</div>
			</div>
			<div class="col-sm-3"></div>
		</div>
	</div>
	
	<br>
	<jsp:include page="include/footer.jsp" />