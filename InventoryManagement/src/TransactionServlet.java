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

@WebServlet("/transactions")
public class TransactionServlet extends HttpServlet {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/your_database";
    private static final String DB_USER = "root"; // Replace with your DB username
    private static final String DB_PASSWORD = "password"; // Replace with your DB password

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Transaction> transactionList = new ArrayList<>();

        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement statement = connection.prepareStatement("SELECT t.id, s.name AS stockName, su.name AS supplierName, t.quantity, t.transaction_date AS transactionDate " +
                     "FROM transactions t " +
                     "JOIN stocks s ON t.stock_id = s.id " +
                     "JOIN suppliers su ON t.supplier_id = su.id");
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                Transaction transaction = new Transaction();
                transaction.setId(resultSet.getInt("id"));
                transaction.setStockName(resultSet.getString("stockName"));
                transaction.setSupplierName(resultSet.getString("supplierName"));
                transaction.setQuantity(resultSet.getInt("quantity"));
                transaction.setTransactionDate(resultSet.getDate("transactionDate"));
                transactionList.add(transaction);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        // Set the transaction list as a request attribute
        request.setAttribute("transactionList", transactionList);

        // Forward the request to transactions.jsp
        RequestDispatcher dispatcher = request.getRequestDispatcher("transactions.jsp");
        dispatcher.forward(request, response);
    }
}