package pack;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Servlet
 */
@WebServlet("/Servlet")
public class Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String op = request.getParameter("op");
		
		if (op.equals("index")) {
			String button = request.getParameter("indexbutton");
			if (button.equals("S'inscrire")) {
				request.getRequestDispatcher("creationcompte.html").forward(request, response);
			} else {
				response.getWriter().append("Served at: ").append(request.getContextPath());
			}
		} 
		
		
		
		if (op.equals("creationcompte")){
			String button = request.getParameter("operation");
			if (button.equals("Annuler")) {
				request.getRequestDispatcher("index.html").forward(request, response);
			} 
			
			else if ((button.equals("S'inscrire"))){
				// a completer	
			}
			
			else {
				response.getWriter().append("Served at: ").append(request.getContextPath());
			}
		}
		
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
