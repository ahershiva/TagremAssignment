package com.java.dbutil;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.java.dao.Product;

public class DbCrudOperations{
	public List<Product> selectAll(){
		try
		{
			// Execute SQL query
			Connection conn=Connectivity.openConnection();
	        Statement stmt = conn.createStatement();
	        String sql;
	        sql = "SELECT * FROM productdetails";
	        ResultSet rs = stmt.executeQuery(sql);
	        List<Product> products=new ArrayList<>();
	        
	        
	        if(rs!=null)
	        {
		        while(rs.next())
			    {
			      //Retrieve by column name
		        	Product product = new Product();
		        	product.setBarcode(rs.getString("productbarcode"));
		        	product.setName(rs.getString("productname"));
		        	product.setDescription(rs.getString("productdescription"));
		        	products.add(product);
			    }
		        return products;
	        }	        
        }//end try
		catch(Exception e)
		{
			System.out.println("Exception occured:"+e.toString());
		}
		return null;
	}
	
	public static ResultSet selectQuery(String query)
	{
		try
		{
		// Execute SQL query
		Connection conn=Connectivity.openConnection();
	    Statement stmt = conn.createStatement(); 
	    ResultSet rs = stmt.executeQuery(query);
	    if(rs!=null)
	    	return rs;			
		}
		catch(Exception e)
		{
			System.out.println("Exception occured:"+e.toString());
		}
		
		return null;
	}//end selectquery()
	
	public boolean addData(Product product) {
		   try
			{
				// Execute SQL query
				Connection conn=Connectivity.openConnection();
		        Statement stmt = conn.createStatement();
		        String sql;
		        sql = "INSERT INTO product_survey_details VALUES('"+product.getStore()+"','"+product.getBarcode()+"',"+product.getPrice()+",'"+product.getNotes()+"')";
		        System.out.println("SqlStatement:"+sql);
		        stmt.executeUpdate(sql);
		        return true;
	      }//end try
			catch(Exception e)
			{
				System.out.println("Exception occured:"+e.toString());
			}
		   return false;
	   }
	
	public Map<String,Float> getPrices(String productbarcode){	
		     try
		     {
			   String query="SELECT MIN(price),MAX(price),AVG(price) FROM product_survey_details WHERE productbarcode="+productbarcode;
   			   System.out.println(query);
   			   float idealprice=calculateIdealPrice(productbarcode);
			   ResultSet rs =DbCrudOperations.selectQuery(query);
				Map<String,Float> hashmap=new HashMap<>();
				if(rs!=null)
				{
				   while(rs.next())
					{
						 hashmap.put("lowestprice",rs.getFloat("MIN(price)"));
						 hashmap.put("heighestprice",rs.getFloat("MAX(price)"));
						 hashmap.put("averageprice",rs.getFloat("AVG(price)"));
						 hashmap.put("idealprice",idealprice);
						 return hashmap;
					}
				}
		     }//end try
		     catch(Exception e)
		     {
		    	 System.out.println("Exception:"+e.toString());
		     }//end catch
			 return null;
		}
		

	public float calculateIdealPrice(String prodcutbarcode)
	{
		try
	     {
		   String query="SELECT price FROM `product_survey_details` WHERE productbarcode="+prodcutbarcode+" ORDER BY price DESC";
		   ResultSet rs =DbCrudOperations.selectQuery(query);
		   Map<Integer,Float> hashmap=new HashMap<>();
		 	if(rs!=null)
			{
		 	   int i=0;
			   while(rs.next())
				{
				   hashmap.put(i,rs.getFloat("price"));
				   i++;
				}
			   float total=0;
			   for(i=2;i<hashmap.size()-2;i++)
			   {
				   total=total+hashmap.get(i);
			   }
			   Float idealPrice=total/(i-2)+(total/(i-2)/100)*20;
			   System.out.println("idealPrice:"+idealPrice);
			   return idealPrice;
			}
	     }//end try
	     catch(Exception e)
	     {
	    	 System.out.println("Exception:"+e.toString());
	     }//end catch
		return 0;
	}
	
}
