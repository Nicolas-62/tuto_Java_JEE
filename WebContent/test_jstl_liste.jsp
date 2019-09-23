<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*" %>
<%
  /* Création de la liste et des données */
  List<Map<String, String>> maListe = new ArrayList<Map<String, String>>();
  Map<String, String> news = new HashMap<String, String>();
  news.put("titre", "Titre de ma première news");
  news.put("contenu", "corps de ma première news");
  maListe.add(news);
  news = new HashMap<String, String>();
  news.put("titre", "Titre de ma seconde news");
  news.put("contenu", "corps de ma seconde news");
  maListe.add(news);
  pageContext.setAttribute("maListe", maListe);
%>

<c:forEach items="${maListe}" var="news">
<div class="news">
  <div class="titreNews">
      <c:out value="${news['titre']}" />
  </div>
  <div class="corpsNews">
      <c:out value="${news['contenu']}" />
  </div>
</div>
</c:forEach>

<%-- l'attribut varStatus --%>
<%-- permet de stocker des informations sur l'état courant d'une itération --%>
<c:forEach items="${maListe}" var="news" varStatus="status">
<div class="news">
  News n° <c:out value="${status.count}"/> :
  <div class="titreNews">
      <c:out value="${news['titre']}" />
  </div>
  <div class="corpsNews">
      <c:out value="${news['contenu']}" />
  </div>
</div>
</c:forEach>
<%-- iteration sur une chaine de caractères : --%>
<p>
<%-- Affiche les différentes sous-chaînes séparées par une virgule ou un point-virgule --%>
<c:forTokens var="sousChaine" items="salut; je suis un,gros;zéro+!" delims=";,+">
  ${sousChaine}<br/>
</c:forTokens>
</p>