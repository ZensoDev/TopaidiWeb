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
<title>Ajout d'une idée</title>
<jsp:include page="../include/header.jsp" />

<div class="container">
	<div class="row">
		<div class="col-sm-3"></div>
		<div class="col-sm-6 text-center">
			<br> <br>
			<h1>Ajout d'une idée</h1>
			<br>



			<spring:url value="/ideas/processForm" var="processUrl" />
			<c:set var="now" value="<%=new java.util.Date()%>" />

			<form:form method="post" action="${processUrl}"
				modelAttribute="ideaform">

				<div class="form-group row">
					<form:input path="state" type="hidden" value="true" />
				</div>
				<div class="form-group row">
					<form:errors path="title" cssStyle="color:red;" />
					<form:label path="title" class="col-sm-2 col-form-label">Titre : </form:label>
					<div class="col-sm-10">
						<form:input path="title" />
					</div>
				</div>
				<div class="form-group row">

					<label for="sel1">Sélectionnez une catégorie :</label>
					<form:select path="category.idCat" class="form-control" id="sel1">
						<c:forEach items="${categories}" var="cat">
							<option value="${cat.idCat}">${cat}</option>
							<br>
						</c:forEach>
					</form:select>
				</div>
				<div class="form-group row">
					<form:errors path="description" cssStyle="color:red;" />
					<form:label path="description" class="col-sm-2 col-form-label">Description : </form:label>
					<div class="col-sm-10">
						<form:input path="description" type="textarea"/>
					</div>
				</div>
				<div class="form-group row">
					<form:label path="photo" class="col-sm-2 col-form-label">Photo : </form:label>
					<div class="col-sm-10">
						<form:input path="photo" />
					</div>
				</div>
				<div class="form-group row">
					<form:errors path="date" cssStyle="color:red;" />
					<fmt:formatDate type="date" value="${now}" var="formatdate"
						pattern="yyyy-MM-dd" />
					<div class="col-sm-10">
						<form:input path="date" type="hidden" value="${formatdate}" />
					</div>
				</div>

				<input type="submit" class="btn btn-primary" value="Ajouter l'idée">
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