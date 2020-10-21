package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDetailsDAO;

@WebServlet("/delete-user")
public class DeleteUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HttpSession session;
	public void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		session = req.getSession();
		int id = (int)session.getAttribute("id");
		String driver = this.getServletContext().getInitParameter("driverpath");
		String url = this.getServletContext().getInitParameter("url");
		UserDetailsDAO user = new UserDetailsDAO(driver,url);
		user.delete_user(id);
		session.invalidate();
		req.setAttribute("message","<h2 align='center' style='color:green;'>Account Deleted Successfully!</h2>");
		req.getRequestDispatcher("").forward(req, res);
	}
}