package com.bcits.myproperties.common;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class FindEmployee {
	public static void main(String[] args) {

		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			FileInputStream fileInputStream = new FileInputStream("dbInfo.properties");
			Properties properties = new Properties();
			properties.load(fileInputStream);

			// step 1 load the driver
			Class.forName(properties.getProperty("drivername")).newInstance();

			// step 2 get connection via driver
			con = DriverManager.getConnection(properties.getProperty("dbUrl"), properties.getProperty("user"),
					properties.getProperty("password"));

			// step 3: issue sql query via connection
			String query = " select * from employee_primary_info " + " where empid = 20 ";
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			while (rs.next()) {
				int employeeId = rs.getInt("empid");
				String name = rs.getString("name");
				long mobileNo = rs.getLong("mobileno");
				String mailId = rs.getString("official_maildid");
				Date date_of_birth = rs.getDate("date_of_birth");
				Date joined_on = rs.getDate("date_of_joining");
				String designation = rs.getString("designation");
				String blood_group = rs.getString("blood_group");
				double salary = rs.getDouble("salary");
				int deptId = rs.getInt("deptid");
				int managerId = rs.getInt("mgrid");

				System.out.println("id        ======> " + employeeId);
				System.out.println("name      ======> " + name);
				System.out.println("mobile no ======> " + mobileNo);
				System.out.println("mail id   ======> " + mailId);
				System.out.println("DOB       ======> " + date_of_birth);
				System.out.println("joining date ===> " + joined_on);
				System.out.println("desgination  ===> " + designation);
				System.out.println("blood group ====> " + blood_group);
				System.out.println("salary    ======> " + salary);
				System.out.println("dept Id   ======> " + deptId);
				System.out.println("manager id ====> " + managerId);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// step 5 : close all jdbc objects
			try {
				if (con != null) {
					con.close();
				}
				if (stmt != null) {
					stmt.close();
				}
				if (rs != null) {
					rs.close();

				}
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}
	}
}
