package be.kriekelaar.wafelverkoop;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Random;

import java.util.logging.Logger;

public class SaleHandler {

	private static final Logger log = Logger.getLogger("bert");

	private static SaleHandler uniqueInstance = new SaleHandler();

	private SaleHandler() {

	}

	public static SaleHandler getInstance() {
		return uniqueInstance;
	}

	public void addBevestiging(Approval b) {
		OfyService.ofy().save().entities(b).now();
	}

	public List<Approval> getBevestigingen() {
		List<Approval> bev = OfyService.ofy().load().type(Approval.class)
				.list();
		return bev;
	}

	public ArrayList<Sale> getSalesForClass(String klas) {
		List<Sale> sales = OfyService.ofy().load().type(Sale.class).list();
		ArrayList<Sale> klasSales = new ArrayList<Sale>();
		for (Sale s : sales)
			if (s.getKlas().equalsIgnoreCase(klas))
				klasSales.add(s);

		Collections.sort(klasSales);
		return klasSales;
	}

	public void addSale(Sale sale) {
		ArrayList<Food> food = sale.getFoodList();
		for (Food f : food) {
			OfyService.ofy().save().entities(f).now();
		}

		OfyService.ofy().save().entities(sale).now();
	}

	public void addKlas(Klas k) {
		OfyService.ofy().save().entity(k);
	}

	public String getKlasFullName(String optionName) {
		List<Klas> klassen = OfyService.ofy().load().type(Klas.class).list();
		for (Klas k : klassen)
			if (k.getKlasOptionName().equalsIgnoreCase(optionName))
				return k.getKlasName();
		return "fout";
	}

	public void addFoodType(FoodType type) {
		OfyService.ofy().save().entities(type).now();
	}

	public Food getFlowerOnId(Long flowerId) {
		Food f = OfyService.ofy().load().type(Food.class).id(flowerId)
				.get();

		return f;
	}

	public List<Food> getFoodForSale(Long saleID) {
		Sale s = OfyService.ofy().load().type(Sale.class).id(saleID).get();

		List<Food> list = new ArrayList<Food>();
		for (Food f : s.getFoodList()) {
			Food realflower = OfyService.ofy().load().type(Food.class)
					.id(f.getId()).get();
			list.add(realflower);
		}
		return list;

	}

	public List<Sale> getSales() {
		List<Sale> sales = OfyService.ofy().load().type(Sale.class).list();
		Collections.sort(sales);
		return sales;
	}

	public List<Klas> getKlassen() {
		List<Klas> klassen = OfyService.ofy().load().type(Klas.class).list();
		Collections.sort(klassen);
		return klassen;
	}

	public List<FoodType> getAllFoodTypes() {
		List<FoodType> foodTypes = OfyService.ofy().load()
				.type(FoodType.class).list();
		Collections.sort(foodTypes);

		return foodTypes;
	}
	
	/*
	public void stressTest() {

		Random r;
		r = new Random();

		List<FoodType> flowert = SaleHandler.getInstance()
				.getAllFlowerTypes();
		for (int i = 61; i < 80; i++) {
			ArrayList<Flower> flowers = new ArrayList<Flower>();
			
			int aantal = r.nextInt(15);
			int aantalFlowerTypes = flowert.size();
			int flowertrandom = r.nextInt(aantalFlowerTypes);

			FoodType ft = flowert.get(flowertrandom);

			for (int j = 0; j < aantalFlowerTypes; j++) {
				if (j != flowertrandom) {
					flowers.add(new Flower(0, flowert.get(j).getPrice(),
							flowert.get(j).getName(), flowert.get(j).getColor()));
				} else
					flowers.add(new Flower(aantal, ft.getPrice(), ft.getName(),
							ft.getColor()));
			}

			Sale s = new Sale("bert", "europalaan", "hofstade", "email",
					"telefoon", Integer.toString(i), flowers, "K0",
					"Elise Van Rillaer");
			s.setPayed(true);
			s.setPayType(Sale.PayType.CASH);
			SaleHandler.getInstance().addSale(s);
		}
	}
	
	*/

	public void eraseAllSales() {
		List<Sale> sales = OfyService.ofy().load().type(Sale.class).list();
		List<Food> food = OfyService.ofy().load().type(Food.class)
				.list();

		OfyService.ofy().delete().entities(sales);
		OfyService.ofy().delete().entities(food);
	}

}
