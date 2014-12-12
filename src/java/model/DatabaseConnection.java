
package model;

import java.sql.*;

public class DatabaseConnection {

    private String url = "jdbc:postgresql://10.61.51.27:5432/AWS";
    private String username = "postgres";
    private String password = "postgres";
    private Connection con = null;
    private Statement stmt = null;
    private ResultSet rs = null;
    private int noOfRowsAffected = 0;

    public Connection openConnection() {
        try {
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection(url, username, password);
        } catch (SQLException sqle) {
            System.out.println("Error in DatabaseConnection.openConnection() : " + sqle.getMessage());
        } catch (Exception e) {
            System.out.println("Error in DatabaseConnection.openConnection() : " + e.getMessage());
        }
        return con;
    }

    public ResultSet selectData(String query) {
        try {
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);
        } catch (SQLException sqle) {
            System.out.println("Error in DatabaseConnection.selectData() : " + sqle.getMessage());
        } catch (Exception e) {
            System.out.println("Error in DatabaseConnection.selectData() : " + e.getMessage());
        }
        return rs;
    }

    public int insertData(String query) {
        try {
            stmt = con.createStatement();
            noOfRowsAffected = stmt.executeUpdate(query);
        } catch (SQLException sqle) {
            System.out.println("Error in DatabaseConnection.insertData() : " + sqle.getMessage());
        } catch (Exception e) {
            System.out.println("Error in DatabaseConnection.insertData() : " + e.getMessage());
        }
        return noOfRowsAffected;
    }

    public int updateData(String query) {
        try {
            stmt = con.createStatement();
            noOfRowsAffected = stmt.executeUpdate(query);
        } catch (SQLException sqle) {
            System.out.println("Error in DatabaseConnection.updateData() : " + sqle.getMessage());
        } catch (Exception e) {
            System.out.println("Error in DatabaseConnection.updateData() : " + e.getMessage());
        }
        return noOfRowsAffected;
    }
    
    public void closeConnection() {
        try {
            rs.close();
            stmt.close();
            con.close();
        } catch (SQLException sqle) {
            System.out.println("Error in DatabaseConnection.closeConnection() : " + sqle.getMessage());
        } catch (Exception e) {
            System.out.println("Error in DatabaseConnection.closeConnection() : " + e.getMessage());
        }
    }
}
