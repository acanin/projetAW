package enumerations;

public enum Cheveux {
	NOIR,
	BRUN,
	CHATAIN,
	BLOND,
	ROUX;
	
public static final Cheveux[] allcheveux = Cheveux.values();
	
	public static String toString(Cheveux c){
		String s = null;
		switch(c) {
		case NOIR:
			s = "Noir";
			break;
		case BRUN:
			s = "Brun";
			break;
		case CHATAIN:
			s = "Chatain";
			break;
		case BLOND:
			s = "Blond";
			break;
		case ROUX:
			s = "Roux";
			break;
		}
		return s;
	};
	
	public static Cheveux toCaracteristiques(String nom) {
		Cheveux s = null;
		switch(nom) {
		case "Noir":
			s = NOIR;
			break;
		case "Brun":
			s = BRUN;
			break;
		case "Chatain":
			s = CHATAIN;
			break;
		case "Blond":
			s = BLOND ;
			break;
		case "Roux":
			s = ROUX;
			break;
		}
		return s;
	}
	
	public static int toInteger(String cheveux) {
		int s = 0;
		switch(cheveux) {
		case "Noir":
			s = 0;
			break;
		case "Brun":
			s = 1;
			break;
		case "Chatain":
			s = 2;
			break;
		case "Blond":
			s = 3;
			break;
		case "Roux":
			s = 4;
			break;
		}
		return s;
	}
}
