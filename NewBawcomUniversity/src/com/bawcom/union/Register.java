/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bawcom.union;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/**
 *
 * @author LENOVO
 */
public class Register extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session=request.getSession();
        PrintWriter out=response.getWriter();
        String std_id=request.getParameter("std_id");
        System.out.println("the student value is "+std_id);
        String std_pwd=request.getParameter("std_pwd");
        String re_std_pwd=request.getParameter("re_std_pwd");
        String std_email=request.getParameter("email");
        String std_number=request.getParameter("std_number");
        String std_addrs=request.getParameter("std_addrs");
        if(std_pwd.equals(re_std_pwd))
        {
           try
        {
            Statement st=com.bawcom.db.DB.getConnect().createStatement();
            ResultSet rs=st.executeQuery("select * from student_register where std_id='"+std_id+"'");
            if(rs.next())
            {
                out.println("<script type='text/javascript'>"); 
                out.println("alert('Student Already Registered')"); 
                out.println("window.location= 'index.jsp'");
                out.println("</script>");    
            }
            else
            {
            	System.out.println("The value is ");
             PreparedStatement pst=com.bawcom.db.DB.getConnect().prepareStatement("insert into student_register(std_id,std_pwd,std_email,std_number,std_addrs,status) values(?,?,?,?,?,?)");
            pst.setString(1,std_id);
            pst.setString(2,std_pwd);
            pst.setString(3,std_email);
            pst.setString(4,std_number);
            pst.setString(5,std_addrs);
            pst.setString(6,"Student Locked");
            pst.executeUpdate();
        out.println("<script type='text/javascript'>"); 
        out.println("alert('Successfully Registered')"); 
        out.println("window.location= 'index.jsp'");
        out.println("</script>");   
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        } 
        }
        else
        {
        out.println("<script type='text/javascript'>"); 
        out.println("alert('Password Not Matched')"); 
        out.println("window.location= 'index.jsp'");
        out.println("</script>");
        }
    }  
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
