package dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.Login;
import model.User;
import util.CommonUtils;
public class UserDao {
	public User validate(Login loginBean) throws ClassNotFoundException {
        boolean status = false;

        Class.forName("com.mysql.jdbc.Driver");

        try (Connection connection = DriverManager
            .getConnection("jdbc:mysql://localhost:3306/expense_details?useSSL=false", "root", "Rajbir#_1545");

            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection
            .prepareStatement("select * from user where user_name = ? and password = ? ")) {
            preparedStatement.setString(1, loginBean.getUsername());
            preparedStatement.setString(2, loginBean.getPassword());

            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            status = rs.next();
            if(status) {
            	User user = new User(rs.getInt("user_id"),rs.getString("user_name"),rs.getString("first_name"),
                rs.getString("last_name"));
                return user;	
            }
            

        } catch (SQLException e) {
            // process sql exception
            CommonUtils.printSQLException(e);
        }
        return null;
    }

    
    public boolean signUp(User user) throws ClassNotFoundException {
    	Class.forName("com.mysql.jdbc.Driver");

        try (Connection connection = DriverManager
            .getConnection("jdbc:mysql://localhost:3306/expense_details?useSSL=false", "root", "Rajbir#_1545");

            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection
            .prepareStatement("INSERT INTO user values(default,?,?,?,?,?,?,?)")) {
            preparedStatement.setString(1, user.getUsername());
            preparedStatement.setString(2, user.getPassword());
            preparedStatement.setString(3, user.getFirstName());
            preparedStatement.setString(4, user.getLastName());
            preparedStatement.setString(5, user.getEmailId());
            preparedStatement.setString(6, user.getCreatedAt());
            preparedStatement.setString(7, user.getUpdatedAt());

            System.out.println(preparedStatement);
            preparedStatement.execute();
            return true;

        } catch (SQLException e) {
            // process sql exception
            CommonUtils.printSQLException(e);
            return false;
        }
    }
    public String checkUserAlreadyExist(User user) throws ClassNotFoundException {
    	Class.forName("com.mysql.jdbc.Driver");

        try (Connection connection = DriverManager
            .getConnection("jdbc:mysql://localhost:3306/expense_details?useSSL=false", "root", "Rajbir#_1545");

            // Step 2:Create a statement using connection object
            PreparedStatement usernameCheck = connection
            .prepareStatement("select * from user where user_name= ?");
        		PreparedStatement emailCheck = connection
        	            .prepareStatement("select * from user where email_id= ?");) {
            usernameCheck.setString(1, user.getUsername());
            emailCheck.setString(1, user.getEmailId());
            
            System.out.println(usernameCheck);
            ResultSet rs1 = emailCheck.executeQuery();
            if(rs1.next()) {
            	return ("Email Id already exists");
            }else {
            	ResultSet rs = usernameCheck.executeQuery();
            	if(rs.next()) {
            		return ("Username already exists");
            	}
            }
        } catch (SQLException e) {
            // process sql exception
            CommonUtils.printSQLException(e);
            return("Error occured. Please try again later.");
            
        }
		return "OK";
    	
    }
}
