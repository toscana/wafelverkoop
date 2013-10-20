<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="be.kriekelaar.wafelverkoop.FoodType" %>

<%@ page import="be.kriekelaar.wafelverkoop.SaleHandler" %>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<html>

  <body>

<%
FoodType t;
t = new FoodType("Vanillewafels",5);
SaleHandler.getInstance().addFoodType(t);

t = new FoodType("Vanillewafels met chocolade",5);
SaleHandler.getInstance().addFoodType(t);

t = new FoodType("Gedroogde vruchten tropical",4);
SaleHandler.getInstance().addFoodType(t);

t = new FoodType("Cacaotruffels",5);
SaleHandler.getInstance().addFoodType(t);


t = new FoodType("Studentenhaver",5);
SaleHandler.getInstance().addFoodType(t);

t = new FoodType("Frangipane",6);
SaleHandler.getInstance().addFoodType(t);










%>


  </body>
</html>