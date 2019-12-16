package tables;



import java.util.ArrayList;
import java.util.List;

import javax.persistence.*;


@Entity
public class Phone {

	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE)
	int phoneid;
	String phone_type;
	String service_provider;
	
	@OneToOne(cascade=CascadeType.REMOVE)
	Contact contact;
	
	@ManyToMany(cascade=CascadeType.REMOVE)
	List<Person> person=new ArrayList<Person>();
	
	
	public List<Person> getPerson() {
		return person;
	}
	public void setPerson(List<Person> person) {
		this.person = person;
	}
	public int getPhoneid() {
		return phoneid;
	}
	public void setPhoneid(int phoneid) {
		this.phoneid = phoneid;
	}
	public Contact getContact() {
		return contact;
	}
	public void setContact(Contact contact) {
		this.contact = contact;
	}
	public String getPhone_type() {
		return phone_type;
	}
	public void setPhone_type(String phone_type) {
		this.phone_type = phone_type;
	}
	public String getService_provider() {
		return service_provider;
	}
	public void setService_provider(String service_provider) {
		this.service_provider = service_provider;
	}
	

}
