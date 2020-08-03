package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDao;
import model.Login;
import model.User;

@WebServlet("/login")
public class LoginController extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private UserDao loginDao;

	public void init() {
		loginDao = new UserDao();

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		Login loginBean = new Login();
		loginBean.setUsername(username);
		loginBean.setPassword(password);
		try {
			User currentUser=loginDao.validate(loginBean);
            if (currentUser!=null) {
            	 session.setAttribute("isError", false);
            	 session.setAttribute("user_id", currentUser.getUserId());
            	 session.setAttribute("fullname", currentUser.getFirstName()+" "+currentUser.getLastName());
            	 RequestDispatcher rd=request.getRequestDispatcher("expenseDetails.jsp");  
                 rd.forward(request, response);  
            } else {
                
                session.setAttribute("isError", true);
                response.sendRedirect("index.jsp");
                
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
	}

}
