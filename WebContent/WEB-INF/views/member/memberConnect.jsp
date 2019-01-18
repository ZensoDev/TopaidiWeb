<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<spring:url value="/members/connectForm" var="connectUrl" />

<form:form method="post" action="${connectUrl}"
	modelAttribute="connectform">
	
	<div class="form-group">
		<form:errors path="loginMail" cssStyle="color:red;" />
		<form:label path="loginMail">login Mail</form:label>
		<form:input path="loginMail" />
	</div>
        
	<div class="form-group">
		<form:errors path="password" cssStyle="color:red;" />
		<form:label path="password">mot de passe</form:label>
		<form:input path="password" />
	</div>
	
	
  	<input type="submit" value="Se connecter">
</form:form>

</body>

</html>