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

@WebServlet("/stocks")
public class StockServlet extends HttpServlet {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/your_database";
    private static final String DB_USER = "root"; // Replace with your DB username
    private static final String DB_PASSWORD = "password"; // Replace with your DB password

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<StockItem> stockList = new ArrayList<>();

        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement statement = connection.prepareStatement("SELECT * FROM stocks");
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                StockItem item = new StockItem();
                item.setId(resultSet.getInt("id"));
                item.setName(resultSet.getString("name"));
                item.setQuantity(resultSet.getInt("quantity"));
                item.setPrice(resultSet.getDouble("price"));
                stockList.add(item);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        // Set the stock list as a request attribute
        request.setAttribute("stockList", stockList);

        // Forward the request to stocks.jsp
        RequestDispatcher dispatcher = request.getRequestDispatcher("stocks.jsp");
        dispatcher.forward(request, response);
    }
}