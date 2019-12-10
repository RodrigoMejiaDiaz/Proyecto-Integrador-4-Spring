<%-- 
    Document   : compraTerminada
    Created on : Dec 7, 2019, 7:38:22 PM
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
        <title>Gracias por Comprar</title>
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
                        <c:if test="${rol == '[ROLE_Administrador]'}">
                            <li class="nav-item">
                                <a class="nav-link border-bottom" href="admin-productos.htm">Administrar productos</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link border-bottom" href="admin-categorias.htm">Administrar categorías</a>
                            </li>
                        </c:if>
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
        <div class="container my-4">
            <div class="alert alert-success mx-auto" style="max-width: 500px;" role="alert">
                <h1>Gracias por comprar</h1>
                Su compra ha sido completada con éxito <br>
                Si tiene alguna pregunta no dude con comunicarse con nosotros: <br>
                <div class="card my-4 mr-5" style="width: 13rem;">
                    <div class="card-body">
                        <h5 class="card-title">Contáctanos</h5>
                        <p class="card-text">
                            Teléfono: +51 4587921<br>
                            Dirección: Dirección 1. N°3 Avenida Trece de Mayo
                        </p>
                    </div>
                </div>
                <a class="btn btn-danger" href="javascript:history.back(-1);" 
                   accesskey=""title="Regresar a la pagina anterior">Volver</a>
            </div>  
        </div>
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
