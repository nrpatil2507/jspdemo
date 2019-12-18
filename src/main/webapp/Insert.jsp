<%@page import="java.util.List"%>
<%@page import="tables.Phone"%>
<%@page import="tables.Contact"%>
<%@page import="tables.Address"%>
<%@page import="tables.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.persistence.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>InsertData</title>
</head>
<body>
	<%@include file="home.jsp" %>
	<form>
		<table border=1 width="500px" align="center">
		<tr>
			<th colspan="2">Person Details Insert</th>
		<tr>
			<td>First Name</td>
			<td><input type="text" name="fname" /></td>
		</tr>
		<tr>
			<td>Last Name</td>
			<td><input type="text" name="lname" /></td>
		</tr>
		<tr>
			<td>Email</td>
			<td><input type="text" name="email" /></td>
		</tr>
		<tr>
			<td>Address</td>
			<td><input type="radio" name="radio_add" value="add_ref" checked />Address
				Reference <%
				EntityManagerFactory emf=Persistence.createEntityManagerFactory("pus");
				EntityManager em=emf.createEntityManager();
				Query q = em.createQuery("from Address", Address.class);
				List<Address> adr = q.getResultList();
				out.println("<select name='aid'>");
				for (Address address : adr) {
					out.println("<option value=" + address.getAid() + "> " + address.getPlotNo() + "-"
							+ address.getStreet() + "-" + address.getCity() + "-" + address.getState()+" </option> ");
				}
				out.println("</select>");
			%></td>
		</tr>
		<tr>
			<td>Address</td>
			<td><input type="radio" name="radio_add"  value="add_new" />New Address
				<table>
					<tr>
						<td>Ploat No.</td>
						<td><input type="text" name="ploatno" /></td>
					</tr>
					<tr>
						<td>Area Name.</td>
						<td><input type="text" name="area" /></td>
					</tr>
					<tr>
						<td>City.</td>
						<td><input type="text" name="city" /></td>
					</tr>
					<tr>
						<td>State.</td>
						<td><input type="text" name="state" /></td>
					</tr>
				</table>
		</tr>
		<tr>
			<td>Contact Detail</td>
			<td>
				<table>
					<tr>
						<td>Phone Type</td>
						<td><input type="text" name="ptype" /></td>
					</tr>
					<tr>
						<td>Service Provider</td>
						<td><input type="text" name="sr" /></td>
					</tr>
					<tr>
						<td>Contact No.</td>
						<td><input type="text" name="cno" /></td>
					</tr>
				</table>
				</td>
		</tr>
		<tr>
			<td></td><td><input type="submit" name="submit" value="insert" />
			<input type="reset" name="reset" value="reset" /></td>

		</tr>
	</table>
	</form>
</body>
</html>

<%
if(request.getParameter("submit")!=null)
{
	
	em.getTransaction().begin();	
	Person per=new Person();
	per.setFname(request.getParameter("fname"));
	per.setLname(request.getParameter("lname"));
	
	per.setEmail(request.getParameter("email"));
	if(request.getParameter("radio_add").equals("add_ref"))
	{
		int address_id = Integer.parseInt(request.getParameter("aid"));
		out.println(address_id);
		
		Address address1=em.find(Address.class,address_id);
		per.setAddress(address1);
		
	}
	if(request.getParameter("radio_add").equals("add_new"))
	{
		Address address1=new Address();
		address1.setPlotNo(Integer.parseInt(request.getParameter("ploatno")));
		address1.setStreet(request.getParameter("area"));
		address1.setCity(request.getParameter("city"));
		address1.setState(request.getParameter("state"));
		
		
		em.persist(address1);
		
		per.setAddress(address1);
	}
	Contact c = new Contact();
	c.setCno(request.getParameter("cno"));

	Phone p = new Phone();
	p.setPhone_type(request.getParameter("ptype"));
	p.setService_provider(request.getParameter("sr"));
	
	p.setContact(c);
	p.getPerson().add(per);
	per.getPhone().add(p);
	em.persist(per);
	em.persist(c);
	em.persist(p);
	
	em.getTransaction().commit();
	em.close();
	emf.close();
	
	out.println("<script>alert('data added successful')</script>");
	
}
%>
</body>
</html>