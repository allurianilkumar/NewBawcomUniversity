package com.bawcom.union;

import java.io.IOException;
import java.io.*;
import java.sql.PreparedStatement;
import java.util.Date;
import java.util.StringTokenizer;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Ready extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id=null,item=null,dt=null;
        PrintWriter out=response.getWriter();
        Date d=new Date();
        String ip=request.getQueryString();
        StringTokenizer str=new StringTokenizer(ip,",");
        while(str.hasMoreElements())
        {
            id=str.nextToken();
            item=str.nextToken();
            dt=str.nextToken();
        }
        item=item.replace("%20", " ");
        dt=dt.replace("%20", " ");
        try
        {
            PreparedStatement pst=com.bawcom.db.DB.getConnect().prepareStatement("update orderhistory set status='Ready',confirmtime='"+d.toString()+"' where std_id='"+id+"' and timeanddate='"+dt+"' and i_name='"+item+"' ");
            pst.executeUpdate();
                out.println("<script type='text/javascript'>"); 
                out.println("alert('Order Completed Successfully')"); 
                out.println("window.location= 'AdminHome.jsp'");
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
