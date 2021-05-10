<%--
    Document   : products
    Created on : Mar 19, 2021, 10:33:54 AM
    Author     : Sebastian
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="myBeans.DBConnect" %>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="header.jsp"%>
        <link rel="stylesheet" href="productStyle.css">
        <title>Products</title>
    </head>
    <body>
        <div class="flexcontent">
            <%            
                DBConnect dbConnect = new DBConnect();
                out.print(dbConnect.displayProducts("select productID, brand, model, price, stock, sale from product"));
            %>
        </div>
        <%@include file="footer.jsp"%>        
    </body>
</html>