<%@page import="java.util.Collections"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="be.kriekelaar.wafelverkoop.Food" %>
<%@ page import="be.kriekelaar.wafelverkoop.FoodType" %>
<%@ page import="be.kriekelaar.wafelverkoop.Sale" %>
<%@ page import="be.kriekelaar.wafelverkoop.SaleHandler" %>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<html>

  <body>
  
  <table border="1">
  
  <%
  List<FoodType> foodtypes = SaleHandler.getInstance().getAllFoodTypes();
  out.print("<tr>");
  out.print("<td>Naam verkoper</td>");
  out.print("<td>Telefoon</td>");
  out.print("<td>Klas</td>");
  
  for(FoodType f:foodtypes){
	  out.print("<td>");
	  out.print(f.getName());
	  
	  out.print("</td>");
  }
  out.print("<td>Totaal</td>");
  out.print("<td>Commentaar</td>"); 
  out.print("</tr>");

  
  List<Sale> sales = SaleHandler.getInstance().getSales();
  
  for(Sale s:sales){
	  out.print("<tr>");
	  out.print("<td>"  + s.getNameStudent() + "</td>");
	  out.print("<td>"  + s.getTel()+ "</td>");	  
	  out.print("<td>"  + s.getKlas() + "</td>");
	  
	  List<Food> foodforsale = SaleHandler.getInstance().getFoodForSale(s.getId());
	
	  float totalPrice = 0;
	  for(Food f: foodforsale){
		  out.print("<td>");
		  out.print(f.getNumber());
		  out.print("</td>");
		  totalPrice += f.getTotalPrice();
	  }
	  DecimalFormat df = new DecimalFormat("0.00");
	  
	  out.print("<td>" + df.format(totalPrice).replace(",", ".") + "</td>");
	  out.print("<td>" + s.getComment() + "</td>");
	  
	  out.print("</tr>");
  }
  
  %>
  
  
  
  
  </table>


  </body>
</html>