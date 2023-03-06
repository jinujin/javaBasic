package servlet.member;

import com.google.gson.JsonObject;
import connector.ConnectionMaker;
import connector.MysqlConnectionMaker;
import controller.MemberController;
import model.MemberDTO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "MemberAuthServlet", value = "/member/auth")
public class MemberAuthServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ConnectionMaker connectionMaker = new MysqlConnectionMaker();
        MemberController memberController = new MemberController(connectionMaker);

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        MemberDTO memberDTO = memberController.auth(username, password);

        JsonObject object = new JsonObject();
        if (memberDTO != null) {
            HttpSession session = request.getSession();
            session.setAttribute("logIn", memberDTO);

            object.addProperty("result", "success");
        } else {
            object.addProperty("result", "fail");
        }

        PrintWriter writer = response.getWriter();
        writer.print(object);
    }
}
