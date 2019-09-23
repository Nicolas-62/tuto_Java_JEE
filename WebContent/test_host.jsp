<%@ page import="java.util.ArrayList" %>
<%-- inclusion statique --%>
<%--test_inc qui contient une arraylist va être compilée avec test_host --%>
<%@ include file="test_inc.jsp" %>

<%-- L'inclusion dynamique d'une page fonctionne par URL relative : --%>
<jsp:include page="text_inc.jsp" />
<%-- pb les librairies et imports des pages précédentes ne seront pas compris --%>
<%-- Son équivalent en code Java  est : --%>
<% request.getRequestDispatcher( "page.jsp" ).include( request, response ); %>

<%-- Et il est impossible d'inclure une page externe comme ci-dessous :  --%>
<jsp:include page="http://www.siteduzero.com" />