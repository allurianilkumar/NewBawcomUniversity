package com.bawcom.union;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.Date;
import java.util.StringTokenizer;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Order extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String order=request.getQueryString();
        HttpSession session=request.getSession();
        PrintWriter out=response.getWriter();
        int od=(int)(Math.random()*100000);
        String i_pic=null,i_name=null,i_price=null,i_quantity=null,i_type=null;
        String student_id=(String)session.getAttribute("student_id");
        StringTokenizer str=new StringTokenizer(order,",");
        while(str.hasMoreElements())
        {
            i_pic=str.nextToken();
            i_type=str.nextToken();
            i_name=str.nextToken();
            i_price=str.nextToken();
            i_quantity=str.nextToken();
        }
        i_pic=i_pic.replace("%20", " ");
        i_type=i_type.replace("%20", " ");
        i_name=i_name.replace("%20", " ");
        i_price=i_price.replace("%20", " ");
        i_quantity=i_quantity.replace("%20", " ");
        Date d=new Date();
        try
        {
            Statement stmt=com.bawcom.db.DB.getConnect().createStatement();
            ResultSet rs=stmt.executeQuery("select i_quantity from categories where i_name='"+i_name+"'");
            if(rs.next())
            {
                int k=Integer.parseInt(rs.getString(1));
                System.out.println("k="+k);
                int j=k-Integer.parseInt(i_quantity);
                if(j<0)
                {
                    out.println("<script type='text/javascript'>"); 
                    out.println("alert('Sorry Items are Sold Out')"); 
                    out.println("window.location= 'HomePage.jsp'");
                    out.println("</script>");
                }
                else
                {
                    PreparedStatement pst=com.bawcom.db.DB.getConnect().prepareStatement("update categories set i_quantity='"+j+"' where i_name='"+i_name+"'");
                    pst.executeUpdate();
                    PreparedStatement st=com.bawcom.db.DB.getConnect().prepareStatement("insert into orderdetails(order_id,std_id,i_pic,i_type,i_name,i_price,i_quantity,timeanddate,confirmtime,status,item_status) values(?,?,?,?,?,?,?,?,?,?,?)");
                    st.setInt(1,od);
                    st.setString(2, student_id);
                    st.setString(3, i_pic);
                    st.setString(4, i_type);
                    st.setString(5, i_name);
                    st.setString(6, i_price);
                    st.setString(7, i_quantity);
                    st.setString(8,d.toString());
                    st.setString(9,"Not Ready");
                    st.setString(10,"Pending");
                    st.setString(11,"Que");
                    st.executeUpdate();
                    out.println("<script type='text/javascript'>"); 
                    out.println("alert('Order is successfully added to Cart')"); 
                    out.println("window.location= 'HomePage.jsp'");
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
