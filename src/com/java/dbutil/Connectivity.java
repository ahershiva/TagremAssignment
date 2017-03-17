package com.java.dbutil;
 
import java.sql.*;
  
public class Connectivity{ 
	public static Connection openConnection(){ 
	   
	   // JDBC driver name and database URL
	      try{
	          // Register JDBC driver
	          Class.forName("com.mysql.jdbc.Driver");

	          // Open a connection
	          Connection conn = DriverManager.getConnection(Config.databaseurl,Config.username,Config.password);

	          if(conn!=null)
	        	  return conn;
	      }//try
	      catch(Exception e)
	      {
	    	  System.out.println("Exception:"+e.toString());
	      }
		return null;
	}
}
