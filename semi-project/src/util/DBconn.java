package util;


	import java.sql.Connection;
	import javax.naming.Context;
	import javax.naming.InitialContext;
	import javax.sql.DataSource;


	public class DBconn {
		
		private Connection conn;
		
		public DBconn() {
			try {
				Context initContext = new InitialContext();
				Context envContext  = (Context)initContext.lookup("java:/comp/env");
				DataSource ds = (DataSource)envContext.lookup("jdbc/myoracle");
				conn = ds.getConnection();
				System.out.println("접속성공");
			}catch(Exception e){
				e.printStackTrace();
			}

		}public Connection getConn() {
			return conn;
		}
	}


