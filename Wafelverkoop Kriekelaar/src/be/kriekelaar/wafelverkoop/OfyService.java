package be.kriekelaar.wafelverkoop;

import com.googlecode.objectify.Objectify;
import com.googlecode.objectify.ObjectifyFactory;
import com.googlecode.objectify.ObjectifyService;

	
public class OfyService {
	static {
		factory().register(Sale.class);
		factory().register(Food.class);
		factory().register(FoodType.class);
		factory().register(Klas.class);
		factory().register(Approval.class);
	}

	public static Objectify ofy() {
		return ObjectifyService.ofy();
	}

	public static ObjectifyFactory factory() {
		return ObjectifyService.factory();
	}
}

