<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="be.kriekelaar.wafelverkoop.Sale" %>
<%@ page import="be.kriekelaar.wafelverkoop.SaleHandler" %>
<%@ page import="be.kriekelaar.wafelverkoop.Klas" %>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<html>

  <body>

<%
/*
Klas k = new Klas("Geen","geen");
SaleHandler.getInstance().addKlas(k);


 k = new Klas("K0 rood (juf Elke)","K0");
SaleHandler.getInstance().addKlas(k);

k = new Klas("K0/1 roos (juf Layla en juf Debby)","K0/1");
SaleHandler.getInstance().addKlas(k);

k = new Klas("K1 paars (juf Kaat en juf Debby)","K1");
SaleHandler.getInstance().addKlas(k);

k = new Klas("K2 blauw (juf Ingrid en juf Inez)","K2");
SaleHandler.getInstance().addKlas(k);

k = new Klas("K2/3 groen (juf Melissa)","K2/3");
SaleHandler.getInstance().addKlas(k);

k = new Klas("K3 geel (juf Evi en juf Inez)","K3");
SaleHandler.getInstance().addKlas(k);

k = new Klas("L1A (meester Marc)","L1A");
SaleHandler.getInstance().addKlas(k);

k = new Klas("L1B (meester Wim en juf Laurien)","L1B");
SaleHandler.getInstance().addKlas(k);

k = new Klas("L2A (meester Leo en juf Sarah)","L2A");
SaleHandler.getInstance().addKlas(k);

k = new Klas("L2B (meester Peter)","L2B");
SaleHandler.getInstance().addKlas(k);


k = new Klas("L3 (meester Christophe en juf Laurien)","L3");
SaleHandler.getInstance().addKlas(k);

k = new Klas("L3/4 (juf Elke en juf Sarah)","L3/4");
SaleHandler.getInstance().addKlas(k);


k = new Klas("L4 (meester Dom)","L4");
SaleHandler.getInstance().addKlas(k);

k = new Klas("L5 (juf An)","L5");
SaleHandler.getInstance().addKlas(k);

k = new Klas("L6 (juf Leentje en juf Laurien)","L6");
SaleHandler.getInstance().addKlas(k);


*/

%>


  </body>
</html>