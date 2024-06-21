package com.bawcom.union;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.Date;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Pay extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out=response.getWriter();
        HttpSession session=request.getSession();
        String student_id=(String)session.getAttribute("student_id");
        String nme=request.getParameter("nme");
        String amount=request.getParameter("amount");
        String name=request.getParameter("name");
        String card=request.getParameter("card");
        String exp=request.getParameter("exp");
        String cvv=request.getParameter("cvv");
        amount=amount.replace(" $","");
        String vv=null;
        
        Date d=new Date();
        
        try
        {
            ArrayList al=new ArrayList();
            Statement stmt=com.bawcom.db.DB.getConnect().createStatement();
            ResultSet rs=stmt.executeQuery("select i_name,i_quantity,i_price from orderdetails where std_id='"+student_id+"' and item_status='Que'");
            while(rs.next())
            {
                al.add(rs.getString(1));
                al.add(rs.getString(2));
                al.add(rs.getString(3));
            }
            for(int v=0;v<al.size();v++)
            {
                vv=(String)al.get(v);
            }
            PreparedStatement pst=com.bawcom.db.DB.getConnect().prepareStatement("insert into payment(amount,name,card,exp,cvv,std_id) values(?,?,?,?,?,?)");
            pst.setString(1,amount);
            pst.setString(2,name);
            pst.setString(3,card);
            pst.setString(4,exp);
            pst.setString(5,cvv);
            pst.setString(6,student_id);
            pst.executeUpdate();
            
            
            
            PreparedStatement pt=com.bawcom.db.DB.getConnect().prepareStatement("insert into orderhistory(order_id,std_id,i_pic,i_type,i_name,i_price,i_quantity,timeanddate,confirmtime,status,item_status) select order_id,std_id,i_pic,i_type,i_name,i_price,i_quantity,timeanddate,confirmtime,status,item_status from orderdetails where std_id='"+student_id+"' and item_status='Que'");
            pt.executeUpdate();
            
            PreparedStatement p=com.bawcom.db.DB.getConnect().prepareStatement("insert into receipt(student_id,amount,items,day) values("+student_id+",'"+amount+"','"+al+"','"+d.toString()+"')");
            p.executeUpdate();
            ArrayList al2=new ArrayList();
            Statement stmmt=com.bawcom.db.DB.getConnect().createStatement();
            ResultSet rrt=stmmt.executeQuery("select order_id from orderdetails");
            while(rrt.next())
            {
                al2.add(rrt.getString(1));
            }
            PreparedStatement ptl=com.bawcom.db.DB.getConnect().prepareStatement("update orderdetails set item_status='Clear' where std_id='"+student_id+"'");
            ptl.executeUpdate();
//            for(int j=0;j<al2.size();j++)
//            {
//            PreparedStatement pt2=com.bawcom.db.DB.getConnect().prepareStatement("delete from orderdetails where order_id='"+al2.get(j)+"'");
//            pt2.executeUpdate();  
//            }
            
                out.println("<script type='text/javascript'>"); 
                out.println("alert('Payment Successfully Payed')"); 
                out.println("window.location= 'HomePage.jsp'");
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
