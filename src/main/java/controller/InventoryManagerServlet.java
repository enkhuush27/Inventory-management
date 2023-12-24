package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.SqlConnection;
import model.Product;

@WebServlet("/")
public class InventoryManagerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ArrayList<Product> inventory = new ArrayList<>();
	private SqlConnection connection;

	public void init() {
		connection = new SqlConnection();
	}
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
      String action = request.getServletPath();
      
      if(action == "/update") {
    	  String supplierName = request.getParameter("supplierName");
          String itemName = request.getParameter("itemName");
          double price = Double.parseDouble(request.getParameter("price"));
    	  Product item = new Product();
          
          item.setName(itemName);
          item.setPrice(price);

          inventory.add(item);
          
          String jdbcUrl = "jdbc:mysql://localhost:3306/inventory";
          String username = "root";
          String password = "Enkhuush1217";

          try (Connection conn = DriverManager.getConnection(jdbcUrl, username, password)) {
              String sql = "INSERT INTO product (name, price) VALUES (?, ?)";
              PreparedStatement statement = conn.prepareStatement(sql);
              statement.setString(2, itemName);
              statement.setDouble(3, price);
              statement.executeUpdate();
          } catch (SQLException e) {
              e.printStackTrace();
          }
          request.getRequestDispatcher("product.jsp");
      }
        
    }
}
