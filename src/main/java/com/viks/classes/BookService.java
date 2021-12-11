package com.viks.classes;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BookService extends HttpServlet {

	Connection conn = null;
	PreparedStatement preparedStatment = null;

	// bookdetails

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String sql_insertbook = "insert into bookdetails(id, name, authorname, authoremail, genre, year) VALUES (?,?,?,?,?,?)";

		String bookName = req.getParameter("bookname");
		String authorname = req.getParameter("authorname");
		String email = req.getParameter("email");
		String genre = req.getParameter("genre");
		String year = req.getParameter("year");

		PrintWriter out = resp.getWriter();

		// out.print(bookName + " " + authorname + " " + email + " " + genre + " " +
		// year);
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");

			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Bookstore", "root", "yourpassword");
			preparedStatment = conn.prepareStatement(sql_insertbook);
			
			Random random = new Random();
			int nextnumber = random.nextInt(2000000);
			
			preparedStatment.setInt(1, nextnumber);
			preparedStatment.setString(2, bookName);
			preparedStatment.setString(3, authorname);
			preparedStatment.setString(4, email);
			preparedStatment.setString(5, genre);
			preparedStatment.setString(6, year);
			
			int rows= preparedStatment.executeUpdate();
			System.out.println(rows + " affected");
			

		} catch (SQLException sq) {
			sq.printStackTrace();
		} catch (ClassNotFoundException cnf) {
			cnf.printStackTrace();
		}

	}

}
