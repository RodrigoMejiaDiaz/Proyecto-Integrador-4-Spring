<%-- 
    Document   : admin-compras-detalles
    Created on : Dec 10, 2019, 11:10:14 PM
    Author     : Rodrigo
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" 
              integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" 
              crossorigin="anonymous">
        <title>Administrar compras</title>
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
                        <c:if test="${rol == '[ROLE_Administrador]'}">
                            <li class="nav-item">
                                <a class="nav-link border-bottom" href="admin-productos.htm">Administrar productos</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link border-bottom" href="admin-compras.htm">Administrar compras</a>
                            </li>
                        </c:if>
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
        <div class="container">
            <div class="row">
                <a href="" class="btn btn-success my-3">Insertar</a>
                <table class="table table-bordered table-striped table-hover">
                    <thead>
                        <tr>
                            <td>Código compra</td>
                            <td>Producto</td>
                            <td>Cantidad</td>
                            <td>Monto</td>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${compras}" var="compra">
                            <tr>
                                <td><c:out value="${compra.cod_compra}"/></td>
                                <c:forEach items="${productos}" var="producto">
                                    <c:if test="${compra.cod_prod == producto.cod_prod}" >
                                        <td><a class="nav-link border-bottom" 
                                               href="<c:url value="producto.htm?cod_prod=${producto.cod_prod}&cod_cat=${producto.cod_cat_id}"/>">
                                                <c:out value="${producto.producto}"/>
                                            </a></td>
                                    </c:if>
                                </c:forEach>
                                <td><c:out value="${compra.cantidad}"/></td>
                                <td>S/.<c:out value="${compra.monto}"/></td>
                                <td>
                                    <a href=""
                                       class="btn btn-primary">Editar</a>
                                    <a href=""
                                       class="btn btn-danger">Eliminar</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    </body>
</html>