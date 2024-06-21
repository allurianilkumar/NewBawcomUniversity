package com.bawcom.union;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Update extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            PrintWriter out=response.getWriter();
            String i_ty=request.getParameter("i_type");
            String i_n=request.getParameter("i_name");
            String i_pr=request.getParameter("i_price");
            String i_q=request.getParameter("i_quantity");
            String i_nm=null;
            try
            {
                Statement st=com.bawcom.db.DB.getConnect().createStatement();
                ResultSet rs=st.executeQuery("select * from categories where i_name='"+i_n+"'");
                while(rs.next())
                {
                    i_nm=rs.getString(4);
                }
                int l=Integer.parseInt(i_nm)+Integer.parseInt(i_q);
                System.out.println("l="+l);
                PreparedStatement pst=com.bawcom.db.DB.getConnect().prepareStatement("update categories set cat_type='"+i_ty+"',i_price='"+i_pr+"',i_quantity='"+l+"' where i_name='"+i_n+"'");
                pst.executeUpdate();
                
                out.println("<script type='text/javascript'>"); 
                out.println("alert('Item Updated Successfully')"); 
                out.println("window.location='AdminHome.jsp'");
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
