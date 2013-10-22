<%@page import="com.sun.org.apache.xerces.internal.impl.dv.xs.DecimalDV"%>
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
    <img src="kriekelaar.png"</img>
        <br/>
  <a href="index.html">Home</a>
  | <b>Invoer bestellingen</b>
  | <a href="overzicht.jsp">Overzicht bestellingen</a>
  | <a href="bevestig.jsp">Bevestig bestellingen</a>
  
  
  <h1>Bestelling
  
  <%out.print(request.getParameter("familienaamverkoper")+ " ");
    out.print(request.getParameter("voornaamverkoper"));
  %>
  </h1>
  
 
  <%
 
  
  
  out.println("<table border=\"0\">");
   	
  	out.print("<tr><td><b>Naam verkoper:</b></td>");
	out.println("<td>" + request.getParameter("familienaamverkoper") + " " + request.getParameter("voornaamverkoper") + "</td>");
  	out.print("</tr>");
  	

  	
  	out.print("<tr><td><b>Tel.:</b></td>");
	out.println("<td>" + request.getParameter("tel") + "</td>");
  	out.print("</tr>");
  	
  

	  String klasnaam = SaleHandler.getInstance().getKlasFullName(request.getParameter("klas"));

  	out.print("<tr><td><b>Klas leerling:</b></td>");
	out.println("<td>" + klasnaam + "</td>");
  	out.print("</tr>");

	  
	  
 
  out.println("</table>");
  out.println("<br/><br/>");
    
  %>
  
  
  <table>
  <%
  List<FoodType> foodtypes = SaleHandler.getInstance().getAllFoodTypes();
  float totaalsom = 0;
  for(FoodType f:foodtypes){
  	 
  	out.print("<tr><td><b>" + f.getName() + ":</b></td>");
  	
  	
  	
  	int aantal = 0;
  	//out.print("het is " + request.getParameter(f.getName()+f.getColor()));
  	if(request.getParameter(f.getName()) != "")
  		aantal = Integer.parseInt(request.getParameter(f.getName()));
  	out.print("<td>");
  	out.print(aantal);
  	out.print(" stuks x ");
  	out.print("€"+f.getPrice()+" =</td>");
	float prijs = f.getPrice()*aantal;
  	//float prijs=2f;
    DecimalFormat df = new DecimalFormat("0.00");
    //df.setMinimumFractionDigits(2);
    //TODO force to have always 2 digits after comma
    prijs = Float.parseFloat(df.format(prijs).replace(",", "."));
  	totaalsom += prijs;
    out.print("<td>€" + prijs);
  	out.print("</td></tr>");
  }
    
  
  
  DecimalFormat df = new DecimalFormat("0.00");
  totaalsom = Float.parseFloat(df.format(totaalsom).replace(",", "."));
  
  out.write("<tr><td></td><td><b>TOTAALSOM:</b></td> <td><b>" + df.format(totaalsom).replace(",", ".") + " € </b></td></tr>");
  out.print("</table>");

  
 
  %>
  






<form name="form1" method="post" action="savesale.jsp">

<%
out.print("<input type=\"hidden\" name=\"familienaamverkoper\""  + " value=\""+ request.getParameter("familienaamverkoper") +"\"" + ">");
out.print("<input type=\"hidden\" name=\"voornaamverkoper\""  + " value=\""+ request.getParameter("voornaamverkoper") +"\"" + ">");
out.print("<input type=\"hidden\" name=\"tel\""  + " value=\""+ request.getParameter("tel") +"\"" + ">");
out.print("<input type=\"hidden\" name=\"klas\""  + " value=\""+ request.getParameter("klas") +"\"" + ">");

for(FoodType f:foodtypes){
	out.print("<input type=\"hidden\" name=\""+ f.getName()+ "\" value=\"" + request.getParameter(f.getName()) + "\">");
}
%>
<b>Commentaar</b>
</p>
<textarea name="comment" cols="40" rows="6"></textarea>

<p><a href='javascript:history.go(-1)'>Terug</a></p>

<input name="send" type="submit" value="Bestelling opslaan">
	

</form>	









  </body>
</html>