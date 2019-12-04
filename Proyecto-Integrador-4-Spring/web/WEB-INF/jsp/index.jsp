<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<!doctype html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" 
              integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" 
              crossorigin="anonymous">
        <title>Página Principal</title>
    </head>

    <body>
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <a class="navbar-brand" href="/ProyectoSpring/index.htm">
                    <img src="${pageContext.request.contextPath}/resources/images/logo.png" 
                        class="img-thumbnail" width="70" height="70" class="d-inline-block align-top" alt="logo">
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="/ProyectoSpring/index.htm">Inicio</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Sobre IME</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Contacto</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Ubícanos</a>
                        </li>
                    </ul>
                    <form class="form-inline my-2 my-lg-0">
                        <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                    </form>
                </div>
            </nav>
                        <div id="carouselExampleFade" class="carousel slide carousel-fade" data-ride="carousel">
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <img src="${pageContext.request.contextPath}/resources/images/2.jpg" 
                                         class="d-block w-100" style="height: 500px;" alt="...">
                                    <div class="carousel-caption d-none d-md-block">
                                        <h5><strong>First slide label</strong></h5>
                                        <p><strong>Nulla vitae elit libero, a pharetra augue mollis interdum.</strong></p>
                                    </div>
                                </div>
                                <div class="carousel-item">
                                    <img src="${pageContext.request.contextPath}/resources/images/carrousel6.jpg" 
                                         class="d-block w-100" style="height: 500px;" alt="...">
                                    <div class="carousel-caption d-none d-md-block">
                                        <h5><strong>Second slide label</strong></h5>
                                        <p><strong>Nulla vitae elit libero, a pharetra augue mollis interdum.</strong></p>
                                    </div>
                                </div>
                                <div class="carousel-item">
                                    <img src="${pageContext.request.contextPath}/resources/images/carrousel3.png" 
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
                                                         <a href="#">
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
                                         <div class="container py-4">
                                             <h1>Artículos populares</h1>
                                         </div>
                       
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    </body>
</html>
