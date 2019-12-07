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
        <title>Producto</title>
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
                                <div class="dropdown dropleft d-none d-xl-block d-lg-block mx-2">
                                    <button class="btn dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <img src="images/user.svg" />
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
                            </c:when>
                            <c:otherwise>
                                <div class="dropdown">
                                    <button class="btn btn-outline-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <img src="$images/user.svg" />
                                    </button>
                                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                        <a class="dropdown-item" href="#">Perfil</a>
                                        <a class="dropdown-item" href="#">Cerrar Sesión</a>
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
                    <div class="container">
                        <div class="col-15">
                            <div class="row">
                                <div class="col-3 d-none d-lg-block d-xl-block">
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
                                <div class="col-6 my-4 bg-white">
                                    <div class="row py-4">
                                        <div class="col">
                                            <img src="<c:out value="${producto.getImage()}"/>" class="card-img" alt="...">
                                        </div>
                                        <div class="col">
                                            <h5 class="card-title"><c:out value="${producto.getProducto()}"/></h5>
                                            <p class="card-text">
                                                <c:out value="${producto.getDescripcion()}"/><br>
                                                <br>
                                                <strong>Stock:</strong> <c:out value="${producto.getStock()}"/>
                                            </p>
                                        </div>
                                    </div>                                
                                </div>
                                <div class="col-3 my-4">
                                    <div class="card text-center" style="max-width: 18rem;">
                                        <div class="card-body">
                                            <h5 class="card-title">S/.${producto.getPrecio()}</h5>
                                            <form>
                                                <div class="form-row my-4">
                                                    <label class="col col-form-label">Cantidad:</label>
                                                    <div class="col">
                                                        <input type="number" value="1" class="form-control" name="cantidad">
                                                    </div>
                                                </div> 
                                                <a href="comprar.htm?id=${producto.getCod_prod()}" class="btn btn-success">Comprar</a>
                                            </form>
                                        </div>
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                                            <div class="container">
                                                <h1>Artículos Relacionados</h1>
                                                <div class="carousel slide" data-ride="carousel" id="multi_item">
                                                    <div class="carousel-inner">
                                                        <div class="carousel-item active">
                                                            <div class="row">
                                                                <c:forEach items="${prod_rel_1}" var="prod">
                                                                    <div class="col-sm">
                                                                        <div class="card" style="width: 18rem;">
                                                                            <img src="<c:out value="${prod.image}"/>" class="card-img-top img-fluid" alt="..." />
                                                                            <div class="card-body">
                                                                                <h5 class="card-title font-weight-normal"><c:out value="${prod.producto}"/></h5>
                                                                                <p class="card-text"><strong>S/.<c:out value="${prod.precio}"/></strong></p>
                                                                                <a href="producto.htm?cod_prod=<c:out value="${prod.cod_prod}"/>&cod_cat=<c:out value="${prod.cod_cat_id}"/>" class="btn btn-success stretched-link">Detalles</a>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </c:forEach>
                                                            </div>
                                                        </div>
                                                        <div class="carousel-item">
                                                            <div class="row">
                                                                <c:forEach items="${prod_rel_2}" var="prod">
                                                                    <div class="col-sm">
                                                                        <div class="card" style="width: 18rem;">
                                                                            <img src="<c:out value="${prod.image}"/>" class="card-img-top img-fluid" alt="..." />
                                                                            <div class="card-body">
                                                                                <h5 class="card-title font-weight-normal"><c:out value="${prod.producto}"/></h5>
                                                                                <p class="card-text"><strong>S/.<c:out value="${prod.precio}"/></strong></p>
                                                                                <a href="producto.htm?cod_prod=<c:out value="${prod.cod_prod}"/>&cod_cat=<c:out value="${prod.cod_cat_id}"/>" class="btn btn-success stretched-link">Detalles</a>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </c:forEach>
                                                            </div>
                                                        </div>
                                                        <div class="carousel-item">
                                                            <div class="row">
                                                                <c:forEach items="${prod_rel_3}" var="prod">
                                                                    <div class="col-sm">
                                                                        <div class="card" style="width: 18rem;">
                                                                            <img src="<c:out value="${prod.image}"/>" class="card-img-top img-fluid" alt="..." />
                                                                            <div class="card-body">
                                                                                <h5 class="card-title font-weight-normal"><c:out value="${prod.producto}"/></h5>
                                                                                <p class="card-text"><strong>S/.<c:out value="${prod.precio}"/></strong></p>
                                                                                <a href="producto.htm?cod_prod=<c:out value="${prod.cod_prod}"/>&cod_cat=<c:out value="${prod.cod_cat_id}"/>" class="btn btn-success stretched-link">Detalles</a>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </c:forEach>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <a class="carousel-control-prev" href="#multi_item" role="button" data-slide="prev">
                                                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                                        <span class="sr-only">Previous</span>
                                                    </a>
                                                    <a class="carousel-control-next" href="#multi_item" role="button" data-slide="next">
                                                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                                        <span class="sr-only">Next</span>
                                                    </a>
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
                                            <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>

                                            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>

                                            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>
