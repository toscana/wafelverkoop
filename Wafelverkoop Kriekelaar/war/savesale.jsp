<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>
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
    <img src="kriekelaar.png"</img>
	<br />
	<a href="index.html">Home</a> |
	<b>Invoer bestellingen</b> |
	<a href="overzicht.jsp">Overzicht bestellingen</a> |
	<a href="bevestig.jsp">Bevestig bestellingen</a>
  
    <h1>Bestelling <%out.print(request.getParameter("familienaamverkoper")+" "+request.getParameter("voornaamverkoper"));%> bevestigd</h1>
  
  <%
  
  Sale sale = new Sale();
  List<FoodType> foodtypes = SaleHandler.getInstance().getAllFoodTypes();
  for(FoodType f:foodtypes){
	int aantal = 0;
	if(request.getParameter(f.getName()) != "")
		aantal = Integer.valueOf(request.getParameter(f.getName()));
	sale.addFood(new Food(aantal,f.getPrice(),f.getName()));
  }
  
  sale.setNameStudent(request.getParameter("familienaamverkoper") + request.getParameter("voornaamverkoper"));
  sale.setTel(request.getParameter("tel"));
  sale.setComment(request.getParameter("comment"));
  sale.setKlas(request.getParameter("klas"));
  SaleHandler.getInstance().addSale(sale);
  
    
  out.print("<a href=\"sale.jsp?klas=");
  out.print(sale.getKlas());  
  out.print("\">Geef een nieuwe bestelling in</a>");
  
  
  %>
  
 






  </body>
</html>