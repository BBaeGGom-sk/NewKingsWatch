package kr.co.domain;

public class BrandCriteria extends Criteria{

	private String g_brand;
	
	
	public BrandCriteria() {
		// TODO Auto-generated constructor stub
	}


	public BrandCriteria(String g_brand) {
		super();
		this.g_brand = g_brand;
	}


	public String getG_brand() {
		return g_brand;
	}


	public void setG_brand(String g_brand) {
		this.g_brand = g_brand;
	}

	
}
