<!-- desactive les tests des EL  -->
<%@ page isELIgnored ="true" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test EL 2</title>
</head>
<body>
	<p>
		<jsp:useBean id="monBean" class="com.beans.http.Nico" />
		<jsp:setProperty name="monBean" property="prenom" value="sebastien" />
		
		<jsp:getProperty name="monBean" property="prenom" /><br />
		<!--  cette expression : -->
		<jsp:getProperty name="monBean" property="nom" /><br />
		<!-- peut être remplacée par l'expression suivante -->
		<%-- ${ monBean.nom } n'affiche rien--%>
		<%-- ${beanPasInitilise.prenom } n'affiche rien--%>
		<!--  code exécuté derrière :  -->
		<!--
		Coyote bean = (Coyote) pageContext.findAttribute( "coyote" ); 
		if (bean != null ) { String prenom = bean.getPrenom(); 
			if ( prenom != null) { 
				out.print( prenom ); 
			} 
		}
		-->
		${ empty monBean.nom }<br />
		${ monBean.nom=="lourdel" }<br />
		${ !empty monBean.nom ? monBean.nom : "veuillez renseigner un nom" }<br />
	</p>
</body>
</html>