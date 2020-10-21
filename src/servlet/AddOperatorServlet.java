package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDetailsDAO;

@WebServlet("/add-operator")
public class AddOperatorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		String operatorname = req.getParameter("opname");
		String companyname = req.getParameter("company");
		if(operatorname.isEmpty()||companyname.isEmpty())
		{
			req.setAttribute("message","<h2 align='center' style='color:red;'>Please fill all fields, and try again!</h2>");
			req.getRequestDispatcher("addoperator.jsp").include(req, res);
		}
		else
		{
			String driver = this.getServletContext().getInitParameter("driverpath");
			String url = this.getServletContext().getInitParameter("url");
			
			UserDetailsDAO user = new UserDetailsDAO(driver,url);
			if(user.insert_operator(operatorname, companyname))
			{
				req.setAttribute("message","<h2 align='center' style='color:green;'>Operator Added Successfully!</h2>");
				req.getRequestDispatcher("addoperator.jsp").forward(req, res);
			}
			else
			{
				req.setAttribute("message","<h2 align='center' style='color:red;'>Operator Already Exist!</h2>");
				req.getRequestDispatcher("addoperator.jsp").include(req, res);
			}
		}
	}
}