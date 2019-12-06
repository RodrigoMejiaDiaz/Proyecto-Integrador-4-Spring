<%-- 
    Document   : producto
    Created on : Dec 5, 2019, 8:15:12 PM
    Author     : Rodrigo
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" 
              integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" 
              crossorigin="anonymous">
        <title><c:out value="${prod.getProducto()}"/></title>
    </head>
    <body class="bg-light">
        <div class="sticky-top">
            <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #e3f2fd;">
                <a class="navbar-brand" href="/ProyectoSpring/index.htm">
                    <img src="${pageContext.request.contextPath}/resources/images/logo.png" 
                         width="70" height="70" class="d-inline-block align-top img-thumbnail" alt="logo">
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item">
                            <a class="nav-link border-bottom" href="/ProyectoSpring/index.htm">Inicio</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link border-bottom" href="#">Sobre IME</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link border-bottom" href="#">Contacto</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link border-bottom" href="#">Ubícanos</a>
                        </li>
                        <li class="nav-item dropdown d-xl-none d-lg-none">
                            <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Categorías</a>
                            <div class="dropdown-menu">
                                <c:forEach items="${cat}" var="categorias">
                                    <a class="dropdown-item <c:if test="${cod_cat == categorias.cod_cat}" >active</c:if>" href="categorias.htm?cod_cat=<c:out value="${categorias.cod_cat}"/>"><c:out value="${categorias.categoria}" /></a>
                                </c:forEach>
                            </div>
                        </li>
                    </ul>
                    <form class="form-inline my-2 my-lg-0">
                        <input class="form-control mr-sm-2" type="search" placeholder="Buscar producto..." aria-label="Search">
                        <button class="btn btn-outline-success my-2 my-sm-0" type="submit"><img src="${pageContext.request.contextPath}/resources/images/search.svg" /> </button>
                    </form>
                </div>
            </nav>
            <ul class="nav nav-tabs navbar-light navbar-expand-lg d-none d-lg-block" style="background-color: #e3f2fd;">
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <li class="nav-item">
                        <a class="nav-link border-bottom" href="index.htm">Inicio</a>
                    </li>
                    <c:forEach items="${cat}" var="categorias">
                        <li class="nav-item">
                            <a class="nav-link border-bottom <c:if test="${cod_cat == categorias.cod_cat}" >active</c:if>"  href="categorias.htm?cod_cat=<c:out value="${categorias.cod_cat}"/>"><c:out value="${categorias.categoria}" /></a>
                            </li>
                    </c:forEach>
                </div>
            </ul>
        </div>
    </body>
</html>
