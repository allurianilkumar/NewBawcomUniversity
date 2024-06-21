<%-- 
    Document   : Print
    Created on : Sep 26, 2016, 12:33:09 AM
    Author     : LENOVO
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bawcom Union:Receipt</title>
    </head>
    <body>
        <%
                String ip=request.getQueryString();  
                ip=ip.replace("%20"," ");
                String items=null,id=null,price=null;
                Statement st=com.bawcom.db.DB.getConnect().createStatement();
                ResultSet resultSet=st.executeQuery("select * from receipt where day='"+ip+"'");
                while(resultSet.next())
                {
                    items=resultSet.getString(4);
                    id=resultSet.getString(2);
                    price=resultSet.getString(3);
                }
                items=items.replace("[","");
                items=items.replace("]","");
                
        %>
        <br><br><br><br><br><br>
    <center>
        <table width="600" height="400">
            <tr><th></th><th>Payment Receipt</th></tr>
            <tr><td>Student ID</td><td></td><td><%=id%></td></tr>
            <tr><td>Ordered Item, Quantity and Each Price</td><td></td><td><%=items%></td></tr>
            <tr><td>Total Amount Payed</td><td></td><td><%=price%> $</td></tr>
            <tr><td>Payed Time</td><td></td><td><%=ip%></td></tr>
            <tr><td></td><td><input type="button" value="Print"></td></tr>
        </table>
    </center>
    </body>
</html>
