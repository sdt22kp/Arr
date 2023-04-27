package user.svc;

import java.sql.Connection;

import dao.UserDAO;

import static db.JdbcUtil.*;

import vo.User;

public class UserLoginService {

	public boolean login(String id, String user_pass) {
		boolean loginSuccess = false;
		Connection conn = null;
		UserDAO userDAO = UserDAO.getInstance();
		try {
			conn = getConnection();
			userDAO.setConnection(conn);
			String user_id = userDAO.selectLoginID(id, user_pass);
			if(user_id != null) {
				loginSuccess = true;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(conn);
		}
		
		
		return loginSuccess;
	}

}
