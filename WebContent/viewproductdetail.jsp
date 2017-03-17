<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="javax.servlet.*" %>
<%@ page import="com.java.services.*" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
tr,th,td{
padding:10px;
background:#C8D9F3;
}
</style>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
<%
String barcode=request.getParameter("productbarcode");
%>
$(document).ready(function(){
	if(window.location.search.split('?').length>1){
		    var param=window.location.search.split('?')[1].split('&');
			var productbarcode=decodeURIComponent(param[0].split('=')[1]);
			var productname=decodeURIComponent(param[1].split('=')[1]);
			var productdescription=decodeURIComponent(param[2].split('=')[1]);
		 
		$("#productbarcode").html(productbarcode);
		$("#productname").html(productname);
		$("#productdescription").html(productdescription);
		 
		<%
		Map<String,Float> hashmap=new HashMap<String,Float>();
		GetProductPrice gp=new GetProductPrice();
		hashmap=gp.returnPrices(barcode);
		%>
		
		$("#productlowprice").html(<%= hashmap.get("lowestprice")%>);
		$("#producthighprice").html(<%= hashmap.get("heighestprice")%>);
		$("#productavgprice").html(<%= hashmap.get("averageprice")%>);
		$("#productidealprice").html(<%= hashmap.get("idealprice")%>);
		
	} 
});

</script>
<body>
<h1 id=productname>Product Details</h1>
<table>
 <tr><td>Bar code</td><td id=productbarcode></td></tr>
 <tr><td>Product description</td><td id=productdescription></td></tr>
 <tr><td>Average price</td><td id=productavgprice></td></tr>
 <tr><td>Lowest Price</td><td id=productlowprice></td></tr>
 <tr><td>Highest Price</td><td id=producthighprice></td></tr>
 <tr><td>Ideal Price</td><td id=productidealprice></td></tr>	
</table>
</body>
</html>