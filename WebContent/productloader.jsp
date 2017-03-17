<%@page import="com.java.services.GetProductDetails"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.java.services.GetProductDetails.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.List" %>
<%@ page import="com.java.dao.Product" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ProductLoader</title>
<link rel="stylesheet" type="text/css" href="style.css">
<%
GetProductDetails gp=new GetProductDetails();
List<Product> products=gp.getProductList();
%>
</head>
<body>

<div class="form-style-10">
<form class="form-horizontal" name="make_trans" action="storeproductdetails" method="get" id="productloaderform">
<h1>Fill the Product details</h1>

		<label>Store<div id="mandatory">*</div><input type="text" id="store" name="store"/></label>
		
	    <label>Product Barcode<div id="mandatory">*</div>
				<select id="productbarcode" name="productbarcode"  required>
					<option value=null disabled selected>Please Select Product Barcode</option>
						<%
						String productbarcode;
						for(Product product:products)
						{
						      //Retrieve by column name 
						      productbarcode = product.getBarcode();
						%>
					<option>
						<%= productbarcode %>
					</option>
						<% 
						 }
						%>			
				</select>
		</label>
		
		<label>Price<div id="mandatory">*</div><input type="text" id="price" name="price"/></label>
		
		<label>Notes<div id="mandatory">*</div><input type="text" id="notes" name="notes"/></label>
					
    <div class="button-section">
     <input type="submit" name="Submit" value="Submit" id="submit" />
    </div>
</form>
</div>



<form>
<select>

</select>
</form>
</body>
</html>