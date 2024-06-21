package com.bawcom.union;

import com.oreilly.servlet.MultipartRequest;
import java.io.*;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Enumeration;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UploadItem extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out=response.getWriter();
        HttpSession session=request.getSession();
        String filedata=null;
String filename=null;
String paramname=null;
ArrayList list=new ArrayList();
java.util.Date now = new java.util.Date();
	 String DATE_FORMAT1 = "yyyy-MM-dd";
	 SimpleDateFormat sdf1 = new SimpleDateFormat(DATE_FORMAT1);
     String str = sdf1.format(now);
String s="UNCHANGED";
String i_type=null,i_name=null,i_price=null,i_quantity=null,i_pic=null;
String line=null;

FileInputStream fis=null;
MultipartRequest multi = new MultipartRequest(request, getServletContext().getRealPath("/")+"//file",	10 * 1024 * 1024); // 10MB
	Enumeration params = multi.getParameterNames();
			while (params.hasMoreElements()) 
			{
				paramname = (String) params.nextElement();
				if(paramname.equalsIgnoreCase("i_type"))
				{
					i_type=multi.getParameter(paramname);
				}
				if(paramname.equalsIgnoreCase("i_name"))
				{
					i_name=multi.getParameter(paramname);
				}
				if(paramname.equalsIgnoreCase("i_price"))
				{
					i_price=multi.getParameter(paramname);
				}
                                if(paramname.equalsIgnoreCase("i_quantity"))
				{
					i_quantity=multi.getParameter(paramname);
				}
                                if(paramname.equalsIgnoreCase("i_pic"))
				{
					i_pic=multi.getParameter(paramname);
				}
				
			}
				int f = 0;
	Enumeration files = multi.getFileNames();	
	while (files.hasMoreElements()) 
	{
		paramname = (String) files.nextElement();
		if(paramname != null)
		{
			f = 1;
			filename = multi.getFilesystemName(paramname);
			String fPath = getServletContext().getRealPath("/")+"//file//"+filename;
			File file1 = new File(fPath);
			 fis = new FileInputStream(file1);
			list.add(fis);
		}		
	}
	FileInputStream fs1 = null;		
String admin_id=(String)session.getAttribute("admin_id");
try
{
    Statement stmt=com.bawcom.db.DB.getConnect().createStatement();
    ResultSet rs=stmt.executeQuery("select * from categories where i_name='"+i_name+"'");
                if(rs.next())
                {
                    out.println("<script type='text/javascript'>"); 
                    out.println("alert('Sorry Item Name is Already Exist. Please Goto Update Item')"); 
                    out.println("window.location='AdminHome.jsp'");
                    out.println("</script>");
                }
                else
                {   
                    PreparedStatement ps=com.bawcom.db.DB.getConnect().prepareStatement("insert into categories(cat_type,i_name,i_price,i_quantity,i_pic,admin_id) values(?,?,?,?,?,?)");
                    ps.setString(1,i_type);
                    ps.setString(2,i_name);
                    ps.setString(3,i_price);
                    ps.setString(4,i_quantity);
                    ps.setString(5,filename);
                    ps.setString(6,admin_id);
                    int i=ps.executeUpdate();
                    //out.print(Successfully Registered);
                    session.setAttribute("i_name",i_name);
                    session.setAttribute("i_pic",filename);
                    session.setAttribute("s",line);
                    session.setAttribute("i_type",i_type);
                    System.out.println("i:"+i);
               
                    out.println("<script type='text/javascript'>"); 
                    out.println("alert('Successfully Added Item')"); 
                    out.println("window.location='AdminHome.jsp'");
                    out.println("</script>");
                }             
}
catch(Exception e1)
{
	e1.printStackTrace();
	System.out.println(e1);
                    
}
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
