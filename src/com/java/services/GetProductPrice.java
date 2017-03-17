package com.java.services;

import java.util.HashMap;
import java.util.Map;

import com.java.dbutil.DbCrudOperations;

public class GetProductPrice {
 
	public Map<String,Float> returnPrices(String productbarcode)
	{
		Map<String,Float> hashmap=new HashMap<>();	
		DbCrudOperations db=new DbCrudOperations();
		hashmap=db.getPrices(productbarcode);
		return hashmap;
	}
}
