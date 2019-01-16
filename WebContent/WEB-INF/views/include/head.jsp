<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link
	href="https://fonts.googleapis.com/css?family=Euphoria+Script|Gloria+Hallelujah"
	rel="stylesheet">
<link rel="stylesheet" href="<spring:url value="/css/style.css" />" />
<style type="text/css">
header { font-family: 'Euphoria Script', cursive; color: white;
font-size: 4em; background-image:
url("/images/connectwork.png"); } body { background-color:
grey; font-family:georgia; color:black; } ul#menu
li { display: inline; font-size: 20px; padding-left: 25px; } h2 {
font-weight: bold; text-decoration: underline; } #pond { display: flex;
background-color: white } #pond1 { display: flex; flex-direction:
column; } footer{ background-color: gray;} #contact{ color: black;}

section{ display: flex; } #menu1{ padding-top: 20px}

</style>

<title>Topaidi</title>
</head>

<body>
	<header> Topaidi </header>
	<jsp:include page="menu.jsp" />

	