package enumerations;

public enum AntecedentsMedicaux {
	CARDIAQUE,
	ASTHMATIQUE,
	DIABETIQUE,
	PARKINSON,
	AVC,
	ALZHEIMER,
	SIDA,
	FAUSSE_COUCHE;
	
public static final AntecedentsMedicaux[] allantmed = AntecedentsMedicaux.values();
	
	public static String toString(AntecedentsMedicaux c){
		String s = null;
		switch(c) {
		case CARDIAQUE:
			s = "Cardiaque";
			break;
		case ASTHMATIQUE:
			s = "Asthmatique";
			break;
		case DIABETIQUE:
			s = "Diabetique";
			break;
		case PARKINSON:
			s = "Parkison";
			break;
		case AVC:
			s = "AVC";
			break;
		case ALZHEIMER:
			s = "Alzheimer";
			break;
		case SIDA:
			s = "Sida";
			break;
		case FAUSSE_COUCHE:
			s = "Fausse Couche";
			break;
		}
		return s;
	};
	
	public static AntecedentsMedicaux toCaracteristiques(String nom) {
		AntecedentsMedicaux s = null;
		switch(nom) {
		case "Cardiaque":
			s = CARDIAQUE;
			break;
		case "Asthmatique":
			s = ASTHMATIQUE;
			break;
		case "Diabetique":
			s = DIABETIQUE;
			break;
		case "Parkison":
			s = PARKINSON;
			break;
		case "AVC":
			s = AVC;
			break;
		case "Alzheimer":
			s = ALZHEIMER ;
			break;
		case "Sida":
			s = SIDA;
			break;
		case "Fausse Couche":
			s = FAUSSE_COUCHE;
			break;
		}
		return s;
	}
	
}
