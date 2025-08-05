<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
  <meta charset="utf-8">
  <script src="https://kit.fontawesome.com/c85d62c8b6.js"></script>
  <title>Web programming</title>
  <link rel="stylesheet" href="../css/style1.css">
</head>

<body>


<!-- Java code handling signup action -->
<%@ page import="java.sql.*" %>

<%
    String Name = "";
    try {
        String id = request.getParameter("signup-id");
        String password = request.getParameter("signup-password");
        String email = request.getParameter("signup-email");
        String phone_number = request.getParameter("signup-phone-number");
        String name = request.getParameter("signup-name");
		//connect to website's database
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/websitedb?" + "user=root&password=root");


        PreparedStatement checkDuplicateId = conn.prepareStatement("SELECT id FROM users WHERE id = ?");
        checkDuplicateId.setString(1, id);
        ResultSet rsDuplicateId = checkDuplicateId.executeQuery();
		//check ID dulplicated
        if (rsDuplicateId.next()) {
           	%>
        	<script>
        	    alert("ID already exists. Please choose a different ID.");
        	    window.location.href = "signup.jsp";
        	</script>
        	<%
 
        } else {

            PreparedStatement insertUser = conn.prepareStatement("INSERT INTO users (id, password, email, phone_number, name) VALUES (?, ?, ?, ?, ?)");
            insertUser.setString(1, id);
            insertUser.setString(2, password);
            insertUser.setString(3, email);
            insertUser.setString(4, phone_number);
            insertUser.setString(5, name);

            int rowsAffected = insertUser.executeUpdate();

            if (rowsAffected > 0) {
         
               	%>
            	<script>
            	    alert("Sign up Sucess!");
            	    window.location.href = "signin.jsp";
            	</script>
            	<%
                
            } else {
               	%>
            	<script>
            	    alert("Sign up Failed");
            	    window.location.href = "signup.jsp";
            	</script>
            	<%

            }
        }

    } catch (Exception e) {
        out.println("Something went wrong !! Please try again");
        out.println(e);
    }
%>






<div>Welcome, you logined as <%=Name%></div>

</body>

</html>