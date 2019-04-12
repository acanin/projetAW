package pack;

public class Date {

	private Jour jour;
	private int date;
	private Mois mois;
	private int annee;
	
	

	public Date(Jour j, int d,Mois m, int a){
		this.jour = j;
		this.date = d;
		this.mois = m;
		this.annee = a;
	}
	
	
	
	
	public Jour getJour() {
		return jour;
	}



	public void setJour(Jour jour) {
		this.jour = jour;
	}



	public int getDate() {
		return date;
	}



	public void setDate(int date) {
		this.date = date;
	}



	public Mois getMois() {
		return mois;
	}



	public void setMois(Mois mois) {
		this.mois = mois;
	}



	public int getAnnee() {
		return annee;
	}



	public void setAnnee(int annee) {
		this.annee = annee;
	}



	
}
