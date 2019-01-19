<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ajout d'un commentaire</title>
<jsp:include page="../include/header.jsp" />



<c:set var="now" value="<%=new java.util.Date()%>" />
<div class="container">
	<div class="row">
		<div class="col-sm-2"></div>
		<div class="col-sm-8 text-center">
			<br> <br>
			<h1>Ajout d'un commentaire </h1>
			<br>

			<spring:url value="/comment/processForm" var="processUrl"></spring:url>
			<form:form method="post" action="${processUrl}"	modelAttribute="comform">
				<form:input path="idea.idIdea" type="hidden"/>
				<fmt:formatDate type="date"  value="${now}" var="formatdate" pattern="yyyy-MM-dd"/>
				<form:input path="date" type="hidden" value="${formatdate}"/>
				<form:input path="member.idMember" type="hidden" value="1" />

				<div class="form-group row">
					<form:errors path="text" cssStyle="color:red;"></form:errors>
					<form:label path="text" class="col-sm-2 col-form-label" >Commentaire : </form:label>
					<div class="col-sm-10">
						<form:input path="text" class="form-control" type="message"/>
					</div>
				</div>

								

				<div class="form-group row">
					<div class="col-sm-10">
						<input type="submit" class="btn btn-primary" value="Enregistrer le commentaire" />
					</div>
				</div>
			</form:form>
		</div>
		<div class="col-sm-2"></div>
	</div>
</div>
</body>
</html>