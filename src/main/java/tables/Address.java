package tables;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;



@Entity
public class Address {
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE)
	int aid;
	int plotNo;
	String street;
	String city;
	String state;
	
	public int getAid() {
		return aid;
	}
	public int getPlotNo() {
		return plotNo;
	}
	public void setPlotNo(int plotNo) {
		this.plotNo = plotNo;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getStreet() {
		return street;
	}
	public void setStreet(String street) {
		this.street = street;
	}
	
	

}
