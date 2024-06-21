package com.bawcom.union;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Lock extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out=response.getWriter();
        String lock=request.getQueryString();
        lock=lock.replace("%20", " ");
        try
        {
          PreparedStatement pst=com.bawcom.db.DB.getConnect().prepareStatement("update student_register set status='Student Locked' where std_id='"+lock+"'"); 
          pst.executeUpdate();
            out.println("<script type='text/javascript'>"); 
            out.println("alert('Successfully Locked the Student')"); 
            out.println("window.location= 'AdminHome.jsp'");
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
