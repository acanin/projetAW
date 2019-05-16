package enumerations;

public enum Peau {
	TRES_BLANCHE,
	CLAIRE,
	INTERMEDIAIRE,
	MATE,
	BRUN_FONCE,
	TRES_FONCE;
	
public static final Peau[] allpeau = Peau.values();
	
	public static String toString(Peau p){
		String s = null;
		switch(p) {
		case TRES_BLANCHE:
			s = "Tres blanche";
			break;
		case CLAIRE:
			s = "Claire";
			break;
		case INTERMEDIAIRE:
			s = "Intermediaire";
			break;
		case MATE:
			s = "Mate";
			break;
		case BRUN_FONCE:
			s = "Brun fonce";
			break;
		case TRES_FONCE:
			s = "Tres fonce";
			break;
		}
		return s;
	};
	
	public static Peau toCaracteristiques(String nom) {
		Peau s = null;
		switch(nom) {
		case "Tres blanche":
			s = TRES_BLANCHE ;
			break;
		case "Claire":
			s = CLAIRE;
			break;
		case "Intermediaire":
			s = INTERMEDIAIRE;
			break;
		case "Mate":
			s = MATE;
			break;
		case "Brun fonce":
			s = BRUN_FONCE;
			break;
		case "Tres fonce":
			s = TRES_FONCE;
			break;
		}
		return s;
	}
	
	public static int toInteger(String nom) {
		int s = 0;
		switch(nom) {
		case "Tres blanche":
			s = 0;
			break;
		case "Claire":
			s = 1;
			break;
		case "Intermediaire":
			s = 2;
			break;
		case "Mate":
			s = 3;
			break;
		case "Brun fonce":
			s = 4;
			break;
		case "Tres fonce":
			s = 5;
			break;
		}
		return s;
	}
	
	
}
