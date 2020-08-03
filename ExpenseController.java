package Controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ExpenseDao;
import model.Expense;

@WebServlet("/expenses")
public class ExpenseController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ExpenseDao expenseDao;

	public void init() {
		expenseDao = new ExpenseDao();

	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			List<Expense> result = expenseDao
					.getExpenseList((Integer)(request.getSession().getAttribute("user_id")));
			System.out.println("expense list size is " + result.size());

			HttpSession session = request.getSession();
			session.setAttribute("expenseList", result);
			RequestDispatcher rd=request.getRequestDispatcher("expenseList.jsp");  
            rd.forward(request, response); 

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String time = new Date().toString();
		Expense expense = new Expense((Integer)(request.getSession().getAttribute("user_id")),
				request.getParameter("expense_details"), Double.parseDouble(request.getParameter("amount")), time,
				time);

		try {
			boolean result = expenseDao.createExpense(expense);
			if (result) {
				HttpSession session = request.getSession();
				session.setAttribute("msg", "Expense Details saved successfully.");
				response.sendRedirect("expenseDetails.jsp");
			} else {
				HttpSession session = request.getSession();
				session.setAttribute("isError", true);
				session.setAttribute("msg", "Error Occured. Please try again later.");
				response.sendRedirect("expenseDetails.jsp");

			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

	}

}
