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
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "MemberUpdateServlet", value = "/member/update")
public class MemberUpdateServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String status = "";
        String nextPath = "";
        String message = "";
        String content = "";

        JsonObject object = new JsonObject();

        PrintWriter writer = response.getWriter();

        ConnectionMaker connectionMaker = new MysqlConnectionMaker();
        MemberController memberController = new MemberController(connectionMaker);
//            HttpSession session = request.getSession();
//            MemberDTO logIn = (MemberDTO) session.getAttribute("logIn");

        int id = Integer.parseInt(request.getParameter("id"));

        try {

            MemberDTO m = memberController.selectOne(id);

            String nickname = request.getParameter("nickname");
            String password = request.getParameter("password");
            String email = request.getParameter("email");
            String oldPassword = request.getParameter("oldPassword");

            if (m == null || !m.getPassword().equals(oldPassword)) {
                throw new NullPointerException();
            }

            m.setNickname(nickname);
            m.setPassword(password);
            m.setEmail(email);

            memberController.update(m);

            content = "수정 완료";
            status = "success";
            nextPath = "/member/mypage.jsp?id=" + id;
            message = "정상적으로 수정되었습니다.";

        } catch (Exception e) {
            e.printStackTrace();
            content = "수정 실패";
            status = "error";
            nextPath = "/member/mypage.jsp?id=" + id;
//            message = "다시 로그인 해주세요.";
        }
        object.addProperty("content", content);
        object.addProperty("status", status);
        object.addProperty("message", message);
        object.addProperty("nextPath", nextPath);

        writer.print(object);
    }
}
