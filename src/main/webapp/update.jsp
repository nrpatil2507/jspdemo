<%@page import="tables.Contact"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="tables.Phone"%>
<%@page import="tables.Address"%>
<%@page import="javax.persistence.*"%>
<%@page import="tables.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("pus");
		EntityManager em = emf.createEntityManager();
		
		Person per;
		List<Phone> p=new ArrayList<Phone>();
		Address address;
		if (request.getParameter("person_id")!= null) {
			em.getTransaction().begin();
			per = em.find(Person.class, Integer.parseInt(request.getParameter("person_id")));
			session.setAttribute("per",per);
			address = per.getAddress();
			p=per.getPhone();
			for(Phone phone:p)
			{
			Contact c=phone.getContact();
	%>


	<form method="post">
		<%@include file="home.jsp"%>
		<table border=1 width="500px" align="center">
			<tr>
				<th colspan="2">Person Details Update</th>
			<tr>
				<td>First Name</td>
				<td><input type="text" name="fname"
					value="<%out.print(per.getFname());%>" /></td>
			</tr>
			<tr>
				<td>Last Name</td>
				<td><input type="text" name="lname"
					value="<%out.print(per.getLname());%>" /></td>
			</tr>
			<tr>
				<td>Email</td>
				<td><input type="text" name="email"
					value="<%out.print(per.getEmail());%>" /></td>
			</tr>

			<tr>
				<td>Address</td>
				<td>
					<table>
						<tr>
							<td>Ploat No.</td>
							<td><input type="text" name="ploatno"
								value="<%out.print(address.getPlotNo());%>" /></td>
						</tr>
						<tr>
							<td>Area Name.</td>
							<td><input type="text" name="area"
								value="<%out.print(address.getStreet());%>" /></td>
						</tr>
						<tr>
							<td>City.</td>
							<td><input type="text" name="city"
								value="<%out.print(address.getCity());%>" /></td>
						</tr>
						<tr>
							<td>State.</td>
							<td><input type="text" name="state"
								value="<%out.print(address.getState());%>" /></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>Contact Detail</td>
				<td>
					<table>
						<tr>
							<td>Phone type</td>
							<td><input type="text" name="pt"
								value="<%out.print(phone.getPhone_type());%>" /></td>
						</tr>
						<tr>
							<td>Service Provider</td>
							<td><input type="text" name="sr"
								value="<%out.print(phone.getService_provider());%>" /></td>
						</tr>
						<tr>
							<td>Contact no</td>
							<td><input type="text" name="cno"
								value="<%out.print(c.getCno());%>" /></td>
						</tr>
			<%} %>			
					</table>
				</td>
			</tr>

			<tr>
				<td>
				<td><input type="submit" name="update" value="Update" /> <input
					type="reset" name="reset" value="reset" /></td>
				</td>

			</tr>
		</table>
	</form>
</body>
</html>


<%
	}
%>

<%
	if (request.getParameter("update") != null) {
		per=(Person)session.getAttribute("per");
		address = per.getAddress();
		
		out.println(per.getEmail());
		
			
			per.setFname(request.getParameter("fname"));
			per.setLname(request.getParameter("lname"));
			
			per.setEmail(request.getParameter("email"));

			
			address.setPlotNo(Integer.parseInt(request.getParameter("ploatno")));
			address.setStreet(request.getParameter("area"));
			address.setCity(request.getParameter("city"));
			address.setState(request.getParameter("state"));
			
			em.persist(address);
			per.setAddress(address);
			
			List<Phone> ph = per.getPhone();
			for (Phone phone : ph) {
				phone.setPhone_type(request.getParameter("pt"));
				phone.setService_provider(request.getParameter("sr"));
				Contact c1 = phone.getContact();
				c1.setCno(request.getParameter("cno"));
				em.persist(phone);
				em.persist(c1);

			}
				
			em.persist(per);
			
			em.getTransaction().commit();
			em.close();
			emf.close();
			response.sendRedirect("Display.jsp");
			out.println("<script>alert('Update successful')</script>");
		
	}
%>
</body>
</html>