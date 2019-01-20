
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Classement Buzz</title>
<style>
</style>
</head>
<body>
	<table>
			<c:forEach items="${brains}" var="brain">
		<tr>
				<td>${brain.key.firstName}</td>
				<td> ${brain.value}</td>
		</tr>
			</c:forEach>

	</table>
</body>
</html>