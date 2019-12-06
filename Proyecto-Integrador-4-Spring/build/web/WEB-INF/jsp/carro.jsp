<%-- 
    Document   : carro
    Created on : Dec 6, 2019, 12:55:55 AM
    Author     : Rodrigo
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Carro</title>
    </head>
    <body>
        <h1>Carro de compras</h1>
        <table cellpadding="2" cellspacing="2" border="1">
            <tr>
                <th>Option</th>
                <th>Id</th>
                <th>Name</th>
                <th>Photo</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Sub Total</th>
            </tr>
            <c:set var="total" value="0"></c:set>
            <c:forEach var="item" items="${sessionScope.carro }">
                <c:set var="total"
                       value="${total + item.producto.precio * item.cantidad }"></c:set>
                <tr>
                    <td align="center"><a
                            href="#"
                            onclick="return confirm('Are you sure?')">Remove</a></td>
                    <td>${item.producto.cod_prod }</td>
                    <td>${item.producto.producto }</td>
                    <td><img src="<c:out value="${item.producto.getImage()}"/>"
                             width="50"></td>
                    <td>${item.producto.precio }</td>
                    <td>${item.cantidad }</td>
                    <td>${item.producto.precio * item.cantidad }</td>
                </tr>
            </c:forEach>
            <tr>
                <td colspan="6" align="right">Sum</td>
                <td>${total }</td>
            </tr>
        </table>
        <br>
        <a href="">Continue
            Shopping</a>

    </body>
</html>
