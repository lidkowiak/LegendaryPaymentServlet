package pl.warsjawa.legacycode;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PaymentSerice {

    public List<Transaction> findTransactionsByPaymentId(String paymentId) {

        Connection conn = null;

        try {

            conn = getConnection();
            PreparedStatement statement = conn.prepareStatement("select * from TRANSACTION where PAYMENT_ID = ?");
            statement.setString(1, paymentId);
            ResultSet rs = statement.executeQuery();

            List<Transaction> result = new ArrayList<>();

            while (rs.next()) {

                result.add(getTransactionFromResultSet(rs));
            }

            return result;

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close(conn);
        }

    }

    private void close(Connection conn) {

        try {
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
            // ignore
        }

    }

    private Transaction getTransactionFromResultSet(ResultSet rs) throws SQLException {

        Transaction transaction = new Transaction();
        transaction.setId(rs.getLong("id"));
        transaction.setActive(rs.getBoolean("active"));
        transaction.setContactEmail(rs.getString("contact_email"));
        transaction.setContactPerson(rs.getString("contact_person"));
        transaction.setPaymentId(rs.getString("payment_id"));
        return transaction;
    }

    public Transaction findTransactionById(long transactionId) {

        Connection conn = null;

        try {

            conn = getConnection();
            PreparedStatement statement = conn.prepareStatement("select * from TRANSACTION where ID = ?");
            statement.setLong(1, transactionId);
            ResultSet rs = statement.executeQuery();

            if (rs.next()) {
                return null;
            }

            return getTransactionFromResultSet(rs);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close(conn);
        }

    }

    public void setInactiveTransaction(Transaction transaction) {

        Connection conn = null;

        try {

            conn = getConnection();
            PreparedStatement statement = conn.prepareStatement("update TRANSACTION set ACTIVE=? where ID = ?");
            statement.setBoolean(1, false);
            statement.setLong(2, transaction.getId());

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close(conn);
        }
    }

    public Payment findPaymentById(String paymentId) {
        
        Connection conn = null;

        try {

            conn = getConnection();
            PreparedStatement statement = conn.prepareStatement("select * from PAYMENT where ID = ?");
            statement.setString(1, paymentId);
            ResultSet rs = statement.executeQuery();

            if (rs.next()) {
                return null;
            }

            return getPaymentFromResultSet(rs);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close(conn);
        }
    }

    private Payment getPaymentFromResultSet(ResultSet rs) throws SQLException {
        
        Payment payment = new Payment();
        payment.setId(rs.getString("id"));
        payment.setState(rs.getString("status"));
        payment.setAmount(rs.getInt("amount"));
        
        return payment;
    }

    public void updatePayment(Payment payment) {
       
        Connection conn = null;

        try {

            conn = getConnection();
            PreparedStatement statement = conn.prepareStatement("update PAYMENT set STATUS=?, AMOUNT=? where ID = ?");
            statement.setString(1, payment.getState());
            statement.setInt(2, payment.getAmount());
            statement.setString(3, payment.getId());

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close(conn);
        }
    }

    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection("jdbc:h2:tcp://localhost:9092//tmp/payments", "prod", "topsecret");
    }
}
