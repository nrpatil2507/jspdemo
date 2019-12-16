package operation;

import java.util.List;
import java.util.Scanner;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import tables.Address;
import tables.Contact;
import tables.Person;
import tables.Phone;

public class Crud {

public static void main(String args[]){
		
		int ch;
		@SuppressWarnings("resource")
		Scanner input = new Scanner(System.in);
		
		EntityManagerFactory myf = Persistence.createEntityManagerFactory("pus");
		EntityManager em = myf.createEntityManager();
		
		do {
		
		System.out.println("1.Insert");
		System.out.println("2.update");
		System.out.println("3.delete");
		System.out.println("4.display");
		System.out.println("5.exit");
		
		System.out.println("enter your choice:-");		
		ch=input.nextInt();
		
		switch (ch) {
		case 1:
			System.out.println("enter a firstname:-");
			String fname=input.next();
			
			System.out.println("enter a Lastname:-");
			String lname=input.next();
			
			System.out.println("enter a email:-");
			String mail=input.next();
			
			Person per=new Person();
			per.setFname(fname);
			per.setLname(lname);
			per.setEmail(mail);
			
			
		
			System.out.println("enter a address");

			System.out.println("1.reference address");
			System.out.println("2.new address");
			System.out.println("enter a no for add:-");
			int cho=input.nextInt();
			if(cho==1)
			{
				Query q=em.createQuery("from Address");
				@SuppressWarnings("unchecked")
				List<Address> ad1= q.getResultList();
				
				System.out.println("aid\tplotno\tarea\tcity\tstate");
				
				for (Address address : ad1) {
					System.out.print(address.getAid()+"\t");
					System.out.print(address.getPlotNo()+"\t");
					System.out.print(address.getStreet()+"\t");
					System.out.print(address.getCity()+"\t");
					System.out.print(address.getState()+"\n");
				}
				System.out.println("enter a address id:-");
				int aid=input.nextInt();
				
				Address adno=em.find(Address.class,aid);
				per.setAddress(adno);
				
			}
			else
			{
				
				Address ad=new Address();
				System.out.println("enter a plotno:-");
				int pn=input.nextInt();
			
				System.out.println("enter a area:-");
				String area=input.next();
			
				System.out.println("enter a city:-");
				String city=input.next();
			
				System.out.println("enter a state:-");
				String state=input.next();
		
				ad.setPlotNo(pn);
				ad.setStreet(area);
				ad.setCity(city);
				ad.setState(state);
				per.setAddress(ad);
				em.persist(ad);
			}		
			
			System.out.println("enter a phone type:-");
			String pt=input.next();
			
			System.out.println("enter a service provider:-");
			String sr=input.next();
			
			System.out.println("enter a contact no:-");
			String mob=input.next();
			
			
			Contact c=new Contact();
			c.setCno(mob);
			
			Phone p=new Phone();
			p.setPhone_type(pt);
			p.setService_provider(sr);
			p.setContact(c);
			p.getPerson().add(per);
			per.getPhone().add(p);

			
			em.getTransaction().begin();
			
			em.persist(per);
			em.persist(c);
			em.persist(p);
		
			em.getTransaction().commit();
			
			break;
		case 3:
			System.out.println("enter a person id for deletion:-");
			int did=input.nextInt();
			em.getTransaction().begin();
			Person pno=em.find(Person.class,did);
			em.remove(pno);
			em.getTransaction().commit();
			System.out.println("deleted Successfully!!");
			break;

		case 4:
			System.out.println("enter a person id:-");
			int pid=input.nextInt();
			System.out.println("fname\tlname\temail\t\tplotno\tarea\tcity\tstate\tphonetype\tservice_provider\tcontactno");
			Person p1=em.find(Person.class, pid);
			System.out.print(p1.getFname()+"\t");
			
			System.out.print(p1.getLname()+"\t");
			System.out.print(p1.getEmail()+"\t\t");
			
			Address address=p1.getAddress();
			System.out.print(address.getPlotNo()+"\t");
			System.out.print(address.getStreet()+"\t");
			System.out.print(address.getCity()+"\t");
			System.out.print(address.getState()+"\t");
			
			List<Phone> ph=p1.getPhone();
			for (Phone phone : ph) {
				System.out.print(phone.getPhone_type()+"\t\t");
				System.out.print(phone.getService_provider()+"\t\t");
				
				Contact ch2=phone.getContact();
				System.out.print(ch2.getCno()+"\n");
				
			}
			break;
		case 5:
			
		break;
			
		default:
			break;
		}
		
		}while(ch!=5);
		
	}

}
