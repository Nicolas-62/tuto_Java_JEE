<%-- directives --%>	
<%@ page import="java.util.List" %>
<%-- défini dans l'entête HTTP l'encodage à utiliser --%>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Test</title>
</head>

<body>
	<p>Ceci est une page générée depuis une JSP.</p>
	<%-- code Java écrit dans une page c'est MAL ! --%>
	
	<%-- balise de déclaration --%>
	<%! String chaine = "Salut les zéros.";  %>
	
	<%-- balise de script--%>	
	<%-- resquest.getAttribute() renvoie un objet global de type Object --%>
	<%
		String atr = (String) request.getAttribute("message");
		out.println(atr);
		
		String param = (String) request.getParameter("auteur");
	%><p>Auteur :</p>
	
	<%
		out.println(param);
	%>
	<%-- balise d'expression--%>
	<%= "bip bip !" %>
	<%-- directive include --%>
	<%-- 'inclusion "statique", c'est parce qu'en utilisant cette directive pour inclure un fichier, 
		l'inclusion est réalisée au moment de la compilation --%>
	<%@ include file="test2.jsp" %>
	<%--inclusion dynamiqe : inclusion réalisée après compilation
	pb : les librairies de la page mère ne seront pas disponibles --%>
	<jsp:include page="test2.jsp" />
	<%-- Son équivalent en code Java  est : --%>
	<% request.getRequestDispatcher( "test2.jsp" ).include( request, response ); %>
	
	<%-- L'action suivante récupère un bean de type Coyote et nommé "coyote" dans
	la portée requête s'il existe, ou en crée un sinon. --%>
	<jsp:useBean id="coyote" class="com.beans.http.Nico" scope="request" />
	
	<%-- Elle a le même effet que le code Java suivant : --%>
	<% 
	com.beans.http.Nico coyote2 = (com.beans.http.Nico) request.getAttribute( "coyote" ); 
	if ( coyote2 == null ){
	    coyote2 = new com.beans.http.Nico();
	    request.setAttribute( "coyote2", coyote2 );
	}
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