<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="es">
<head>
</head>
<body>
 <c:set var="mensaje" value="JSTL funciona correctamente"/>

    <p>
        <c:out value="${mensaje}"/>
    </p>


         <table border="1" cellpadding="10">

                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Precio</th>
                </tr>

               <c:forEach var="product" items="${products}">
                   <tr>
                       <td>${product.id}</td>
                       <td><c:out value="${product.name}"/></td>
                       <td><c:out value="${product.price}"/></td>
                   </tr>
               </c:forEach>

            </table>

</body>
</html>