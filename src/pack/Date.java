package pack;

public class Date {

	private Jour jour;
	private int date;
	private Mois mois;
	private int annee;
	
	

	public Date(Jour j, int d,Mois m, int a){
		this.jour = j;
		
		
		if(m == Mois.Janvier || m == Mois.Mars || m == Mois.Mai || m == Mois.Juillet || m == Mois.Aout || m == Mois.Octobre || m == Mois.Decembre ){
			assert(d<=31);
			assert(d>=1);
			this.mois = m;
			this.date = d;
	    }
		
		if(m == Mois.Fevrier){
			assert(d<=28);
			assert(d>=1);
			this.mois = m;
			this.date = d;
		}
		
		else{
			assert(d<=30);
			assert(d>=1);
			this.mois = m;
			this.date = d;
		}
		
		// On est en 2019 au minimum
		assert(a>= 2019);
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
