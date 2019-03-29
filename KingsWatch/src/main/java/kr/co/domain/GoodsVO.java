package kr.co.domain;

import java.io.Serializable;
import java.util.Arrays;

public class GoodsVO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String g_id; // 상품의아이디
	private String g_name; // 상품명
	private String g_brand; // 상품브랜드
	private int g_price; // 상품원가
	private int g_sale; // 할인율
	private String g_desc; // 상품정보
	private int g_category; // 상품카테고리 (여자:1,남자:2,공용:0)
	private int g_is_selling; // 상품이 팔렸는지 여부 (팔림:1,안팔림:0)
	private String g_date; // 상품게시일자
	private String[] files; // 상품사진리스트
	
	public GoodsVO() {
		// TODO Auto-generated constructor stub
	}

	public GoodsVO(String g_id, String g_name, String g_brand, int g_price, int g_sale, String g_desc, int g_category,
			int g_is_selling, String g_date, String[] files) {
		super();
		this.g_id = g_id;
		this.g_name = g_name;
		this.g_brand = g_brand;
		this.g_price = g_price;
		this.g_sale = g_sale;
		this.g_desc = g_desc;
		this.g_category = g_category;
		this.g_is_selling = g_is_selling;
		this.g_date = g_date;
		this.files = files;
	}

	public String getG_id() {
		return g_id;
	}

	public void setG_id(String g_id) {
		this.g_id = g_id;
	}

	public String getG_name() {
		return g_name;
	}

	public void setG_name(String g_name) {
		this.g_name = g_name;
	}

	public String getG_brand() {
		return g_brand;
	}

	public void setG_brand(String g_brand) {
		this.g_brand = g_brand;
	}

	public int getG_price() {
		return g_price;
	}

	public void setG_price(int g_price) {
		this.g_price = g_price;
	}

	public int getG_sale() {
		return g_sale;
	}

	public void setG_sale(int g_sale) {
		this.g_sale = g_sale;
	}

	public String getG_desc() {
		return g_desc;
	}

	public void setG_desc(String g_desc) {
		this.g_desc = g_desc;
	}

	public int getG_category() {
		return g_category;
	}

	public void setG_category(int g_category) {
		this.g_category = g_category;
	}

	public int getG_is_selling() {
		return g_is_selling;
	}

	public void setG_is_selling(int g_is_selling) {
		this.g_is_selling = g_is_selling;
	}

	public String getG_date() {
		return g_date;
	}

	public void setG_date(String g_date) {
		this.g_date = g_date;
	}

	public String[] getFiles() {
		return files;
	}

	public void setFiles(String[] files) {
		this.files = files;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "GoodsVO [g_name=" + g_name + ", g_brand=" + g_brand + ", g_price=" + g_price + ", g_sale=" + g_sale
				+ ", g_desc=" + g_desc + ", g_category=" + g_category + ", g_date=" + g_date + ", files="
				+ Arrays.toString(files) + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((g_id == null) ? 0 : g_id.hashCode());
		result = prime * result + ((g_name == null) ? 0 : g_name.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		GoodsVO other = (GoodsVO) obj;
		if (g_id == null) {
			if (other.g_id != null)
				return false;
		} else if (!g_id.equals(other.g_id))
			return false;
		if (g_name == null) {
			if (other.g_name != null)
				return false;
		} else if (!g_name.equals(other.g_name))
			return false;
		return true;
	}

	

}
