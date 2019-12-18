<%@page import="tables.Address"%>
<%@page import="tables.Person"%>
<%@page import="java.util.List"%>
<%@page import="javax.persistence.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Person Data</title>
</head>
<body>
<%@ include file="home.jsp" %>
<% 
EntityManagerFactory myf = Persistence.createEntityManagerFactory("pus");
EntityManager em = myf.createEntityManager();

Query q1 = em.createQuery("from Person",Person.class);
List<Person> data1 = q1.getResultList();
%>

	<table border="1" align="center" width="500px">
	<tr>
	<th>Fname</th>
	<th>Lname</th>
	<th>email</th>
	<th>Address</th>
	<th>Update</th>
	<th>Delete</th>	
	</tr>
	<% 
		for (Person person : data1) {
			Address as = person.getAddress();
	%>
	<tr>
	<td><% out.print(person.getFname()); %></td>
	<td><% out.println (person.getLname()); %></td>
	<td><% out.println (person.getEmail()); %></td>
	<td><% out.println (as.getPlotNo()+" "+as.getStreet()+" "+as.getCity()); %></td>
	<td><% out.println("<a href='update.jsp?person_id="+person.getPid()+"'>");%>Update</td>
	<td><% out.println("<a href='delete.jsp?person_id="+person.getPid()+"'>");%>Delete</td>
	<%} %>
	</tr>	
	
	</table>

</body>
</html>