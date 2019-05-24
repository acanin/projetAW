package enumerations;

public enum Statu {
	ATTENTE,
	ACCEPTE,
	REFUSE;
	
	public static String toString(Statu st){
		String s = null;
		switch(st) {
		case ATTENTE:
			s = "En Attente";
			break;
		case ACCEPTE:
			s = "Acceptee";
			break;
		case REFUSE:
			s = "Refusee";
			break;
		}
		return s;
	};

}
