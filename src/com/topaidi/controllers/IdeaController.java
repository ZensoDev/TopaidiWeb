package com.topaidi.controllers;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cgi.dao.IdeaDao;
import com.cgi.dao.IdeaDaoImpl;
import com.cgi.model.Category;
import com.cgi.model.Idea;
import com.cgi.model.Member;


/**
 * Servlet implementation class IdeaController
 */
@WebServlet("/ideaController")
public class IdeaController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	IdeaDao idao = new IdeaDaoImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IdeaController() {
        super();
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		int id;
		Idea idea = new Idea();
		
		
		if (action == null) {
			action = "list";
		}
		switch (action) {
		case "list":
		List<Idea> ideas = idao.findAll();
		request.setAttribute("ideasList", ideas);
		request.getRequestDispatcher("/pages/idea/IdeaList.jsp").forward(request, response);
		break;
		
		case "delete":
			id = Integer.parseInt(request.getParameter("id"));
			idao.deleteByKey(id);
			response.sendRedirect("ideaController?action=list");
			break;
			
		case "new" :
			idea = new Idea();
			 request.setAttribute("ideaObj",idea);
			request.getRequestDispatcher("/pages/idea/IdeaForm.jsp").forward(request, response);	
			break;
			
		case "edit":
			id = Integer.parseInt(request.getParameter("id"));
			idea = idao.findByKey(id);
			request.setAttribute("ideaObj",idea);
			request.getRequestDispatcher("/pages/idea/IdeaForm.jsp").forward(request, response);	
			break;
			
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
		int idIdea = Integer.parseInt(request.getParameter("id"));
		Member member = new Member(5);
		Category cat = new Category(1);
		String title = request.getParameter("title");
		String photo = request.getParameter("photo");
		String description = request.getParameter("description");
		boolean state = Boolean.parseBoolean(request.getParameter("state"));
		String dateParam = request.getParameter("date");
		Date date = new SimpleDateFormat("yyyy-MM-dd").parse(dateParam);

		Idea idea = new Idea(idIdea, member, cat, title, photo, description, state, date);
				
		if (idIdea == 0) {
			idao.insert(idea);
		}else {
			idea.setIdIdea(idIdea);
			idao.update(idea);
			
		}
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("ideaController?action=list");
	}

}
