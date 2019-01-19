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

<spring:url value="/members/processForm" var="processUrl" />

<form:form method="post" action="${processUrl}"
	modelAttribute="memberform">
	<div class="form-group">
		<form:input path="idMember" type="hidden" />
		<form:input path="state" type="hidden" value="false"/>
	</div>
	<div class="form-group">
		<form:errors path="loginMail" cssStyle="color:red;" />
		<form:label path="loginMail">login Mail</form:label>
		<form:input path="loginMail" />
	</div>
	<div class="form-group">
		<form:errors path="password" cssStyle="color:red;" />
		<form:label path="password">password</form:label>
		<form:input path="password" />
	</div>
	<div class="form-group">
		<form:errors path="lastName" cssStyle="color:red;" />
		<form:label path="lastName">last Name</form:label>
		<form:input path="lastName" />
	</div>
	<div class="form-group">
		<form:errors path="firstName" cssStyle="color:red;" />
		<form:label path="firstName">First Name</form:label>
		<form:input path="firstName" />
	</div>
	<div class="form-group">
		<form:input path="admin" type="hidden" value="false"/>
	</div>
  	<input type="submit" value="Add">
</form:form>


</body>

</html>