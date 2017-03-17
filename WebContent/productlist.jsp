<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.java.services.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.java.dao.*" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product List</title>
<%
GetProductDetails db=new GetProductDetails();
List<Product> products=db.getProductList();
%>
<style>
tr,th,td{
padding:10px;
background:#C8D9F3;
}
</style>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	$(".view_btn").click(function(){
		var cell=this.parentNode;
		var row=cell.parentNode;
		var data_array=row.getElementsByTagName("td")
		//alert(data_array[1].innerText);
		var productbarcode=data_array[1].innerText;
		var productname=data_array[2].innerText;
		var productdescription=data_array[3].innerText;
		
		var url="viewproductdetail.jsp?productbarcode="+productbarcode+"&productname="+productname+"&productdescription="+productdescription;
		window.location.href=url;
	});
	
	$("#submit_viewproductdetails").click(function(){
		var barcode=$("#productbarcode").val();
		var cell=document.getElementById(barcode);
		
		var row=cell.parentNode;
		var data_array=row.getElementsByTagName("td")
		var productbarcode=data_array[1].innerText;
		var productname=data_array[2].innerText;
		var productdescription=data_array[3].innerText;
		
		var url="viewproductdetail.jsp?productbarcode="+productbarcode+"&productname="+productname+"&productdescription="+productdescription;
		window.location.href=url;
	});
});
</script>
<body>
<div>
<form method="get">
ProductBarcode&nbsp;&nbsp;<input type=text id=productbarcode name=productbarcode>
<button type="button" id="submit_viewproductdetails">Search</button>
<br><br>
</form>
</div>
<table>
	<tr>
		<th>Sr.No</th><th>Product Barcode</th><th>Product Name</th><th>Product Description</th><th></th>
	</tr>
		<%
			int srno=1;
		      
		   for(Product product:products) 
		   {
		%>
		<tr><td><%=srno%></td><td id=<%=product.getBarcode()%>><%=product.getBarcode()%></td><td><%=product.getName()%></td><td><%=product.getDescription()%></td>
		<td>
			<button class="view_btn">View</button>
		</td>
		</tr>
		<%
			srno++;
			}
		%>	
</table>
</body>
</html>