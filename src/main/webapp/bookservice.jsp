<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*"%>

<% Class.forName("com.mysql.cj.jdbc.Driver"); %>
<!DOCTYPE html>
<html>
<head>
  <title>My Bookstore</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

<%
Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/Bookstore", "root","yourpassword");
String sql_getbooks = "SELECT name, authorname, authoremail, genre, year FROM bookdetails";
Statement stmt = connection.createStatement();
ResultSet resultSet = stmt.executeQuery(sql_getbooks);
%>

<a href = "computer-programming.html">Show me Computer Programming Books</a>

<div class="container">
		<h2>List of Books</h2>
		<p>A simple and Beautiful display of good books</p>
		<table class="table table-striped w-auto">
			<thead>
				<tr>
					<th>Book Name</th>
					<th>Author's Name</th>
					<th>Email</th>
					<th>Genre</th>
					<th>Year</th>
				</tr>
			</thead>
			<tbody>
				<% while(resultSet.next()){ %>
				<tr class="table-info">
					<td><%= resultSet.getString(1)%></td>
					<td><%= resultSet.getString(2) %></td>
					<td><%= resultSet.getString(3) %></td>
					<td><%= resultSet.getString(4) %></td>
					<td><%= resultSet.getString(5) %></td>
				</tr>
				<% } %>
			</tbody>
		</table>
	</div>

</body>
</html>