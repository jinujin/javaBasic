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
        ConnectionMaker connectionMaker = new MysqlConnectionMaker();
        MemberController memberController = new MemberController(connectionMaker);
        int id = Integer.parseInt(request.getParameter("id"));
        MemberDTO m = memberController.selectOne(id);

        PrintWriter writer = response.getWriter();

        JsonObject object = new JsonObject();

        String content = "";
        String status = "";
        String nextPath = "";
        String message = "";

        try {
            HttpSession session = request.getSession();
            MemberDTO logIn = (MemberDTO) (session.getAttribute("logIn"));

            if (logIn == null||m == null || m.getId() != logIn.getId()) {
                throw new NullPointerException();
            }
            memberController.delete(id);
            session.invalidate();

            content = "탈퇴 완료";
            status = "success";
            nextPath = "/main.jsp";
            message = "정상적으로 탈퇴 되었습니다.";

        } catch (Exception e) {

            content = "탈퇴 실패";
            status = "error";
            nextPath = "/main.jsp";
            message = "탈퇴가 되지 않았습니다. (로그인 확인)";
        }
        object.addProperty("status",status);
        object.addProperty("message",message);
        object.addProperty("nextPath",nextPath);
        object.addProperty("content",content);

        writer.print(object);

    }



    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
