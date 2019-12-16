package demo;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;


public class Main{
	public static void main(String args[]){
		
		Address ad=new Address();
		ad.setPlotNo(153);
		ad.setStreet("aaspass nagar-1");
		ad.setCity("surat");
		ad.setState("gujrat");
		
		Phone p=new Phone();
		p.setPhone_type("smartphone");
		p.setService_provider("idea");

		Person per=new Person();
		per.setFname("nutan");
		per.setLname("patil");
		per.setEmail("nutanpatil110@gmail.com");
		
		per.setAddress(ad);
		per.getPhone().add(p);
		ad.getPerson().add(per);
		p.setPerson(per);
		
		Contact c=new Contact();
		c.setCno("9714256465");
		p.setContact(c);
		
		EntityManagerFactory myf = Persistence.createEntityManagerFactory("pus");
		EntityManager em = myf.createEntityManager();
		
		em.getTransaction().begin();
		em.persist(ad);
		em.persist(per);
		em.persist(c);
		em.persist(p);
	
		em.getTransaction().commit();
	
	}
}



