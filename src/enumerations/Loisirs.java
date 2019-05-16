package enumerations;

public enum Loisirs {
	DANSE,
	LECTURE,
	CUISINE,
	COURSE,
	JUDO,
	ESCALADE,
	JEUX,
	VIOLON,
	PIANO,
	GUITARE;
	
public static final Loisirs[] allloisirs = Loisirs.values();
	
	public static String toString(Loisirs l){
		String s = null;
		switch(l) {
		case DANSE:
			s = "Danse";
			break;
		case LECTURE:
			s = "Lecture";
			break;
		case CUISINE:
			s = "Cuisine";
			break;
		case COURSE:
			s = "Course";
			break;
		case JUDO:
			s = "Judo";
			break;
		case ESCALADE:
			s = "Escalade";
			break;
		case JEUX:
			s = "Jeux";
			break;
		case VIOLON:
			s = "Violon";
			break;
		case PIANO:
			s = "Piano";
			break;
		case GUITARE:
			s = "Guitare";
			break;
		}
		return s;
	};
	
	public static Loisirs toCaracteristiques(String nom) {
		Loisirs s = null;
		switch(nom) {
		case "Danse":
			s = DANSE ;
			break;
		case "Lecture":
			s = LECTURE;
			break;
		case "Cuisine":
			s = CUISINE ;
			break;
		case "Course":
			s = COURSE;
			break;
		case "Judo":
			s = JUDO;
			break;
		case "Escalade":
			s = Loisirs.ESCALADE;
			break;
		case "Jeux":
			s = Loisirs.JEUX;
			break;
		case "Violon":
			s = VIOLON;
			break;
		case "Piano":
			s = PIANO;
			break;
		case "Guitare":
			s = GUITARE;
			break;
		}
		return s;
	}
	
	public static int toInteger(String nom) {
		int s = 0;
		switch(nom) {
		case "Danse":
			s = 0 ;
			break;
		case "Lecture":
			s = 1;
			break;
		case "Cuisine":
			s = 2 ;
			break;
		case "Course":
			s = 3;
			break;
		case "Judo":
			s = 4;
			break;
		case "Escalade":
			s = 5;
			break;
		case "Jeux":
			s = 6;
			break;
		case "Violon":
			s = 7;
			break;
		case "Piano":
			s = 8;
			break;
		case "Guitare":
			s = 9;
			break;
		}
		return s;
	}
}
