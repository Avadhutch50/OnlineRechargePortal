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

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String fname,email,mobileno,username,password;
	HttpSession session;
	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException
	{
		res.setContentType("text/html");
		fname = req.getParameter("fullname");
		email = req.getParameter("email");
		mobileno = req.getParameter("mobileno");
		username = req.getParameter("user");
		password = req.getParameter("pass");
		if(fname.isEmpty()||email.isEmpty()||mobileno.isEmpty()||username.isEmpty()||password.isEmpty())
		{
			req.setAttribute("message","<h2 align='center' style='color:red;'>Please fill all fields, and try again!</h2>");
			req.getRequestDispatcher("register.jsp").include(req, res);
		}
		else
		{
			String driver = this.getServletContext().getInitParameter("driverpath");
			String url = this.getServletContext().getInitParameter("url");
			
			UserDetailsDAO user = new UserDetailsDAO(driver,url);
			
			if(user.insert_user(fname, email, mobileno, username, password))
			{	
				User u = user.check_user(username, password);
				session = req.getSession(true);
				session.setAttribute("id",u.getId());
				session.setAttribute("fname",u.getFname());
				session.setAttribute("email",u.getEmail());
				session.setAttribute("mobileno",u.getMobile());
				session.setAttribute("username",u.getUsername());
				session.setAttribute("password",u.getPassword());
				req.setAttribute("message","<h2 align='center' style='margin-left:50px;color:green;display:inline;'>User Registration Successful!</h2>");
				req.getRequestDispatcher("rechargeoperatorlist").forward(req, res);
			}
			else
			{
				req.setAttribute("message","<h2 align='center' style='color:red;'>Email Or Username is already in use!</h2>");
				req.getRequestDispatcher("register.jsp").include(req, res);
			}
		}
	}
}
