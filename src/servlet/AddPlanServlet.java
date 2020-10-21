package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDetailsDAO;

@WebServlet("/add-plan")
public class AddPlanServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		String operatorid = req.getParameter("operatorid");
		String plandetails = req.getParameter("plandetails");
		String planvalidity = req.getParameter("planvalidity");
		String price = req.getParameter("price");
		if(operatorid.isEmpty()||plandetails.isEmpty()||planvalidity.isEmpty()||price.isEmpty())
		{
			req.setAttribute("message","<h2 align='center' style='color:red;'>Please fill all fields, and try again!</h2>");
			req.getRequestDispatcher("planoperatorlist").include(req, res);
		}
		else
		{
			String driver = this.getServletContext().getInitParameter("driverpath");
			String url = this.getServletContext().getInitParameter("url");
			
			UserDetailsDAO user = new UserDetailsDAO(driver,url);
			if(user.check_plan_exist(operatorid, price))
			{
				req.setAttribute("message","<h2 align='center' style='color:red;'>Plan already exist with same operator and price!</h2>");
				req.getRequestDispatcher("planoperatorlist").include(req, res);
			}
			else
			{
				if(user.add_plan(operatorid, plandetails, planvalidity, price))
				{
					req.setAttribute("message","<h2 align='center' style='color:green;'>Plan Added Successfully!</h2>");
					req.getRequestDispatcher("planoperatorlist").forward(req, res);
				}
				else
				{
					req.setAttribute("message","<h2 align='center' style='color:red;'>Plan already exist with same price and operator!</h2>");
					req.getRequestDispatcher("planoperatorlist").include(req, res);
				}
			}
		}
	}
}