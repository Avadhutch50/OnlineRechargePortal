package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDetailsDAO;

@WebServlet("/recharge")
public class RechargeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HttpSession session;
	public void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		session = req.getSession();
		String mobileno = req.getParameter("mobileno");
		String operatorid = req.getParameter("operatorid");
		String planid = req.getParameter("planid");
		String amount = req.getParameter("amount");
		if(mobileno.isEmpty()||operatorid.isEmpty()||amount.isEmpty())
		{
			req.setAttribute("message","<h2 align='center' style='color:red;'>Please fill all fields, and try again!</h2>");
			req.getRequestDispatcher("rechargeoperatorlist").include(req, res);
		}
		else
		{
			String driver = this.getServletContext().getInitParameter("driverpath");
			String url = this.getServletContext().getInitParameter("url");
			
			UserDetailsDAO user = new UserDetailsDAO(driver,url);
			if(user.mobile_recharge(mobileno, operatorid, planid, amount))
			{
				req.setAttribute("message","<h2 align='center' style='color:green;'>Recharge Successfully!</h2><script type='text/javascript'>alert('Recharge of RS. "+amount+" was successful on "+mobileno+".');</script>");
				req.getRequestDispatcher("rechargeoperatorlist").forward(req, res);
			}
			else
			{
				req.setAttribute("message","<h2 align='center' style='color:red;'>Recharge Failed, Invalid Operator OR Mobile Number!</h2>");
				req.getRequestDispatcher("rechargeoperatorlist").include(req, res);
			}
		}
	}
}