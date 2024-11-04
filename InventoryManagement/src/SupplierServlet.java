import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/suppliers")
public class SupplierServlet extends HttpServlet {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/your_database";
    private static final String DB_USER = "root"; // Replace with your DB username
    private static final String DB_PASSWORD = "password"; // Replace with your DB password

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Supplier> supplierList = new ArrayList<>();

        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement statement = connection.prepareStatement("SELECT * FROM suppliers");
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                Supplier supplier = new Supplier();
                supplier.setId(resultSet.getInt("id"));
                supplier.setName(resultSet.getString("name"));
                supplier.setContactPerson(resultSet.getString("contact_person"));
                supplier.setPhone(resultSet.getString("phone"));
                supplier.setEmail(resultSet.getString("email"));
                supplierList.add(supplier);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        // Set the supplier list as a request attribute
        request.setAttribute("supplierList", supplierList);

        // Forward the request to suppliers.jsp
        RequestDispatcher dispatcher = request.getRequestDispatcher("suppliers.jsp");
        dispatcher.forward(request, response);
    }
}