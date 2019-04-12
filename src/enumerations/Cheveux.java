package enumerations;

public enum Cheveux {
	NOIR,
	BRUN,
	CHATAIN,
	BLOND,
	ROUX,
	CHAUVE;
	
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
		case CHAUVE:
			s = "Chauve";
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
		case "Chauve":
			s = CHAUVE;
			break;
		}
		return s;
	}
}
