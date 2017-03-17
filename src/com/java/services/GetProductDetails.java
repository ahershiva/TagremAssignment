package com.java.services;

import java.util.List;

import com.java.dao.Product;
import com.java.dbutil.DbCrudOperations;

public class GetProductDetails {
	
	public List<Product> getProductList(){
		DbCrudOperations db=new DbCrudOperations();
		List<Product> products=db.selectAll();
		return products;
	}

}
