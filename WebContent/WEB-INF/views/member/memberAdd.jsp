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
<title>Ajout d'un utilisateur</title>
<jsp:include page="../include/header.jsp" />


<div class="container">
	<div class="row">
		<div class="col-sm-3"></div>
		<div class="col-sm-6 text-center">
			<br> <br>
			<h1>Ajout d'un utilisateur</h1>
			<br>


			<spring:url value="/members/processForm" var="processUrl" />

			<form:form method="post" action="${processUrl}"
				modelAttribute="memberform">
				<div class="form-group row">
					<form:input path="admin" type="hidden" />
					<form:input path="state" type="hidden" />
				</div>
				<div class="form-group row">
					<form:errors path="loginMail" cssStyle="color:red;" />
					<form:label path="loginMail" class="col-sm-2 col-form-label">Adresse email :</form:label>

					<div class="col-sm-10">
						<form:input path="loginMail" class="form-control" />
					</div>
				</div>
				<div class="form-group row">
					<form:errors path="password" cssStyle="color:red;" />
					<form:label path="password" class="col-sm-2 col-form-label">Mot de passe :</form:label>
					<div class="col-sm-10">
						<form:input path="password" class="form-control" type="password"/>
					</div>
				</div>
				<div class="form-group row">
					<form:errors path="lastName" cssStyle="color:red;" />
					<form:label path="lastName" class="col-sm-2 col-form-label">Nom :</form:label>
					<div class="col-sm-10">
						<form:input path="lastName" class="form-control" />
					</div>
				</div>
				<div class="form-group row">
					<form:errors path="firstName" cssStyle="color:red;" />
					<form:label path="firstName" class="col-sm-2 col-form-label">Prénom :</form:label>
					<div class="col-sm-10">
						<form:input path="firstName" class="form-control" />
					</div>
				</div>
				<div class="form-group row">
				<div class="col-sm-10">
					<input type="submit" class="btn btn-primary" value="S'inscrire">
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
<jsp:include page="../include/footer.jsp" />