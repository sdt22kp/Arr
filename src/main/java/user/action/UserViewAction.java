package user.action;

import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import user.svc.UserViewService;
import vo.ActionForward;
import vo.User;

public class UserViewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=null;
		HttpSession session = request.getSession();
		String id=(String)session.getAttribute("id");
		if(id==null) {
			forward = new ActionForward("userLogin.u",true);
		}
		id=request.getParameter("id");
		UserViewService userViewService = new UserViewService();//서비스 만들어주고
		User user = userViewService.selectUser(id);//서비스에 사용할 메서드를 멤버객체에다 저장
		session.setAttribute("user", user);//멤버객체를 세션에 셋
		request.setAttribute("pagefile", "/user/userInfo.jsp");
		forward=new ActionForward("/index.jsp",false);
		return forward;
	}

	
}
