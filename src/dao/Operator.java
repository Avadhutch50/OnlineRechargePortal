package dao;

public class Operator {
	private int id;
	private String name;
	private String comapny;
	public Operator(int id, String name, String comapny) {
		super();
		this.id = id;
		this.name = name;
		this.comapny = comapny;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getComapny() {
		return comapny;
	}
	public void setComapny(String comapny) {
		this.comapny = comapny;
	}
}