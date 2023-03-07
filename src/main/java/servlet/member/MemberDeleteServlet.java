package servlet.member;

import com.google.gson.JsonObject;
import connector.ConnectionMaker;
import connector.MysqlConnectionMaker;
import controller.MemberController;
import model.MemberDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "MemberDeleteServlet", value = "/member/delete")
public class MemberDeleteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        final int MASTER = 1;
        ConnectionMaker connectionMaker = new MysqlConnectionMaker();
        MemberController memberController = new MemberController(connectionMaker);
        int id = Integer.parseInt(request.getParameter("id"));
        MemberDTO m = memberController.selectOne(id);
        PrintWriter writer = response.getWriter();

        HttpSession session = request.getSession();
        MemberDTO logIn = (MemberDTO) (session.getAttribute("logIn"));

        JsonObject object = new JsonObject();

        String content = "";
        String status = "";
        String nextPath = "";
        String message = "";

        try {

            String oldPassword = request.getParameter("oldPassword");

            if (logIn == null || m == null || memberController.auth(logIn.getUsername(), oldPassword) == null) {
                throw new NullPointerException();
            }
            if (logIn.getId() != MASTER && id == MASTER) {
                throw new NullPointerException();
            }

            memberController.delete(id);

            if (logIn.getLevel() == 3 && logIn.getId() != id) {
                content = "탈퇴 완료";
                status = "success";
                nextPath = "/member/updateRank.jsp";
                message = "정상적으로 탈퇴 되었습니다.";
            } else {
                content = "탈퇴 완료";
                status = "success";
                nextPath = "/main.jsp";
                message = "정상적으로 탈퇴 되었습니다.";
            }
        } catch (Exception e) {
            e.printStackTrace();
            if (logIn.getId() != MASTER && id == MASTER) {
                content = "!!! 무엄하구나 !!!";
                status = "error";
                nextPath = "/member/updateRank.jsp";
                message = "조물주는 탈퇴시킬 수 없습니다.";
            } else if (logIn.getLevel() == 3 && logIn != null && logIn.getId() != id) {
                content = "탈퇴 실패";
                status = "error";
                nextPath = "/member/updateRank.jsp";
                message = "비밀번호를 확인 바람";
            } else {
                content = "탈퇴 실패";
                status = "error";
                nextPath = "/member/mypage.jsp?id=" + id;
                message = "비밀번호 확인하세요.";
            }
        }
        if (m == null) {
            session.invalidate();
        }
        object.addProperty("status", status);
        object.addProperty("message", message);
        object.addProperty("nextPath", nextPath);
        object.addProperty("content", content);

        writer.print(object);

    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
