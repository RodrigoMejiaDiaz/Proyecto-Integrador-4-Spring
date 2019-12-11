<%-- 
    Document   : agregar-productos
    Created on : Dec 10, 2019, 5:02:01 PM
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
        <title>Agregar producto</title>
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
                                <a class="nav-link border-bottom" href="admin-categorias.htm">Administrar categorías</a>
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
            <h1>Añadir producto</h1>
            <form:form enctype="multipart/form-data" method="post" commandName="productos" action="resultado-agregar-productos.htm">
                <div class="form-group row">
                    <form:label path="producto" cssClass="col-sm-2 col-form-label">Nombre de producto:</form:label>
                    <div class="col-sm-10">
                    <form:input path="producto" type="text"  cssClass="form-control"/>
                    </div>
                </div>
                <div class="form-group row">
                    <form:label path="descripcion" cssClass="col-sm-2 col-form-label">Descripción:</form:label>
                    <div class="col-sm-10">
                    <form:input path="descripcion" type="text"  cssClass="form-control"/>
                    </div>
                </div>
                <div class="form-group row">
                    <form:label path="precio" cssClass="col-sm-2 col-form-label">Precio:</form:label>
                    <div class="col-sm-10">
                    <form:input path="precio" type="number"  cssClass="form-control"/>
                    </div>
                </div> 
                <div class="form-group row">
                    <form:label path="image" cssClass="col-sm-2 col-form-label">Imagen:</form:label>
                    <div class="col-sm-10">
                        <div class="custom-file">
                            <input type="file" name="file" class="custom-file-input" id="customFile"/>
                            <label class="custom-file-label" for="customFile">Escoger una imagen</label>
                        </div>
                    </div>
                </div>
                <div class="form-group row">
                    <form:label path="stock" cssClass="col-sm-2 col-form-label">Stock:</form:label>
                    <div class="col-sm-10">
                    <form:input path="stock" type="number"  cssClass="form-control"/>
                    </div>
                </div>
                <div class="form-group row">
                    <form:label path="cod_cat_id" cssClass="col-sm-2 col-form-label">Categoría:</form:label>
                    <div class="col-sm-10">
                    <form:select path="cod_cat_id" cssClass="form-control">
                        <c:forEach items="${cat}" var="categoria">
                            <form:option value="${categoria.cod_cat}">${categoria.categoria}</form:option>
                        </c:forEach>
                    </form:select>
                    </div>
                </div>
                <div class="form-group row">
                    <form:label path="cod_prov_id" cssClass="col-sm-2 col-form-label">Proveedor:</form:label>
                    <div class="col-sm-10">
                    <form:select path="cod_prov_id" cssClass="form-control">
                        <c:forEach items="${proveedores}" var="proveedor">
                            <form:option value="${proveedor.cod_prov}">${proveedor.proveedor}</form:option>
                        </c:forEach>
                    </form:select>
                    </div>
                </div>
                <div class="form-group row">
                    <form:label path="destacado" cssClass="col-sm-2 col-form-label">Destacado:</form:label>
                    <div class="col-sm-10">
                    <form:select path="destacado" cssClass="form-control">
                        <form:options items="${productos.getSeleccionEstado()}"/>
                    </form:select>
                    </div>
                </div>
                <div class="form-group row">
                    <form:label path="estado" cssClass="col-sm-2 col-form-label">Estado:</form:label>
                    <div class="col-sm-10">
                    <form:select path="estado" cssClass="form-control">
                        <form:options items="${productos.getSeleccionEstado()}"/>
                    </form:select>
                    </div>
                </div>
                    <div class="form-group">
                        <input type="submit" value="Enviar" class="btn btn-primary"/>
                        <a href="admin-productos.htm" class="btn btn-primary">Volver</a>
                    </div>
            </form:form>
        </div>
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    </body>
</html>
