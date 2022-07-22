package com.project.tour;

import java.sql.Connection;
import java.sql.DriverManager;


import java.sql.SQLException;

public class DBUtil {

        private static Connection conn = null;

        public static Connection open() {

            // 연결 문자열, Connection String > 접속 정보 문자열
            String url = "jdbc:oracle:thin:@172.16.11.215:1521:xe";
            String id = "projectAcc";
            String pw = "java1234";

            try {
                // JDBC 드라이버 로딩
                Class.forName("oracle.jdbc.driver.OracleDriver");

                conn = DriverManager.getConnection(url, id, pw);
                return conn;

            } catch (Exception e) {
                e.printStackTrace();
            }

            return null; // 접속 실패 시 반환값 null
        }

        // 오버로딩
        public static Connection open(String server, String id, String pw) {


            String url = "jdbc:oracle:thin:@" + server + ":1521:xe";

            try {
                // JDBC 드라이버 로딩
                Class.forName("oracle.jdbc.driver.OracleDriver");

                conn = DriverManager.getConnection(url, id, pw);
                return conn;

            } catch (Exception e) {
                e.printStackTrace();
            }

            return null; // 접속 실패 시 반환값 null
        }

        public static void close() {

            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
}

