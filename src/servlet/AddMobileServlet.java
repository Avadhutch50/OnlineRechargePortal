package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDetailsDAO;

@WebServlet("/add-mobile")
public class AddMobileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		String mobileno = req.getParameter("mobileno");
		String owner = req.getParameter("ownername");
		String operatorid = req.getParameter("operatorid");
		if(mobileno.isEmpty()||owner.isEmpty()||operatorid.isEmpty())
		{
			req.setAttribute("message","<h2 align='center' style='color:red;'>Please fill all fields, and try again!</h2>");
			req.getRequestDispatcher("mobileoperatorlist").include(req, res);
		}
		else
		{
			String driver = this.getServletContext().getInitParameter("driverpath");
			String url = this.getServletContext().getInitParameter("url");
			
			UserDetailsDAO user = new UserDetailsDAO(driver,url);
			if(user.insert_mobileno(mobileno, operatorid, owner))
			{
				req.setAttribute("message","<h2 align='center' style='color:green;'>Mobile Number Added Successfully!</h2>");
				req.getRequestDispatcher("mobileoperatorlist").forward(req, res);
			}
			else
			{
				req.setAttribute("message","<h2 align='center' style='color:red;'>Mobile Number Already Exist!</h2>");
				req.getRequestDispatcher("mobileoperatorlist").include(req, res);
			}
		}
	}
}
