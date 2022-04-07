package controller;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBProduct {

    
    static String DATABASE_NAME = "assignmenttesting";
    static String USERNAME = "nbuser";
    static String PASSWORD = "nbuser";

    public static Connection getConnection() {
        Connection con = null;
        try {
           
            con = DriverManager.getConnection("jdbc:derby://localhost:1527/assignmenttesting", USERNAME, PASSWORD);
        } catch (Exception e) {
            System.out.println(e);
            e.printStackTrace();
        }
        return con;
    }
}