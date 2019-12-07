<%-- 
    Document   : error-login
    Created on : Dec 6, 2019, 11:25:02 PM
    Author     : Rodrigo
--%>


<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <title>Acceso Denegado</title>
    </head>
    <body>
    <center>
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
                    <a href="login.htm" class="mx-2" id="dropdownMenuButton">
                        <img src="images/user.svg" />                    
                    </a>
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
        <div class="alert alert-primary" role="alert">
            <h1>Error de Acceso</h1>
            Las credenciales suministradas son incorrectas <br>
            Vuelva a autentificarse con las credenciales correctas <br>
            <a class="btn btn-danger" href="javascript:history.back(-1);" 
               accesskey=""title="Regresar a la pagina anterior">Volver</a>
        </div>          
    </center>
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
</body>
</html>