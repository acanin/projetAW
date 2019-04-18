package pack;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Centre {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	//private String nom;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Centre(){
		
	}
}