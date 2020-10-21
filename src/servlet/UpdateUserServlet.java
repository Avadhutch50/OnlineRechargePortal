package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDetailsDAO;

@WebServlet("/update-info")
public class UpdateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HttpSession session;
	public void doPost(HttpServletRequest req,HttpServletResponse res) throws IOException, ServletException
	{
		res.setContentType("text/html");
		int userid = (Integer)req.getSession().getAttribute("id");
		String fname = req.getParameter("fullname");
		String email = req.getParameter("email");
		String mobileno = req.getParameter("mobileno");
		String user = req.getParameter("user");
		if(fname.isEmpty()||email.isEmpty()||mobileno.isEmpty()||user.isEmpty())
		{
			req.setAttribute("message","<h2 align='center' style='color:red;'>Please fill all fields, and try again!</h2>");
			req.getRequestDispatcher("myaccount.jsp").include(req, res);
		}
		else
		{
			String driver = this.getServletContext().getInitParameter("driverpath");
			String url = this.getServletContext().getInitParameter("url");
			
			UserDetailsDAO u = new UserDetailsDAO(driver,url);
			int i = u.check_user_details(userid, fname, email, mobileno, user);
			if(i==0)
			{
				req.setAttribute("message","<h2 align='center' style='color:red;'>No changes made to update!</h2>");
				req.getRequestDispatcher("myaccount.jsp").include(req, res);
			}
			else if(i==-1)
			{
				req.setAttribute("message","<h2 align='center' style='color:red;'>Email, Mobile OR Username Already Exist!</h2>");
				req.getRequestDispatcher("myaccount.jsp").include(req, res);
			}
			else if(i==1)
			{
				u.user_details_update(userid, fname, email, mobileno, user);
				session = req.getSession();
				session.setAttribute("id",userid);
				session.setAttribute("fname",fname);
				session.setAttribute("email",email);
				session.setAttribute("mobileno",mobileno);
				session.setAttribute("username",user);
				req.setAttribute("message","<h2 align='center' style='color:green;'>Information Updated Successfully!</h2>");
				req.getRequestDispatcher("myaccount.jsp").forward(req, res);
			}
		}
	}
}