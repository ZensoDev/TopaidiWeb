<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Formulaire catégorie</title>
</head>
<body>
	<jsp:include page="../include/adminNav.jsp" />

	<div class="container">
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6 text-center">
				<br> <br>
				<h1>Ajout d'une catégorie</h1>
				<br>
				<spring:url value="/categories/processForm" var="categoryformUrl" />
				
				<form:form method="POST" action="${categoryformUrl}"
					modelAttribute="categoryForm">
					<form:input path="idCat" type="hidden" />
					<spring:hasBindErrors name="categoryForm">
						<c:set var="errorClass" value="border:1px solid red;"></c:set>
					</spring:hasBindErrors>
					<form:label path="name">Nom de la catégorie</form:label>
					
					<form:input path="name" cssStyle="${errorClass}]"
						placeholder="Nom de la catégorie" />
					<form:errors path="name" cssStyle="color:red;font-weight:bold" />
					<input type="submit" class="btn btn-primary" value="Soumettre" />
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
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<jsp:include page="../include/footer.jsp" />