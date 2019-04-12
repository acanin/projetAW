package enumerations;

public enum Loisirs {
	DANSE,
	LECTURE,
	CUISINE,
	COURSE,
	JUDO,
	ESCALADE,
	JEUX_VIDEO,
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
		case JEUX_VIDEO:
			s = "Jeux video";
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
		case "Jeux video":
			s = Loisirs.JEUX_VIDEO;
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
}
