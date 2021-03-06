
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Classement Buzz</title>
<jsp:include page="../include/header.jsp" />

<div class="container">
	<div class="row">
		<div class="col-sm-2"></div>
		<div class="col-sm-8 text-center">
			<br> <br>
			<h1>Classement BRAINS</h1>
			<br>
			<table class="table" >
				<thead>
					<tr>
						<th scope="col">Prénom</th>
						<th scope="col">Nombre d'idées postées</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${brains}" var="brain">
						<tr>
							<td>${brain.key.firstName}</td>
							<td>${brain.value}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

		</div>
		<div class="col-sm-2"></div>
	</div>
</div>
<br>
<br>
<br><br>
<br>
<br><br><br><br><br><br><br><br>
<jsp:include page="../include/footer.jsp" />