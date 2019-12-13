package demo;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;


public class Main{
	public static void main(String args[]){
		Contact c=new Contact();
		c.setCname("nutan");
		c.setCno("9714256465");
		
		EntityManagerFactory myf = Persistence.createEntityManagerFactory("pus");
		EntityManager em = myf.createEntityManager();
		
		em.getTransaction().begin();
		
		em.persist(c);
		em.getTransaction().commit();
	
	}
}



