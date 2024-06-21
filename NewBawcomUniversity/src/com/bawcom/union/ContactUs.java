package com.bawcom.union;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ContactUs extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out=response.getWriter();
        String c_name=request.getParameter("c_name");
        String c_email=request.getParameter("c_email");
        String c_mobile=request.getParameter("c_mobile");
        String c_msg=request.getParameter("c_msg");
        
        try
        {
            PreparedStatement pst=com.bawcom.db.DB.getConnect().prepareStatement("insert into contactus(c_name,c_email,c_mobile,c_msg) values(?,?,?,?)"); 
            pst.setString(1, c_name);
            pst.setString(2, c_email);
            pst.setString(3, c_mobile);
            pst.setString(4, c_msg);
            pst.executeUpdate();
            
        out.println("<script type='text/javascript'>"); 
        out.println("alert('Successfully Contacted')"); 
        out.println("window.location= 'index.jsp'");
        out.println("</script>");
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
