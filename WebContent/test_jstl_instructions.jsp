<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
	<%-- le resultat du test sera stocké dans 'maVariable' --%>
	<c:if test="${ 12 > 7 }" var="maVariable" scope="session">
	    Ce test est vrai.
	</c:if>
	<%-- exemple type switch : plusieurs when, un seul otherwise possible (équivalant à default --%>
	<c:choose>
	    <c:when test="${expression}">Action ou texte.</c:when>
	    ...
	    <c:otherwise>Autre action ou texte.</c:otherwise>
	</c:choose>	
	<%-- boucle :  --%>
	<c:forEach var="i" begin="0" end="7" step="1">
	  <tr>
	    <td><c:out value="${i}"/></td>
	    <td><c:out value="${i * i * i}"/></td>
	  </tr>
	</c:forEach>	
	</div>
</body>
</html>