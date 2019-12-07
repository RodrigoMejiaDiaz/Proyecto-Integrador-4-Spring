<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<!doctype html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" 
              integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" 
              crossorigin="anonymous">
        <title>Página Principal</title>
    </head>
    
    <body>
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
                                    <a class="dropdown-item" href="categorias.htm?cod_cat=<c:out value="${categorias.cod_cat}"/>"><c:out value="${categorias.categoria}" /></a>
                                </c:forEach>
                            </div>
                        </li>
                    </ul>
                    <form class="form-inline d-none d-xl-block d-lg-block my-2 my-lg-0">
                        <input class="form-control mr-sm-2" type="search" placeholder="Buscar producto..." aria-label="Search">
                        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">
                            <img src="images/search.svg" /> 
                        </button>
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
                            <a class="nav-link active border-bottom" href="index.htm">Inicio</a>
                        </li>
                        <c:forEach items="${cat}" var="categorias">
                            <li class="nav-item">
                                <a class="nav-link border-bottom" href="categorias.htm?cod_cat=<c:out value="${categorias.cod_cat}"/>"><c:out value="${categorias.categoria}" /></a>
                            </li>
                        </c:forEach>
                        </div>
                    </ul>
        </div>
                        <div id="carouselExampleFade" class="carousel slide carousel-fade d-none d-lg-block d-xl-block" data-ride="carousel">
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <img src="images/2.jpg" 
                                         class="d-block w-100" style="height: 500px;" alt="...">
                                    <div class="carousel-caption d-none d-md-block">
                                        <h5><strong>First slide label</strong></h5>
                                        <p><strong>Nulla vitae elit libero, a pharetra augue mollis interdum.</strong></p>
                                    </div>
                                </div>
                                <div class="carousel-item">
                                    <img src="images/carrousel6.jpg" 
                                         class="d-block w-100" style="height: 500px;" alt="...">
                                    <div class="carousel-caption d-none d-md-block">
                                        <h5><strong>Second slide label</strong></h5>
                                        <p><strong>Nulla vitae elit libero, a pharetra augue mollis interdum.</strong></p>
                                    </div>
                                </div>
                                <div class="carousel-item">
                                    <img src="images/carrousel3.png" 
                                         class="d-block w-100" style="height: 500px;" alt="...">
                                    <div class="carousel-caption d-none d-md-block">
                                        <h5><strong>Third slide label</strong></h5>
                                        <p><strong>Nulla vitae elit libero, a pharetra augue mollis interdum.</strong></p>
                                    </div>
                                </div>
                            </div>
                            <a class="carousel-control-prev" href="#carouselExampleFade" role="button" data-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a class="carousel-control-next" href="#carouselExampleFade" role="button" data-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="sr-only">Next</span>
                            </a>
                        </div>
                                         <div class="container py-4">
                                             <h1>Categorías</h1>
                                             <div class="row row-cols-1 row-cols-md-3">
                                                 <c:forEach items="${cat}" var="categoria">
                                                     <div class="col mb-4">
                                                         <a class="text-decoration-none" href="categorias.htm?cod_cat=<c:out value="${categoria.cod_cat}"/>">
                                                             <div class="card h-100">
                                                                 <img src="<c:out value="${categoria.image}" />" class="card-img-top" style="height: 400px;" alt="...">
                                                                 <div class="card-body">
                                                                     <h5 class="card-title text-center"><c:out value="${categoria.categoria}" /></h5>
                                                                 </div>
                                                             </div>
                                                         </a>
                                                     </div>
                                                 </c:forEach>
                                             </div>
                                         </div>
                                         <div class="container">
                                             <h1>Artículos Destacados</h1>
                                             <div class="carousel slide" data-ride="carousel" id="multi_item">
                                                 <div class="carousel-inner">
                                                     <div class="carousel-item active">
                                                         <div class="row">
                                                             <c:forEach items="${prod}" var="producto">
                                                                 <div class="col-sm">
                                                                     <div class="card" style="width: 18rem;">
                                                                         <img src="<c:out value="${producto.image}"/>" class="card-img-top img-fluid" alt="..." />
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
                                                     <div class="carousel-item">
                                                         <div class="row">
                                                             <c:forEach items="${prod2}" var="producto">
                                                                 <div class="col-sm">
                                                                     <div class="card" style="width: 18rem;">
                                                                         <img src="<c:out value="${producto.image}"/>" class="card-img-top img-fluid" alt="..." />
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
                                                     <div class="carousel-item">
                                                         <div class="row">
                                                             <c:forEach items="${prod3}" var="producto">
                                                                 <div class="col-sm">
                                                                     <div class="card" style="width: 18rem;">
                                                                         <img src="<c:out value="${producto.image}"/>" class="card-img-top img-fluid" alt="..." />
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
                                         <script>
                                             $('#bs4-multi-slide-carousel').carousel({
                                               interval: 400
                                             });
                                         </script>
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    </body>
</html>
