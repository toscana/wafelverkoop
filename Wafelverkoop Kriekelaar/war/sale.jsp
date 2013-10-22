<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.google.appengine.api.users.User"%>
<%@ page import="com.google.appengine.api.users.UserService"%>
<%@ page import="com.google.appengine.api.users.UserServiceFactory"%>
<%@ page import="be.kriekelaar.wafelverkoop.Food"%>
<%@ page import="be.kriekelaar.wafelverkoop.FoodType"%>
<%@ page import="be.kriekelaar.wafelverkoop.Sale"%>
<%@ page import="be.kriekelaar.wafelverkoop.SaleHandler"%>
<%@ page import="be.kriekelaar.wafelverkoop.Klas"%>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<html>

<head>
<script src="http://code.jquery.com/jquery-1.5.min.js"></script>
<script src="http://cdn.wideskyhosting.com/js/jquery.validate.js"></script>
<script>
$.validator.messages.required = "Dit veld is verplicht!";
$.validator.messages.email = "Geen geldig emailadres!";
$.validator.messages.digits = "Geef enkel cijfers in!";

$("document").ready(function(){
	$("form").validate()
})
</script>
<script type="text/javascript">
function updateSum(ish){
    var SubTotal += ish.value;
    document.getElementById("sub_total").value = isNaN(SubTotal) ? 0 : SubTotal;
}

</script>
<style>
select.error, textarea.error, input.error {
    background-color:#FFFF00;
}
</style>

<title>Ingave nieuwe bestelling</title>
</head>

<body>
	<img src="kriekelaar.png"</img>
	<br />
	<a href="index.html">Home</a> |
	<b>Invoer bestellingen</b> |
	<a href="overzicht.jsp">Overzicht bestellingen</a> |
	<a href="bevestig.jsp">Bevestig bestellingen</a>

	<form name="form1" method="post" action="verify.jsp">



		
		

		<%
			out.print("<table>");

			out.print("<tr>");
			out.print("<td>");
			out.print("Familienaam verkoper:");
			out.print("</td>");
			out.print("<td>");
			out.print("<input type=\"text\" name=\"familienaamverkoper\" class=\"required\">");
			out.print("</td>");
			out.println("</tr>");
			
			
			out.print("<tr>");
			out.print("<td>");
			out.print("Voornaam verkoper:");
			out.print("</td>");
			out.print("<td>");
			out.print("<input type=\"text\" name=\"voornaamverkoper\" class=\"required\">");
			out.print("</td>");
			out.println("</tr>");

			out.print("<tr>");
			out.print("<td>");
			out.print("Telefoonnummer:");
			out.print("</td>");
			out.print("<td>");
			out.print("<input type=\"text\" name=\"tel\">");
			out.print("</td>");
			out.println("</tr>");

			
			
					
			out.print("<tr>");
			out.print("<td colspan=\"2\">");
			out.print("Klas:");
			
%>
			
			<select name="klas">
			<%
				String klas;
				if (request.getParameter("klas") == null)
					klas = "geen";
				else
					klas = request.getParameter("klas");

				List<Klas> klassen = SaleHandler.getInstance().getKlassen();
				for (Klas k : klassen)
					if (k.getKlasOptionName().equalsIgnoreCase(klas))
						out.println("<option value=\"" + k.getKlasOptionName()
								+ "\" selected>" + k.getKlasName() + "</option>");
					else
						out.println("<option value=\"" + k.getKlasOptionName()
								+ "\">" + k.getKlasName() + "</option>");
			%>
		</select>
		
		
		
		<%
		out.print("</td>");
		out.print("</tr>");
		out.print("</table>");
		 %>


<p>Gelieve voor elke soort het gewenst aantal in te vullen:</p>

			
			<%
			out.print("<table><tr>");
			List<FoodType> foodtypes = SaleHandler.getInstance().getAllFoodTypes();
			
			for (FoodType f : foodtypes) {
				   	out.print("<tr><td>" + f.getName() + "</td>");
				   	
					out.println("<td>" + "<input type=\"text\" size=\"6\" name=\""
							+ f.getName() + "\" class=\"digits\" onchange=\"updateSum(this.value)\" >" + "</td>");
					out.print("<td>stuks x €" +f.getPrice() + "</td>");
							
							
							out.print("</tr>");

			
			}
			
		
			out.print("</tr></table>");

		%>
		
		
		
			
		<br /> <input name="send" class="submit" type="submit" value="Doorgaan">


	</form>

</body>
</html>