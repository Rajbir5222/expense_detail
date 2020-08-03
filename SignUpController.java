package Controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDao;
import model.User;

@WebServlet("/signup")
public class SignUpController extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private UserDao userDao;

	public void init() {
		userDao = new UserDao();

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		User user = new User(request.getParameter("username"), request.getParameter("password"),
				request.getParameter("firstName"), request.getParameter("lastName"), request.getParameter("emailId"));
		
		user.setCreatedAt(new Date().toString());
		user.setUpdatedAt(new Date().toString());
		try {
			String result=userDao.checkUserAlreadyExist(user);
			if(result.equals("OK")) {
				if (userDao.signUp(user)){
					HttpSession session = request.getSession();
					session.setAttribute("successMsg","User created successfully.");
					response.sendRedirect("signup.jsp");
				} 
			}
			else {
				HttpSession session = request.getSession();
				session.setAttribute("userExist", true);
				session.setAttribute("errorMsg", result);
				response.sendRedirect("signup.jsp");
				
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

}
