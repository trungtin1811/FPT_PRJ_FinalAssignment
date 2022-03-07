<%-- 
    Document   : viewCart
    Created on : Feb 24, 2022, 11:07:32 AM
    Author     : User
--%>

<%@page import="trungtin.shopping.Tea"%>
<%@page import="trungtin.shopping.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart</title>
    </head>
    <body>
        <h1>Your selected item(s)</h1>
        <% Cart cart = (Cart) session.getAttribute("CART");
            if (cart != null) {
        %>
        <table border="1">
            <thead>
                <tr>
                    <th>No.</th>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Total</th>
                    <th>Delete</th>
                    <th>Update</th>
                </tr>
            </thead>
            <tbody>
                <% int count = 1;
                    double total = 0;
                    for (Tea tea : cart.getCart().values()) {
                        total += tea.getPrice() * tea.getQuantity();
                %>
            <form action="MainController">
                <tr>
                    <td><%= count++%></td>
                    <td><%= tea.getId()%>
                        <input type="hidden" name="id" value="<%= tea.getId()%>"> </td>
                    <td><%= tea.getName()%></td>
                    <td><%= tea.getPrice()%></td>
                    <td><input type="number" name="quantity" value="<%= tea.getQuantity()%>" min="1"></td>
                    <td><%= tea.getPrice() * tea.getQuantity()%></td>
                    <td><input type="submit" value="Remove" name="btnAction" /></td>
                    <td><input type="submit" value="Edit" name="btnAction" /></a></td>

                </tr>
            </form>

            <%
                }
            %>
        </tbody>
    </table>
    <h1>Total: <%=total%>$</h1>
    <%
        }

    %>
    <a href="shopping.jsp">Back To Shopping</a>

</body>
</html>
