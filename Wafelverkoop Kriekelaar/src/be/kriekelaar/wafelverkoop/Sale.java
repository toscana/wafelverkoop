package be.kriekelaar.wafelverkoop;

import java.io.Serializable;
import java.util.ArrayList;

import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Index;

@Entity
public class Sale implements Serializable,Comparable<Sale> {
	private static final long serialVersionUID = -4248051598893490145L;

	private String klas;
	private String nameStudent;
	private String tel;


	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getNameStudent() {
		return nameStudent;
	}

	public void setNameStudent(String nameStudent) {
		this.nameStudent = nameStudent;
	}

	public String getKlas() {
		return klas;
	}

	public void setKlas(String klas) {
		this.klas = klas;
	}

	private ArrayList<Food> food = new ArrayList<Food>();
	@Id
	private Long id;
	
	private String comment;
	
		
	public Sale() {
	}

	public Sale(ArrayList<Food> food,String klas,String nameStudent) {
		super();
		this.food = food;
		this.klas = klas;
		this.nameStudent = nameStudent;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	
	public void addFood(Food f) {
		food.add(f);
	}



	public ArrayList<Food> getFoodList() {
		return food;
	}

	public Long getId() {
		return id;
	}

	public float getTotalPrice() {
		float sum = 0;
		for (Food f : food) {
			sum += f.getNumber() * f.getTotalPrice();
		}
		return sum;
	}

	@Override
	public int compareTo(Sale o) {
		return Long.compare(id, o.getId());
	}

}
