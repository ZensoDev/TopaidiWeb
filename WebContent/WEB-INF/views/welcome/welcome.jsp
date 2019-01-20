<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<jsp:include page="../include/header.jsp" />
<br>

<div class="container">
	<div class="row">
		<div class="col-sm-2"></div>
		<div class="col-sm-8 text-center">
			<br>

			<div class="jumbotron">
				<h1 class="display-4">Bienvenue sur Topaidi</h1>
				<p class="lead">Le premier site de proposition d'idées pour améliorer la planète sur lequel tout le monde a droit à la parole et où chacun peut montrer son soutien.</p>
				<hr class="my-4">
				<p>Inscrivez-vous dès à présent, et postez votre première idée pour contribuer à vivre dans un meilleur pour nos enfants.</p>
				<a class="btn btn-primary btn-lg" href="http://localhost:8080/TopaidiWeb/members/add" role="button">Inscrivez-vous !</a>
			<br>
			<br>
			
				<a class="btn btn-primary btn-lg" href="http://localhost:8080/TopaidiWeb/ideas/add" role="button">Ajoutez une idée !</a>
			</div>

		</div>
		<div class="col-sm-2"></div>
	</div>
</div>

<jsp:include page="../include/footer.jsp" />