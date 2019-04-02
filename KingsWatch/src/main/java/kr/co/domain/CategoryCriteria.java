package kr.co.domain;

public class CategoryCriteria extends Criteria{

	private String g_brand;
	private int g_category;
	
	
	public CategoryCriteria() {
		// TODO Auto-generated constructor stub
	}


	public CategoryCriteria(String g_brand, int g_category) {
		super();
		this.g_brand = g_brand;
		this.g_category = g_category;
	}


	public String getG_brand() {
		return g_brand;
	}


	public void setG_brand(String g_brand) {
		this.g_brand = g_brand;
	}


	public int getG_category() {
		return g_category;
	}


	public void setG_category(int g_category) {
		this.g_category = g_category;
	}


	@Override
	public String toString() {
		return "CategoryCriteria [g_brand=" + g_brand + ", g_category=" + g_category + "]";
	}	

	
	
	
	
}
