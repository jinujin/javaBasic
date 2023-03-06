package servlet.show;

import com.google.gson.JsonObject;
import connector.ConnectionMaker;
import connector.MysqlConnectionMaker;
import controller.ShowingController;
import model.MemberDTO;
import model.ShowingDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "ShowRegisterServlet", value = "/show/register")
public class ShowRegisterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String status = "";
        String nextPath = "";
        String message = "";

        JsonObject object = new JsonObject();

        PrintWriter writer = response.getWriter();
        try {
            ConnectionMaker connectionMaker = new MysqlConnectionMaker();
            ShowingController showingController = new ShowingController(connectionMaker);

            HttpSession session = request.getSession();
            MemberDTO logIn = (MemberDTO) session.getAttribute("logIn");

            ShowingDTO s = new ShowingDTO();

            int filmId = Integer.parseInt(request.getParameter("filmId"));
            int cinemaId = Integer.parseInt(request.getParameter("cinemaId"));
            int roomId = Integer.parseInt(request.getParameter("roomId"));
            String date = request.getParameter("date");
            String time = request.getParameter("time");
            if (logIn == null || logIn.getLevel() != 3) {
                throw new NullPointerException();
            }

            s.setFilmId(filmId);
            s.setDate(date);
            s.setTime(time);
            s.setCinemaId(cinemaId);
            s.setRoomId(roomId);

            showingController.insert(s);

            status = "success";
            nextPath = "/show/showList.jsp";
            message = "정상적으로 등록되었습니다.";

        } catch (Exception e) {
            e.printStackTrace();
            status = "error";
            nextPath = "/member/login.jsp";
            message = "다시 로그인 해주세요.";
        }

        object.addProperty("status", status);
        object.addProperty("message", message);
        object.addProperty("nextPath", nextPath);

        writer.print(object);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
