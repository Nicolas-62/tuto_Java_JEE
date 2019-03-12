<%@ page import="java.util.List" %>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Test</title>
</head>

<body>
	<p>Ceci est une page générée depuis une JSP.</p>
	<%
		String atr = (String) request.getAttribute("message");
		out.println(atr);
		
		String param = (String) request.getParameter("auteur");
	%><p>Auteur :</p>
	<%
		out.println(param);
	%>
	<style> h1 {font-size:200px;}  span {color:red}</style>
	
	<h1><strong> <span>M</span>assi<br /><span>V</span>ery<br /><span>C</span>ool </strong></h1>
	<img src="essai.jpg">
	<p>Bean  avec la language de script :</p>
	<%
		com.beans.http.Nico monBean = (com.beans.http.Nico) request.getAttribute("bean");
			out.println(monBean.getNom());
			out.println(monBean.getPrenom());
	%>
	<p>Bean avec les balises JSP : </p>
	<p>
		<!-- Récupération du bean avec les balises JSP : -->
		<jsp:useBean id="bean" class="com.beans.http.Nico"
			scope="request" /><!--  ici on précise le scope, la portée de l'objet on cherche au niveau de la requête -->
		<jsp:getProperty name="bean" property="prenom" />
		<jsp:getProperty name="bean" property="nom" />
	</p>
	
	
        <p>Ceci est une page générée depuis une JSP avec des EL.</p>
        <p>
            ${message}<br />
            ${param.auteur}<br />
        </p>
        <p>
            Récupération du bean :<br />
            ${bean.prenom}<br />
            ${bean.nom}
        </p>
        
        <p>
            Récupération de la liste :
            <%
            List<Integer> liste = (List<Integer>) request.getAttribute( "liste" );
            for( Integer i : liste ){
                out.println(i + " : ");	
            }
            %>
        </p>
<%--         <p>
            Récupération du jour du mois :
            <%
            Integer jourDuMois = (Integer) request.getAttribute( "jour" );
            if ( jourDuMois % 2 == 0 ){
                out.println("Jour pair : " + jourDuMois);
            } else {
                out.println("Jour impair : " + jourDuMois);
            }
            %>
        </p>  --%>       
</body>
</html>