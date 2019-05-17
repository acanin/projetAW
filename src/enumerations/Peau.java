package enumerations;

public enum Peau {
	CLAIRE,
	INTERMEDIAIRE,
	MATE,
	FONCE;
	
public static final Peau[] allpeau = Peau.values();
	
	public static String toString(Peau p){
		String s = null;
		switch(p) {
		case CLAIRE:
			s = "Claire";
			break;
		case INTERMEDIAIRE:
			s = "Intermediaire";
			break;
		case MATE:
			s = "Mate";
			break;
		case FONCE:
			s = "Fonce";
			break;
		}
		return s;
	};
	
	public static Peau toCaracteristiques(String nom) {
		Peau s = null;
		switch(nom) {
		case "Claire":
			s = CLAIRE;
			break;
		case "Intermediaire":
			s = INTERMEDIAIRE;
			break;
		case "Mate":
			s = MATE;
			break;
		case "Fonce":
			s = FONCE;
			break;
		}
		return s;
	}
	
	public static int toInteger(String nom) {
		int s = 0;
		switch(nom) {
		case "Claire":
			s = 0;
			break;
		case "Intermediaire":
			s = 1;
			break;
		case "Mate":
			s = 2;
			break;
		case "Fonce":
			s = 3;
			break;
		}
		return s;
	}
	
	
}
