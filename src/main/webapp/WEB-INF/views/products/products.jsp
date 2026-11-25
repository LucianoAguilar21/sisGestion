
    <p>
        <c:out value="${mensaje}"/>
    </p>


         <table >

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

