/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bawcom.db;
import java.sql.*;
/**
 *
 * @author LENOVO
 */
public class DB {
    public static Connection con;
    
    public static Connection getConnect()
    {
        try
        {
           Class.forName("com.mysql.jdbc.Driver");
           con=DriverManager.getConnection("jdbc:mysql://localhost/bawcom_union","root","password");
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return con;
    }
}
