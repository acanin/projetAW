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
			s = "Generaliste";
			break;
		case GYNECO:
			s = "Gynecologue";
			break;
		case INFIRMIERE:
			s = "Infirmiere";
			break;
		}
		return s;
	};
	
	public static Specialite toCaracteristiques(String nom) {
		Specialite s = Specialite.Test;
		switch(nom) {
		case "Generaliste":
			s = GENERALISTE;
			break;
		case "Gynecologue":
			s = GYNECO;
			break;
		case "Infirmiere":
			s = INFIRMIERE;
			break;
		}
		return s;
	}
}
