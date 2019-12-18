<%@page import="tables.Person"%>
<%@page import="javax.persistence.*"%>

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
if(request.getParameter("person_id")!=null)
{
	EntityManagerFactory emf = Persistence.createEntityManagerFactory("pus");
	EntityManager em = emf.createEntityManager();
	
	em.getTransaction().begin();
	
	Person per =em.find(Person.class,Integer.parseInt(request.getParameter("person_id")));
	if(per!=null)
	{
		em.remove(per);
	}
	
	em.getTransaction().commit();
	
	em.close();
	emf.close();
	response.sendRedirect("Display.jsp");
}
%>
</body>
</html>