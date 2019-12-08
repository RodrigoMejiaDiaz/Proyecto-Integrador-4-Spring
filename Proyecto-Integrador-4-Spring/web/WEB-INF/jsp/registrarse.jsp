<%-- 
    Document   : registrarse
    Created on : Dec 7, 2019, 7:54:20 PM
    Author     : Rodrigo
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <title>Registrarse</title>
    </head>
    <body class="bg-light">
        <div class="sticky-top">
            <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #e3f2fd;">
                <a class="navbar-brand" href="/ProyectoSpring/index.htm">
                    <img src="images/logo.png" 
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
                        <button class="btn btn-outline-success my-2 my-sm-0" type="submit"><img src="images/search.svg" /> </button>
                    </form>
                    <c:choose>
                        <c:when test="${username == 'anonymousUser'}">
                            <button class="btn" type="button">
                                <a href="login.htm"><img src="images/user.svg" /></a>
                            </button> 
                        </c:when>
                        <c:otherwise>
                            <div class="dropdown">
                                <button class="btn btn-outline-secondary mx-2 dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <img src="images/user.svg" />
                                </button>
                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                    <a class="dropdown-item" href="#">Perfil</a>
                                    <a class="dropdown-item" href="salir.htm">Cerrar Sesión</a>
                                </div>
                            </div>
                        </c:otherwise>
                    </c:choose>
                    <a href="carro.htm" class="mx-2" id="dropdownMenuButton">
                        <img src="images/shopping-cart.svg" />
                    </a>
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
        
    <center>
        <div class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
            <div class="containerborder-top border-bottom border-black">
                <h1>Registrarse</h1>
            </div>
            <div class="container py-4">
                <form:form modelAttribute="form" method="POST">
                    <div class="form-group row">
                        <label class="col col-form-label">Username:</label>
                        <div class="col">
                            <form:input path="username" cssClass="form-control"/>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col col-form-label">Password:</label>
                        <div class="col">
                            <form:input path="password" cssClass="form-control"/>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col col-form-label">Correo:</label>
                        <div class="col">
                            <form:input path="correo" cssClass="form-control"/>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col col-form-label">Nombres:</label>
                        <div class="col">
                            <form:input path="nombre" cssClass="form-control" type="text"/>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col col-form-label">Apellidos</label>
                        <div class="col">
                            <form:input path="apellido" cssClass="form-control" type="text"/>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col col-form-label">Fecha de Nacimiento:</label>
                        <div class="col">
                            <form:input path="fec_nac" cssClass="form-control" type="date"/>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col col-form-label">Sexo:</label>
                        <div class="col">
                            <div class="form-check form-check-inline">
                                <form:checkbox path="sexo" cssClass="form-check-input" value="Masculino" />Masculino
                            </div>
                            <div class="form-check form-check-inline"> 
                                <form:checkbox path="sexo" cssClass="form-check-input" value="Fenenino" />Femenino
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col col-form-label">Compañía:</label>
                        <div class="col">
                            <form:input path="compañia" cssClass="form-control"/>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col col-form-label">Teléfono:</label>
                        <div class="col">
                            <form:input path="telefono" cssClass="form-control" type="number"/>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col col-form-label">Términos y Condiciones:</label>
                        <div class="col">
                            <div class="form-check form-check-inline">
                                <form:checkbox path="terms" cssClass="form-check-input" value="true" />Acepto
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <a href="index.htm" class="btn btn-primary" >Volver a Index</a>
                        <input type="submit" value="Enviar" class="btn btn-primary" />
                    </div>
                </form:form>
            </div>
        </div>
    </center>
        
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>

        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
    <footer class="container-fluid fixed-bottom d-none d-xl-block d-lg-block" style="background-color: #e3f2fd;">
        <div class="row w-100">
            <div class="col-fluid py-3 px-5">
                <img src="images/logo.png" 
                     width="70" height="70" class="d-inline-block align-top img-thumbnail" alt="Logo">
            </div>
            <div class="col-fluid m-2 pr-5">
                <h4>IME</h4>
                <a href="" class="text-decoration-none">Sobre nosotros</a><br>
                <a href="" class="text-decoration-none">Ubícanos</a><br>
                <a href="" class="text-decoration-none">Contacto</a><br>
            </div>
            <div class="col-fluid m-2 pr-5">
                <h4>Horario</h4>
                <p>Lunes a viernes 9:00 a 16:30</p>
            </div>
            <div class="col-fluid m-2 pr-5">
                <h4>Información</h4>
                <a href="" class="text-decoration-none">Condiciones</a><br>
                <a href="" class="text-decoration-none">Comerciales</a><br>
                <a href="" class="text-decoration-none">Política de privacidad</a><br>
            </div>
        </div>
    </footer>
</html>
