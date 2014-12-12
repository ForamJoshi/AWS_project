
package Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author igis_test
 */
public class DBConnection 
{
    private Connection con = null;
    private Statement stat = null;
    private ResultSet rs = null;

    public Connection openConnection() {
        try {
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            con = DriverManager.getConnection("jdbc:odbc:AWS");
        } catch (Exception e) {
            System.out.println("Error in Class ==> DatabaseConnection, Method ==> openConnection() " + e.toString());
        }
        return con;
    }

    public void insertData(String query) {
        try {
            stat = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            stat.executeUpdate(query);
        } catch (Exception e) {
            System.out.println("Error in Class ==> DatabaseConnection, Method ==> insertData() " + e.toString());
        }
    }

    public ResultSet selectData(String query) {
        try {
            stat = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            rs = stat.executeQuery(query);
        } catch (Exception e) {
            System.out.println("Error in Class ==> DatabaseConnection, Method ==> fetchData() " + e.toString());
        }
        return rs;
    }

    public void closeConnection() {
        try {
            con.close();
        } catch (Exception e) {
            System.out.println("Error in Class ==> DatabaseConnection, Method ==>closeConnection() " + e.toString());
        }
    }
}
