package enumerations;

public enum Peau {
	BLANCHE,
	NOIR,
	CHOCOLAT,
	METISSE;
	
public static final Peau[] allpeau = Peau.values();
	
	public static String toString(Peau p){
		String s = null;
		switch(p) {
		case NOIR:
			s = "Noir";
			break;
		case BLANCHE:
			s = "Blanche";
			break;
		case CHOCOLAT:
			s = "Chocolat";
			break;
		case METISSE:
			s = "Metisse";
			break;
		}
		return s;
	};
	
	public static Peau toCaracteristiques(String nom) {
		Peau s = null;
		switch(nom) {
		case "Noir":
			s = NOIR ;
			break;
		case "Blanche":
			s = BLANCHE;
			break;
		case "Chocolat":
			s = CHOCOLAT;
			break;
		case "Metisse":
			s = METISSE;
			break;
		}
		return s;
	}
	
	public static int toInteger(String nom) {
		int s = 0;
		switch(nom) {
		case "Blanche":
			s = 0 ;
			break;
		case "Noir":
			s = 1;
			break;
		case "Chocolat":
			s = 2;
			break;
		case "Metisse":
			s = 3;
			break;
		}
		return s;
	}
	
	
}
