<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<spring:url value="/ideas/processForm" var="processUrl" />

<form:form method="post" action="${processUrl}" modelAttribute="ideaform">
	<div class="form-group">
		<form:input path="idIdea" type="hidden" />
	</div>
	<div class="form-group">
	<form:errors path="title" cssStyle="color:red;" />
		<form:label path="title">Title</form:label>
		<form:input path="title" />
	</div>
	<div> 
	<form:label path="category.idCat">Category</form:label>
		<form:select path="category.idCat" items="${categoryList}" itemLabel="name" itemValue="id" class="form-control"/>
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
		<form:label path="date">Date</form:label>
		<form:input type="date" path="date" />
	</div>
		
	<input type="submit" value="Add">
</form:form>


</body>

</html>