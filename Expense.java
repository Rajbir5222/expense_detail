package model;

public class Expense {
	private int expense_id;
	private int user_id;
	private String expense_details;
	private Double amount;
	private String created_time;
	private String updated_time;
	
	
	public Expense(int user_id, String expense_details, Double amount, String created_time, String updated_time) {
		super();
		this.user_id = user_id;
		this.expense_details = expense_details;
		this.amount = amount;
		this.created_time = created_time;
		this.updated_time = updated_time;
	}
	public int getExpense_id() {
		return expense_id;
	}
	public void setExpense_id(int expense_id) {
		this.expense_id = expense_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getExpense_details() {
		return expense_details;
	}
	public void setExpense_details(String expense_details) {
		this.expense_details = expense_details;
	}
	public Double getAmount() {
		return amount;
	}
	public void setAmount(Double amount) {
		this.amount = amount;
	}
	public String getCreated_time() {
		return created_time;
	}
	public void setCreated_time(String created_time) {
		this.created_time = created_time;
	}
	public String getUpdated_time() {
		return updated_time;
	}
	public void setUpdated_time(String updated_time) {
		this.updated_time = updated_time;
	}
	
	

}
