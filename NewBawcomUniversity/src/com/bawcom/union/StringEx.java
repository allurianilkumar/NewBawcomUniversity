/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bawcom.union;
import java.sql.*;
import java.util.Scanner;

/**
 *
 * @author LENOVO
 */
public class StringEx {
    public static Connection con;
    public static Connection getConnect()
    {
        try
        {
        Class.forName("com.mysql.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/t","root","root");
        PreparedStatement pst=con.prepareStatement("insert into persons values('1','2','3')");
        pst.executeUpdate();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return con;
    }
    public static void main(String[] args)
    {
        getConnect();
    }
}
