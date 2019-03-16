<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<p>
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
			<%-- Mauvais exemple --%>
			<input type="text" name="donnee" value="${donneeSaisieParUnUtilisateur}" />	
			<%-- Bon exemple --%>
			<input type="text" name="donnee" value="<c:out value="${donneeSaisieParUnUtilisateur}"/>" />

	</div>
</body>
</html>