package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Expense;
import util.CommonUtils;

public class ExpenseDao {
	public boolean createExpense(Expense expense) throws ClassNotFoundException {
		Class.forName("com.mysql.jdbc.Driver");

		try (Connection connection = DriverManager
				.getConnection("jdbc:mysql://localhost:3306/expense_details?useSSL=false", "root", "Rajbir#_1545");

				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection
						.prepareStatement("INSERT INTO expense values(default,?,?,?,?,?)")) {
			preparedStatement.setInt(1, expense.getUser_id());
			preparedStatement.setString(2, expense.getExpense_details());
			preparedStatement.setDouble(3, expense.getAmount());
			preparedStatement.setString(4, expense.getCreated_time());
			preparedStatement.setString(5, expense.getUpdated_time());

			System.out.println(preparedStatement);
			preparedStatement.execute();
			return true;

		} catch (SQLException e) {
			// process sql exception
			CommonUtils.printSQLException(e);
			return false;
		}
	}

	public List<Expense> getExpenseList(int user_id) throws ClassNotFoundException {
		Class.forName("com.mysql.jdbc.Driver");
		List<Expense> expenseList = new ArrayList<Expense>();
		try (Connection connection = DriverManager
				.getConnection("jdbc:mysql://localhost:3306/expense_details?useSSL=false", "root", "Rajbir#_1545");

				PreparedStatement preparedStatement = connection
						.prepareStatement("select * from expense where user_id =?")) {

			preparedStatement.setInt(1, user_id);
			System.out.println(preparedStatement);

			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				Expense expense = new Expense(rs.getInt("user_id"), rs.getString("expense_details"),
						rs.getDouble("amount"), rs.getString("created_time"), rs.getString("updated_time"));
				expense.setExpense_id(rs.getInt("expense_id"));

				expenseList.add(expense);

			}

		} catch (SQLException e) {
			// process sql exception
			CommonUtils.printSQLException(e);
		}
		return expenseList;
	}
}
