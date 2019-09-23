<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<div>
			<c:out value="test" />
			<%-- Affiche test --%>
			<c:out value="${ 'a' < 'b' }" />
			<%-- Affiche true --%>
			<%-- Cette balise affichera le mot 'test' si le bean n'existe pas : --%>
			<c:out value="${bean}">
    			test
			</c:out>

			<%-- Elle peut également s'écrire sous cette forme : --%>
			<c:out value="${bean}" default="test" />

			<%-- Et il est interdit d'écrire : --%>
			<c:out value="${bean}" default="test">
   				 une autre chaine
			</c:out>
			<%-- Sans préciser d'attribut escapeXml : --%>
			<c:out value="<p>Je suis un 'paragraphe'.</p>" />

			<%-- La balise affichera : --%>
			&lt;p&gt;Je suis un &#039;paragraphe&#039;.&lt;/p&gt;

			<%-- Et en précisant l'attribut à false :--%>
			<c:out value="<p>Je suis un 'paragraphe'.</p>" escapeXml="false" />
			<%-- La balise affichera : --%>
			<p>Je suis un 'paragraphe'.</p>
		</div>
		<%-- Mauvais exemple --%>
		<input type="text" name="donnee"
			value="${donneeSaisieParUnUtilisateur}" />
		<%-- Bon exemple --%>
		<input type="text" name="donnee"
			value="<c:out value="${donneeSaisieParUnUtilisateur}"/>" />

		<%-- Cette balise met l'expression "Salut les zéros !" dans l'attribut "message" de la requête : --%>
		<c:set var="message" value="Salut les zéros !" scope="request" />
		<%-- Affiche l'expression contenue dans la variable "message" de la requête --%>
		<c:out value="${requestScope.message}" />
		<%-- Et est l'équivalent du scriplet Java suivant : --%>
		<%
			request.setAttribute("message", "Salut les zéros !");
		%>
		<%-- L'attribut scope n'est pas obligatoire. Rappelez-vous, le scope par défaut est dans ce cas la page, 
			puisque c'est le premier dans la liste des scopes parcourus --%>
		<c:set var="maVariable" value="12" />
		<%-- création d'une variable de type session depuis un paramètre
			lu dans l'URL:  --%>
		<c:set var="locale" scope="session">
			<c:out value="${param.lang}" default="FR" />
		</c:set>
<!-- Modification des ppropriétés d'un objet -->
		<%-- Crée un objet de type String --%>
		<c:set scope="session" var="description" value="Je suis une loutre." />

		<%-- Crée un objet du type du bean ici spécifié dans l'attribut 'value'--%>
		<c:set scope="session" var="tonBean" value="${monBean}" />
		
		<!-- Définir ou modifier la propriété 'prenom' du bean 'coyote' -->
		<c:set target="${coyote}" property="prenom" value="Wile E."/>
		<!-- Définir ou modifier la propriété 'prenom' du bean 'coyote' via le corps de la balise -->
		<c:set target="${coyote}" property="prenom">
		   Wile E.
		</c:set>
		<!-- Passer à null la valeur de la propriété 'prenom' du bean 'coyote' -->
		<c:set target="${coyote}" property="prenom" value="${null}" />
		<%-- Supprime la variable "maVariable" de la session --%>
		<c:remove var="maVariable" scope="session" />
<!--  gestion des URL  -->		
		<%-- Génère une url simple, positionnée dans un lien HTML --%>
		<a href="<c:url value="test.jsp" />">lien</a>		
		<%-- Génère une url et la stocke dans la variable lien --%>
		<c:url value="test.jsp" var="lien" />	
		<%-- la balise c:url est équipée d'une gestion des cookies ajout auto dans l'URL --%>	
		<%-- L'url absolue ainsi générée --%>
		<c:url value="/test.jsp" />		
		<%-- Sera rendue ainsi dans la page web finale si le contextPath est "Test" --%>
		/Test/test.jsp		
		<%-- Et une url relative ainsi générée --%>
		<c:url value="test.jsp" />		
		<%-- Ne sera pas modifiée lors du rendu --%>
		test.jsp
<!--  ajout de paramètres -->	
		<c:url value="/monSiteWeb/countZeros.jsp">
			<c:param name="nbZeros" value="${countZerosBean.nbZeros}"/>
			<c:param name="date" value="22/06/2010"/>
		</c:url>
		<%-- attention aux caractères spéciaux !!
		22/06/2010 devient : 22%2f06%2f2010  --%>
<!--  Redirections -->
		<%-- Forwarding avec l'action standard JSP --%>
		<jsp:forward page="/monSiteWeb/erreur.jsp">
		
		<%-- Redirection avec la balise redirect --%>
		<c:redirect url="http://www.siteduzero.com"/>
		
		<%-- Les attributs valables pour <c:url/> le sont aussi pour la redirection. 
		Ici par exemple, l'utilisation de paramètres --%>
		<c:redirect url="http://www.siteduzero.com">
		  <c:param name="mascotte" value="zozor"/>
		  <c:param name="langue" value="fr"/>
		</c:redirect>
		
		<%-- Redirigera vers --%>
		http://www.siteduzero.com?mascotte=zozor&langue=fr	
<!--  Imports -->
		<%-- Copie le contenu d'un fichier xml dans une variable (fileReader),
		puis parse le flux récupéré dans une autre variable (doc). --%>
		<c:import url="test.xml" varReader="fileReader">
		  <x:parse var="doc" doc="${fileReader}" />
		</c:import>	
		<%-- Inclusion d'une page avec l'action standard JSP. --%>
		<jsp:include page="index.html" />
		
		<%-- Importer une page distante dans une variable 
		Le scope par défaut est ici page si non précisé. --%>
		<c:import url="http://www.siteduzero.com/zozor/biographie.html" var="bio" scope="page"/>
		
		<%-- Les attributs valables pour <c:url/> le sont aussi pour la redirection. 
		Ici par exemple, l'utilisation de paramètres --%>
		<c:import url="footer.jsp">
		  <c:param name="design" value="bleu"/>
		</c:import>
	</div>
</body>
</html>