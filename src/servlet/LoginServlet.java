package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.User;
import dao.UserDetailsDAO;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HttpSession session;
	public void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		res.setContentType("text/html");
		String username = req.getParameter("user");
		String password = req.getParameter("pass");
		if(username.isEmpty()||password.isEmpty())
		{
			req.setAttribute("message","<h2 align='center' style='color:red;'>Please fill all fields, and try again!</h2>");
			req.getRequestDispatcher("").include(req, res);
		}
		else
		{
			String driver = this.getServletContext().getInitParameter("driverpath");
			String url = this.getServletContext().getInitParameter("url");
			
			UserDetailsDAO user = new UserDetailsDAO(driver,url);
			User u = user.check_user(username, password);
			
			if(u != null)
			{
				session = req.getSession(true);
				session.setAttribute("id",u.getId());
				session.setAttribute("fname",u.getFname());
				session.setAttribute("email",u.getEmail());
				session.setAttribute("mobileno",u.getMobile());
				session.setAttribute("username",u.getUsername());
				session.setAttribute("password",u.getPassword());
				req.setAttribute("message","<h2 align='center' style='margin-left:50px;color:green;display:inline;'>User Login Successful!</h2>");
				req.getRequestDispatcher("rechargeoperatorlist").forward(req, res);
			}
			else
			{
				req.setAttribute("message","<h2 align='center' style='color:red;'>Username Or Password is Invalid!</h2>");
				req.getRequestDispatcher("").include(req, res);
			}
		}
	}
}