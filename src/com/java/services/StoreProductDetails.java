package com.java.services;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.dao.Product;
import com.java.dbutil.DbCrudOperations;

@SuppressWarnings("serial")
public class StoreProductDetails extends HttpServlet{
   @Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	   Product product = new Product();
	   product.setStore(req.getParameter("store"));
	   product.setBarcode(req.getParameter("productbarcode"));
	   product.setPrice(req.getParameter("price"));
	   product.setNotes(req.getParameter("notes"));
	   
	   DbCrudOperations crudOperations = new DbCrudOperations();
	   if(crudOperations.addData(product))
		   resp.getWriter().println("Submited Successfully!");
	   else
		   resp.getWriter().println("Please Select Appropriate Barcode");
	}  
}


