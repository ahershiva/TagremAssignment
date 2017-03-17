# TagremAssignment
Prizy Pricer Assignment By Tagrem 


To running this application you have to first import database from file "tagremassignment.sql"
stored in WebContent folder. After that change databaseurl and credential accordingly in Config file of com.java.dbutil package.

productloader.jsp
The workers can use productloader.jsp to enter prices. It is a simple form with following fields.
•	Store
•	Product bar code.
•	Price
•	Notes

productlist.jsp
Administrator can use productlist.jsp to see product list and also view product details. administrator can also search specific 
product using search option provided in the same page.

productviewer.jsp
Administrator can use productviewer.jsp to view all the product details such as,
•	Bar code
•	Product description
•	Average price
•	Lowest Price
•	Highest Price
•	Ideal Price.

For changing formula for calculating IdealPrice you can change query in calculateIdealPrice() 
method of class com.java.dbutil.DbCrudOperations


