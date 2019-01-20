<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

			<h1>Liste des commentaires</h1>

			<br> <a href="../../comment/insert/${IdeaShow.idIdea}" class="btn btn-success btn-lg active"
				role="button" aria-pressed="true"><i class="fas fa-user-plus"></i> Ajouter un commentaire</a>
			<br> <br>
			<table class="table">
				<thead class="thead-primary">
					<tr>						
						<th scope="col">Member Name</th>
						<th scope="col">Commentaires</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${idea.comments}" var="comment">
						<tr>
							<td>${comment.member.firstName}</td>
							<td>${comment.text}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		