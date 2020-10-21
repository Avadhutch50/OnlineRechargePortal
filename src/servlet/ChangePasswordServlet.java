package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDetailsDAO;

@WebServlet("/password-change")
public class ChangePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HttpSession session;
	public void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		res.setContentType("text/html");
		String oldpass = req.getParameter("oldpass");
		String newpass = req.getParameter("newpass");
		String userid =  req.getParameter("id");
		if(oldpass.isEmpty()||newpass.isEmpty()||userid.isEmpty())
		{
			req.setAttribute("message","<h2 align='center' style='color:red;'>Please fill all fields, and try again!</h2>");
			req.getRequestDispatcher("myaccount.jsp").include(req, res);
		}
		else if(oldpass.equals(newpass))
		{
			req.setAttribute("message","<h2 align='center' style='color:red;'>New password should not be same as old password!</h2>");
			req.getRequestDispatcher("myaccount.jsp").include(req, res);
		}
		else
		{
			String driver = this.getServletContext().getInitParameter("driverpath");
			String url = this.getServletContext().getInitParameter("url");
			
			UserDetailsDAO u = new UserDetailsDAO(driver,url);
			if(u.change_user_password(Integer.parseInt(userid), oldpass, newpass))
			{
				session = req.getSession();
				session.setAttribute("password",newpass);
				req.setAttribute("message","<h2 align='center' style='color:green;'>Password Changed Successfully!</h2>");
				req.getRequestDispatcher("myaccount.jsp").forward(req, res);
			}
			else
			{
				req.setAttribute("message","<h2 align='center' style='color:red;'>Incorrect Old Password!</h2>");
				req.getRequestDispatcher("myaccount.jsp").include(req, res);
			}
		}
	}
}