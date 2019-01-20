<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Classement Top</title>
<jsp:include page="../include/header.jsp" />

<div class="container">
	<div class="row">
		<div class="col-sm-2"></div>
		<div class="col-sm-8 text-center">
			<br> <br>
			<h1>Classement TOP</h1>
			<br>
			<table class="table">
				<thead>
					<tr>
						<th scope="col">Titre</th>
						<th scope="col">Catégorie</th>
						<th scope="col">Note</th>
						<th scope="col">Nombre de vote</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${tops}" var="top">
						<tr>
							<td>${top.key.title}</td>
							<td>${top.key.category.name}</td>
							<td>${top.value}</td>
							<td>${top.value}</td>

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