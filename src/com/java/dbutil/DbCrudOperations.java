package com.java.dbutil;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
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
		

	public float calculateIdealPrice(String productbarcode)
	{
		try
	     {
		   String query="SELECT AVG(price)+AVG(price)/100*20 FROM product_survey_details"
	       +" WHERE productbarcode="+productbarcode 
	       +" AND price<(SELECT price FROM `product_survey_details` WHERE productbarcode="+productbarcode+" ORDER BY price DESC LIMIT 1,1)"
	       +" AND price>(SELECT price FROM `product_survey_details` WHERE productbarcode="+productbarcode+" ORDER BY price ASC LIMIT 1,1)"
	       +" ORDER BY price DESC";
			   
		   ResultSet rs =DbCrudOperations.selectQuery(query);
		   Map<Integer,Float> hashmap=new HashMap<>();
		 	if(rs!=null)
			{		 	   
			   while(rs.next())
				{
				  return rs.getFloat("AVG(price)+AVG(price)/100*20");
				}
			}
	     }//end try
	     catch(Exception e)
	     {
	    	 System.out.println("Exception:"+e.toString());
	     }//end catch
		return 0;
	}
	
}
