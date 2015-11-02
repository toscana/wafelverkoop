<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="be.kriekelaar.wafelverkoop.Food" %>
<%@ page import="be.kriekelaar.wafelverkoop.SaleHandler" %>
<%@ page import="be.kriekelaar.wafelverkoop.Sale" %>
<%@ page import="be.kriekelaar.wafelverkoop.Approval" %>
<%@ page import="java.text.DecimalFormat" %>


<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>



<html>

  <body>
    <img src="kriekelaar.png"</img>
    <br/>
  <a href="index.html">Home</a>
  | <a href="sale.jsp">Invoer bestellingen</a>
  | <a href="overzicht.jsp">Overzicht bestellingen</a>
  | <b>Bevestig bestellingen</b>
  
  <%
  
  
  
  String klasnaam = SaleHandler.getInstance().getKlasFullName(request.getParameter("klas"));
  out.print("<p>Ingave van bestellingen voor klas " + klasnaam + " bevestigd. Bedankt voor uw hulp!</p>");
  
  Approval b = new Approval(klasnaam,new Date(),request.getParameter("klasouder"));
  SaleHandler.getInstance().addBevestiging(b);
  
  
  String klas = request.getParameter("klas");
  List<Sale> sales = SaleHandler.getInstance().getSalesForClass(klas);
  
  float totaalCash = 0;

  for(Sale s:sales){
	  List<Food> flowersForSale = SaleHandler.getInstance().getFoodForSale(s.getId());
	
	  float totalPrice = 0;
	  for(Food flow: flowersForSale ){
		totalPrice += flow.getTotalPrice();
	  }
	
		  totaalCash += totalPrice;
 	


  } 
    
  DecimalFormat df = new DecimalFormat("0.00");
  out.print("<p>Het totaal aan cash geld voor deze bestellingen is samen € " + df.format(totaalCash).replace(",", ".") + ".<br/>Gelieve dit bedrag door te storten op rekening: <br/>BE32 7341 3322 8802 <br/>BIC KREDBEBB <br/>van de Ouderraad De Kriekelaar met mededeling <b>Wafelverkoop 2015 klas " + klas + ".</b></p>");
  %>
  
  
  

  </body>
</html>