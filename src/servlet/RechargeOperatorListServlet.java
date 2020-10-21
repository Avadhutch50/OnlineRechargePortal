package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Operator;
import dao.UserDetailsDAO;

@WebServlet("/rechargeoperatorlist")
public class RechargeOperatorListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public void service(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		String driver = this.getServletContext().getInitParameter("driverpath");
		String url = this.getServletContext().getInitParameter("url");
		UserDetailsDAO user = new UserDetailsDAO(driver,url);
		List<Operator> oplist =  user.operator_list();
		req.setAttribute("operator_list",oplist);
		req.getRequestDispatcher("recharge.jsp").forward(req, res);
	}
}