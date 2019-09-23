package com.servlet.http;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.http.Nico;

// url : http://localhost:8080/Tuto_Java_JEE/nico
// HttpServlet est une classe abstraite qui implemente l'interface Servlet
public class Test extends HttpServlet {
	
	// il existe trois méthode proposées pour traiter les requêtes :
	// doGet(), doPost() et doHead()
	// la méthode service() se charge de lire l'objet HttpServletRequest et de transmettre
	// la requête HTTP à la méthode doXXX correspondante
	public void doGet( HttpServletRequest request, HttpServletResponse response )	throws ServletException, IOException {
		/* definition de l'encodage dans l'entête HTTP, indique au navigateur quel encodage utiliser */
		response.setCharacterEncoding( "ISO-8859-1" );
		/* creation d'un message et d'un parametre de type GET */
		String auteur = request.getParameter("auteur");
		String message = "Salut gros naze !! par l'auteur : "+auteur;
		request.setAttribute("message", message);
		
		/* creation d'un bean */
		Nico firstBean = new Nico();
		
		firstBean.setNom("Lourdel");
		firstBean.setPrenom("Nicolas");
		firstBean.setGenius(true);
		request.setAttribute("bean", firstBean);
		
		/* creation d'une liste */
		List<Integer> liste = new ArrayList<Integer>();
		liste.add(12);
		liste.add(6);
		liste.add(4);
		liste.add(1986);
		request.setAttribute("liste", liste);
		
//		DateTime dt = new DateTime();
		// La méthode forward() de l'objet RequestDispatcher permet depuis une servlet de 
		// rediriger la paire requête/réponse HTTP vers une autre servlet ou vers une page JSP.		
		this.getServletContext().getRequestDispatcher( "/WEB-INF/test.jsp" ).forward( request, response );
	}
//	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.setContentType("text/html");
//		response.setCharacterEncoding( "UTF-8" );
//		PrintWriter out = response.getWriter();
//		out.println("<!DOCTYPE html>");
//		out.println("<html>");
//		out.println("<head>");
//		out.println("<meta charset=\"utf-8\" />");
//		out.println("<title>Test</title>");
//		out.println("</head>");
//		out.println("<body>");
//		out.println("<p>Ceci est une page générée depuis une servlet.</p>");
//		out.println("</body>");
//		out.println("</html>");
//	}
}
