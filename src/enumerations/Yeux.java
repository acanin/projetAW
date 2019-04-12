package enumerations;

public enum Yeux {

	BLEU,
	VERT,
	MARRON,
	NOISETTE,
	GRIS,
	VAIRON;
	
	public static final Yeux[] allyeux = Yeux.values();
	
	public static String toString(Yeux y){
		String s = null;
		switch(y) {
		case BLEU:
			s = "Bleu";
			break;
		case VERT:
			s = "Vert";
			break;
		case MARRON:
			s = "Marron";
			break;
		case NOISETTE:
			s = "Noisette";
			break;
		case GRIS:
			s = "Gris";
			break;
		case VAIRON:
			s = "Vairon";
			break;
		}
		return s;
	};
	
	public static Yeux toCaracteristiques(String nom) {
		Yeux s = null;
		switch(nom) {
		case "Bleu":
			s = BLEU ;
			break;
		case "Vert":
			s = VERT;
			break;
		case "Marron":
			s = MARRON;
			break;
		case "Noisette":
			s = NOISETTE;
			break;
		case "Gris":
			s = GRIS;
			break;
		case "Vairon":
			s = VAIRON;
			break;
		}
		return s;
	};
	
}
