<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="org.hibernate.*,
    org.hibernate.cfg.Configuration,
    java.util.*, com.niit.hiibernate.web.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
  <%Configuration cfg= new Configuration();
    cfg.configure("hibernate.cfg.xml");
    
    SessionFactory factory = cfg.buildSessionFactory();
    Session sess= factory.openSession();
    sess.beginTransaction();
    
    Query query = sess.createQuery("from User");
    List<User> List= (List<User>) query.list();
    out.println("List of Employees::"+"<br>");
    
    for(User st:List)
    {
    	out.println(st.getId()+", "+st.getName()+", "+st.getEmail()+"<br>");
    }
    out.println("<br>");
    
    String hql="select U.name from User U ";
    query= sess.createQuery(hql);
    List<String> List1= query.list();
    out.println("List of Names::"+"<br>");
    for(String st:List1)
     {
    	out.println(st+"<br>");
     }
    out.println("<br>");
    
   query = sess.createQuery("select count(*) from User");
    List<Integer> List2=  query.list();
    out.println("Total Names::"+"<br>");
    out.println(List2.get(0) +"<br>");
    out.println("<br>");
    
    query = sess.createQuery("from User U where U.NAME=:id");
    query.setInteger("id",2);
    List<User> List3=(List<User>) query.list();
    out.println("Employee list with criteria::"+"<br>");
    for(User st:List3)
    {
    	out.println(st.getId()+", "+st.getName()+", "+st.getEmail()+"<br>");
    }
   sess.getTransaction().commit();
   sess.close();
   factory.close();
   
  %>
  

</body>
</html>