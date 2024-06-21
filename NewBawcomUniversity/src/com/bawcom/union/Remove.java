package com.bawcom.union;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.StringTokenizer;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Remove extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session=request.getSession();
        String student_id=(String)session.getAttribute("student_id");
        String rmv=request.getQueryString();
        String i_name=null,i_quantity=null,quan=null;
        int add=0;
        PrintWriter out=response.getWriter();
        rmv=rmv.replace("%20", " ");
        StringTokenizer str=new StringTokenizer(rmv, ",");
        while(str.hasMoreElements())
        {
            rmv=str.nextToken();
            i_name=str.nextToken();
            quan=str.nextToken();
        }
        try
        {
            Statement st=com.bawcom.db.DB.getConnect().createStatement();
           ResultSet rs=st.executeQuery("select i_quantity from categories where i_name='"+i_name+"'");
           if(rs.next())
           {
            i_quantity=rs.getString(1);   
           }
           add=Integer.parseInt(quan)+Integer.parseInt(i_quantity);
           PreparedStatement pt=com.bawcom.db.DB.getConnect().prepareStatement("update categories set i_quantity='"+add+"' where i_name='"+i_name+"'");
           pt.executeUpdate();
           PreparedStatement pst=com.bawcom.db.DB.getConnect().prepareStatement("delete from OrderDetails where timeanddate='"+rmv+"' and std_id='"+student_id+"'");
           pst.executeUpdate();
                    out.println("<script type='text/javascript'>"); 
                    out.println("alert('Item is removed from Orders')"); 
                    out.println("window.location= 'HomePage.jsp'");
                    out.println("</script>");
        }
        catch(Exception e)
        {
        e.printStackTrace();
        }
        
    }

}
