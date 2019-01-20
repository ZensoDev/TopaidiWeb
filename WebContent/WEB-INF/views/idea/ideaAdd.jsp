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

<spring:url value="/ideas/processForm" var="processUrl" />
<c:set var="now" value="<%=new java.util.Date()%>" />

<form:form method="post" action="${processUrl}"
	modelAttribute="ideaform">
	<div class="form-group">
		<form:input path="idIdea" type="hidden" />
	</div>
	<div class="form-group">
		<form:input path="state" type="hidden" value="true"/>
	</div>
	<div class="form-group">
		<form:errors path="title" cssStyle="color:red;" />
		<form:label path="title">Title</form:label>
		<form:input path="title" />
	</div>
	<div class="form-group">
		
		<label for="sel1">Sélectionnez une catégorie :</label>
        <form:select path="category.idCat" class="form-control" id="sel1">
            <c:forEach items="${categories}" var="cat">
                <option value="${cat.idCat}"> ${cat}</option>
                <br>
            </c:forEach>
        </form:select>
	</div>
	<div class="form-group">
		<form:errors path="description" cssStyle="color:red;" />
		<form:label path="description">description</form:label>
		<form:input path="description" />
	</div>
	<div class="form-group">
		<form:label path="photo">Photo</form:label>
		<form:input path="photo" />
	</div>
	<div class="form-group">
		<form:errors path="date" cssStyle="color:red;" />
		<fmt:formatDate type="date" value="${now}" var="formatdate"
			pattern="yyyy-MM-dd" />
		<form:input path="date" type="hidden" value="${formatdate}" />
	</div>

	<input type="submit" value="Add">
</form:form>


</body>

</html>