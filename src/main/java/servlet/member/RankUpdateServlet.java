package servlet.member;

import com.google.gson.JsonObject;
import connector.ConnectionMaker;
import connector.MysqlConnectionMaker;
import controller.MemberController;
import controller.RankController;
import model.RankDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "RankUpdateServlet", value = "/member/updateRank")
public class RankUpdateServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String status = "";
        String nextPath = "";
        String message = "";
        String content = "";

        JsonObject object = new JsonObject();

        PrintWriter writer = response.getWriter();
        ConnectionMaker connectionMaker = new MysqlConnectionMaker();
        RankController rankController = new RankController(connectionMaker);

        int memberId = Integer.parseInt(request.getParameter("memberId"));
        int rank = Integer.parseInt(request.getParameter("rank"));
        try {
            boolean validateRequest = rankController.validateMember(memberId);
            if (!validateRequest) {
                throw new NullPointerException();
            }

            RankDTO rankDTO = new RankDTO();
            rankDTO.setMemberId(memberId);
            rankDTO.setLevel(rank);

            rankController.insert(rankDTO);

            content = "신청 완료";
            status = "success";
            nextPath = "/member/mypage.jsp?id=" + memberId;
            message = "정상적으로 신청되었습니다.";

        } catch (Exception e) {
            e.printStackTrace();
            content = "신청 불가";
            status = "warning";
            nextPath = "/member/mypage.jsp?id=" + memberId;
            message = "이미 신청하셨습니다.";
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
