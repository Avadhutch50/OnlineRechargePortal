package dao;

public class Plan {
	private int planid;
	private int operatorid;
	private String plandetails;
	private String planvalidity;
	private float price;
	public Plan(int planid, int operatorid, String plandetails, String planvalidity, float price) {
		super();
		this.planid = planid;
		this.operatorid = operatorid;
		this.plandetails = plandetails;
		this.planvalidity = planvalidity;
		this.price = price;
	}
	public int getPlanid() {
		return planid;
	}
	public void setPlanid(int planid) {
		this.planid = planid;
	}
	public int getOperatorid() {
		return operatorid;
	}
	public void setOperatorid(int operatorid) {
		this.operatorid = operatorid;
	}
	public String getPlandetails() {
		return plandetails;
	}
	public void setPlandetails(String plandetails) {
		this.plandetails = plandetails;
	}
	public String getPlanvalidity() {
		return planvalidity;
	}
	public void setPlanvalidity(String planvalidity) {
		this.planvalidity = planvalidity;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
}