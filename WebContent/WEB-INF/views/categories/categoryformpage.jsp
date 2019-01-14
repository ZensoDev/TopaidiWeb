<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Formulaire catégorie</title>
</head>
<body>
<spring:url value="/categories/categoryform" var="/categoryformUrl" />
	<form:form method="POST" action="${categoryformUrl}" modelAttribute="categoryForm">
		<form:input path="id" type="hidden"/>
		<spring:hasBindErrors name="categoryForm">
			<c:set var="errorClass" value="border:1px solid red;"></c:set>
		</spring:hasBindErrors>	
			<form:label path="name">Nom de la catégorie</form:label>
			<form:input path="name" cssStyle="${errorClass}]" placeholder="Nom de la catégorie"/>
			<form:errors path="name" cssStyle="color:red;font-weight:bold"/> 
		<input type="submit" value="Soumettre"/>
	</form:form>
</body>
</html>