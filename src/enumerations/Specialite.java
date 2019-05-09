package enumerations;

public enum Specialite {
	GENERALISTE,
	GYNECO,
	INFIRMIERE,
	Test;
	
	public static final Specialite[] allspe = Specialite.values();
	
	public static String toString(Specialite sp){
		String s = null;
		switch(sp) {
		case GENERALISTE:
			s = "Généraliste";
			break;
		case GYNECO:
			s = "Gynécologue";
			break;
		case INFIRMIERE:
			s = "Infirmière";
			break;
		}
		return s;
	};
	
	public static Specialite toCaracteristiques(String nom) {
		Specialite s = Specialite.Test;
		switch(nom) {
		case "Généraliste":
			s = GENERALISTE;
			break;
		case "Gynécologue":
			s = GYNECO;
			break;
		case "Infirmière":
			s = INFIRMIERE;
			break;
		}
		return s;
	}
}
