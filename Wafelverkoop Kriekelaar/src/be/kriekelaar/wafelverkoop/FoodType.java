package be.kriekelaar.wafelverkoop;

import java.io.Serializable;

import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;

@Entity
public class FoodType implements Serializable,Comparable<FoodType> {
	private static final long serialVersionUID = -3682401405308345218L;
	
	private String name;
	private float price;
	private int order;
	
	
	
	public int getOrder() {
		return order;
	}

	public void setOrder(int order) {
		this.order = order;
	}

	@Id
	private Long id;
		
	
	public FoodType() {
		super();
	}

	public FoodType(String name, float price,int order) {
		super();
		this.name = name;
		this.price = price;
		this.order = order;
	}

	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}

	@Override
	public int compareTo(FoodType o) {
		return Integer.compare(order, o.order);
	}

}
