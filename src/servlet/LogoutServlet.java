package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HttpSession session;
	public void service(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		session = req.getSession();
		session.invalidate();
		req.setAttribute("message","<h2 align='center' style='color:green;'>Logout Successful!</h2>");
		req.getRequestDispatcher("").forward(req, res);
	}
}