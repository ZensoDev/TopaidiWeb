<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Connexion</title>
<jsp:include page="../include/header.jsp" />

<div class="container">
	<div class="row">
		<div class="col-sm-3"></div>
		<div class="col-sm-6 text-center">
			<br> <br>
			<h1>Connection à votre compte</h1>
			<br>

			<spring:url value="/members/connectForm" var="connectUrl" />
			<c:choose>
				<c:when test="${error.equals('connectionFailed')}">
					<h4 style="color: red;">Mauvais identifiants. Merci d'essayer
						à nouveau !</h4>
				</c:when>
				<c:when test="${error.equals('invalidUser')}">
					<h4 style="color: red;">You can't connect until an
						administrator validate your inscription.</h4>
				</c:when>
				<c:when test="${error.equals('inactiveUser')}">
					<h4 style="color: red;">You can't connect while you are
						desactivated.</h4>
				</c:when>
			</c:choose>
			<form:form method="post" action="${connectUrl}"
				modelAttribute="connectform">

				<div class="form-group row">
					<form:errors path="loginMail" cssStyle="color:red;" />
					<form:label path="loginMail" class="col-sm-2 col-form-label">login Mail</form:label>
					<div class="col-sm-10">
						<form:input path="loginMail" type="text"/>
					</div>
				</div>

				<div class="form-group row">
					<form:errors path="password" cssStyle="color:red;" />
					<form:label path="password" class="col-sm-2 col-form-label">mot de passe</form:label>
					<div class="col-sm-10">
						<form:input path="password" class="form-control" type="password" />
					</div>
				</div>
				<div class="form-group row">
					<div class="col-sm-10">
						<input type="submit" class="btn btn-primary" value="Se connecter">
					</div>
			</form:form>
		</div>
		<div class="col-sm-3"></div>
	</div>
</div>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<jsp:include page="../include/footer.jsp" />