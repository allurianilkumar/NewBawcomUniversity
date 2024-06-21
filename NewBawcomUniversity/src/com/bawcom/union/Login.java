package com.bawcom.union;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Login extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out=response.getWriter();
        HttpSession session=request.getSession();
        String std_id=request.getParameter("std_id");
        String std_pwd=request.getParameter("std_pwd");
        String a="admin";
        
        
            try
        {
            String student_id=null,status=null;
            Statement st=com.bawcom.db.DB.getConnect().createStatement();
            ResultSet rs=st.executeQuery("select * from student_register where std_id='"+std_id+"' and std_pwd='"+std_pwd+"'");
            if(rs.next())
            {
                student_id=rs.getString(1);
                status=rs.getString(6);
                session.setAttribute("student_id",student_id);
                if(status.equals("Student Unlocked"))
                {
                out.println("<script type='text/javascript'>"); 
                out.println("alert('Successfully Logged In')"); 
                out.println("window.location= 'HomePage.jsp'");
                out.println("</script>");
                }
                else
                {
                out.println("<script type='text/javascript'>"); 
                out.println("alert('You are not activated still. Wait some time')"); 
                out.println("window.location= 'index.jsp'");
                out.println("</script>");   
                }
                rs.close();
                st.close();
            }
            else
            {
                Statement stmt=com.bawcom.db.DB.getConnect().createStatement();
                ResultSet rst=stmt.executeQuery("select * from admin where u_name='"+std_id+"' and pwd='"+std_pwd+"'");
                if(rst.next())
                {
                session.setAttribute("admin_id",rst.getString(3));
                out.println("<script type='text/javascript'>"); 
                out.println("alert('Admin Logged in Successfully')"); 
                out.println("window.location= 'AdminHome.jsp'");
                out.println("</script>");
                }
                else
                {
                out.println("<script type='text/javascript'>"); 
                out.println("alert('Please Check Your Student ID and Password')"); 
                out.println("window.location= 'index.jsp'");
                out.println("</script>");
                }
            }
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
