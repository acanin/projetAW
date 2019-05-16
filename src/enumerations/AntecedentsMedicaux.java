package enumerations;

public enum AntecedentsMedicaux {
	FAUSSE_COUCHE,
	ASTHME,
	DIABETE,
	TROUBLE_CARDIAQUE,
	CANCER,
	PARKINSON,
	ALZHEIMER,
	SIDA,
	AUCUN;
	
public static final AntecedentsMedicaux[] allantmed = AntecedentsMedicaux.values();
	
	public static String toString(AntecedentsMedicaux c){
		String s = null;
		switch(c) {
		case FAUSSE_COUCHE:
			s = "Fausse couche";
			break;
		case ASTHME:
			s = "Asthme";
			break;
		case DIABETE:
			s = "Diabete";
			break;
		case PARKINSON:
			s = "Parkinson";
			break;
		case TROUBLE_CARDIAQUE:
			s = "Trouble cardiaque";
			break;
		case ALZHEIMER:
			s = "Alzheimer";
			break;
		case SIDA:
			s = "Sida";
			break;
		case CANCER:
			s = "Cancer";
			break;
		case AUCUN:
			s = "Aucun";
		}
		return s;
	};
	
	public static AntecedentsMedicaux toCaracteristiques(String nom) {
		AntecedentsMedicaux s = null;
		switch(nom) {
		case "Trouble cardiaque":
			s = TROUBLE_CARDIAQUE;
			break;
		case "Asthme":
			s = ASTHME;
			break;
		case "Diabete":
			s = DIABETE;
			break;
		case "Parkinson":
			s = PARKINSON;
			break;
		case "Cancer":
			s = CANCER;
			break;
		case "Alzheimer":
			s = ALZHEIMER ;
			break;
		case "Sida":
			s = SIDA;
			break;
		case "Fausse couche":
			s = FAUSSE_COUCHE;
			break;
		case "Aucun":
			s = AUCUN;
		}
		return s;
	}
	
	public static int toInteger(String nom) {
		int s = 0;
		switch(nom) {
		case "Trouble cardiaque":
			s = 0;
			break;
		case "Asthme":
			s = 1;
			break;
		case "Diabete":
			s = 2;
			break;
		case "Parkinson":
			s = 3;
			break;
		case "Cancer":
			s = 4;
			break;
		case "Alzheimer":
			s = 5 ;
			break;
		case "Sida":
			s = 6;
			break;
		case "Fausse couche":
			s = 7;
			break;
		case "Aucun":
			s = 8;
			break;
		}
		return s;
	}
	
}
