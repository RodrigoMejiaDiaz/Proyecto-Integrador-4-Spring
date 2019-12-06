<%-- 
    Document   : categorias
    Created on : Dec 4, 2019, 5:44:41 PM
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
        <title>Categorías</title>
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
                        <div class="dropdown dropleft d-none d-xl-block d-lg-block mx-2">
                            <button class="btn dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <img src="${pageContext.request.contextPath}/resources/images/user.svg" />
                            </button>
                            <div class="dropdown-menu">
                                <form class="px-4 py-3">
                                    <div class="form-group">
                                        <label for="exampleDropdownFormEmail1">Email address</label>
                                        <input type="email" class="form-control" id="exampleDropdownFormEmail1" placeholder="email@example.com">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleDropdownFormPassword1">Password</label>
                                        <input type="password" class="form-control" id="exampleDropdownFormPassword1" placeholder="Password">
                                    </div>
                                    <div class="form-group">
                                        <div class="form-check">
                                            <input type="checkbox" class="form-check-input" id="dropdownCheck">
                                            <label class="form-check-label" for="dropdownCheck">
                                                Remember me
                                            </label>
                                        </div>
                                    </div>
                                    <button type="submit" class="btn btn-primary">Sign in</button>
                                </form>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#">New around here? Sign up</a>
                                <a class="dropdown-item" href="#">Forgot password?</a>
                            </div>
                        </div>
                        <a href="carro.htm" class="mx-2" id="dropdownMenuButton">
                            <img src="${pageContext.request.contextPath}/resources/images/shopping-cart.svg" />
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
                    <div class="container">
                        <div class="col col-12">
                            <div class="row">
                                <div class="col col-3 d-none d-lg-block d-xl-block">
                                    <div class="card my-4 mr-5" style="width: 13rem;">
                                        <div class="card-body">
                                            <h5 class="card-title">Precio</h5>
                                            <a href="#" class="card-link">Menos de S/.20</a><br>
                                            <a href="#" class="card-link">Entre S/.20 y S/.40</a><br>
                                            <a href="#" class="card-link">Entre S/.40 y S/.100</a><br>
                                            <a href="#" class="card-link">Más de S/.100</a>
                                        </div>
                                    </div>
                                    <div class="card my-4 mr-5" style="width: 13rem;">
                                        <div class="card-body">
                                            <h5 class="card-title">Contáctanos</h5>
                                            <p class="card-text">
                                                Teléfono: +51 4587921<br>
                                                Dirección: Dirección 1. N°3 Avenida Trece de Mayo
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col col-9">
                                    <c:forEach items="${cat}" var="categoria">
                                        <c:if test="${cod_cat == categoria.cod_cat}">
                                            <div class="card my-4" style="max-width: 540px;">
                                                <div class="row no-gutters">
                                                    <div class="col-md-4">
                                                        <img src="<c:out value="${categoria.image}" />" class="card-img" alt="...">
                                                    </div>
                                                    <div class="col-md-8">
                                                        <div class="card-body">
                                                            <h5 class="card-title"><c:out value="${categoria.categoria}" /></h5>
                                                            <p class="card-text"><c:out value="${categoria.descripcion}" /></p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                    <div class="row">
                                        <div class="col">
                                            <p class="">Mostrando: <c:out value="${cant}"/> resultados</p>
                                        </div>
                                        <div class="col mx-3">
                                            <div class="dropdown text-right">
                                                <button class="btn btn-outline-dark dropdown-toggle" type="button" data-toggle="dropdown" 
                                                        aria-haspopup="true" aria-expanded="false">
                                                    Filtrar por:
                                                </button>
                                                <div class="dropdown-menu">
                                                    <a class="dropdown-item" href="#">Nombre: A-Z</a>
                                                    <a class="dropdown-item" href="#">Nombre: Z-A</a>
                                                    <a class="dropdown-item" href="#">Precio: Mayor a Menor</a>
                                                    <a class="dropdown-item" href="#">Precio: Menor a Mayor</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-deck">
                                        <c:forEach items="${prod}" var="producto">
                                            <div class="col col-4">
                                                <div class="card border-0 d-none d-lg-block d-xl-block">
                                                    <img src="<c:out value="${producto.image}"/>" class="card-img-top" 
                                                         alt="Producto"/>
                                                    <div class="card-body">
                                                        <h5 class="card-title font-weight-normal"><c:out value="${producto.producto}"/></h5>
                                                        <p class="card-text"><strong>S/.<c:out value="${producto.precio}"/></strong></p>
                                                        <a href="producto.htm?cod_prod=<c:out value="${producto.cod_prod}"/>&cod_cat=<c:out value="${producto.cod_cat_id}"/>" class="btn btn-success stretched-link">Detalles</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach> 
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                        <footer class="container-fluid" style="background-color: #e3f2fd;">
                            <div class="row w-100">
                                <div class="col-fluid py-3 px-5">
                                    <img src="${pageContext.request.contextPath}/resources/images/logo.png" 
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
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    </body>
</html>