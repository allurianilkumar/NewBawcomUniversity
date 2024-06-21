package com.bawcom.union;

import java.io.IOException;
import java.io.*;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Delete extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out=response.getWriter();
        String del=request.getQueryString();
        del=del.replace("%20"," ");
        try
        {
            PreparedStatement pst=com.bawcom.db.DB.getConnect().prepareStatement("delete from categories where i_name='"+del+"'");
            pst.executeUpdate();
            out.println("<script type='text/javascript'>"); 
            out.println("alert('Deleted Item Successfully')"); 
            out.println("window.location='AdminHome.jsp'");
            out.println("</script>");
                    
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
