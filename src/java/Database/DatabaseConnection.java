package Database;

/**
 *
 * @author chss
 */
import java.sql.*;

public class DatabaseConnection {

    private Connection con = null;
    private String url = "jdbc:postgresql://10.61.51.27:5432/AWS";
    private String username = "postgres";
    private String password = "postgres";
    private Statement stat = null;
    private ResultSet rs = null;

    public Connection openConnection() {
        try {
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection(url, username, password);
        } catch (Exception e) {
            System.out.println("Error : Can't Make Database Connection.");
        }
        return con;
    }
    
    public void insertData(String query) {
        try {
            stat = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            stat.executeUpdate(query);
        } catch (Exception e) {
            System.out.println("Error : Data Can't Insert Sucessfully.");
        }
    }

    public ResultSet fetchData(String query) {
        try {
            stat = con.createStatement();
            rs = stat.executeQuery(query);
        } catch (Exception e) {
            System.out.println("Error : Data Can't Retrive Sucessfully.");
        }
        return rs;
    }

    public void closeConnection() {
        try {
            con.close();
        } catch (Exception e) {
            System.out.println("Error : Database Connection Can't Close Sucessfully.");
        }
    }
}
