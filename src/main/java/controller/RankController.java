package controller;

import connector.ConnectionMaker;
import model.RankDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class RankController {
    private Connection connection;

    public RankController(ConnectionMaker connectionMaker) {
        this.connection = connectionMaker.makeConnection();
    }

    public void insert(RankDTO rankDTO) {
        String query = "INSERT INTO `rank`(`level`,`member_id`) VALUES(?,?)";

        try {
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setInt(1, rankDTO.getLevel());
            pstmt.setInt(2, rankDTO.getMemberId());

            pstmt.executeUpdate();

            pstmt.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public boolean validateMember(int memberId) {
        String query = "SELECT * FROM `rank` WHERE `member_id` = ?";
        boolean result = true;
        try {
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setInt(1, memberId);
            ResultSet resultSet = pstmt.executeQuery();
            if (resultSet.next()) {
                result = false;
            }

            resultSet.close();
            pstmt.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public ArrayList<RankDTO> selectAllLevel(int level) {
        ArrayList<RankDTO> list = new ArrayList<>();

        String query = "SELECT * FROM `rank` WHERE `level` = ?";

        try {
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setInt(1, level);

            ResultSet resultSet = pstmt.executeQuery();

            while (resultSet.next()) {
                RankDTO r = new RankDTO();
                r.setId(resultSet.getInt("id"));
                r.setLevel(resultSet.getInt("level"));
                r.setMemberId(resultSet.getInt("member_id"));

                list.add(r);
            }

            resultSet.close();
            pstmt.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public ArrayList<RankDTO> selectAll() {
        ArrayList<RankDTO> list = new ArrayList<>();

        String query = "SELECT * FROM `rank` ORDER BY `member_id` DESC";

        try {
            PreparedStatement pstmt = connection.prepareStatement(query);
            ResultSet resultSet = pstmt.executeQuery();

            while (resultSet.next()) {
                RankDTO r = new RankDTO();
                r.setId(resultSet.getInt("id"));
                r.setLevel(resultSet.getInt("level"));
                r.setMemberId(resultSet.getInt("member_id"));

                list.add(r);
            }

            resultSet.close();
            pstmt.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public RankDTO selectOne(int memberId) {
        RankDTO r = null;

        String query = "SELECT * FROM `rank` WHERE `member_id` = ?";

        try {
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setInt(1, memberId);

            ResultSet resultSet = pstmt.executeQuery();

            if (resultSet.next()) {
                r = new RankDTO();
                r.setId(resultSet.getInt("id"));
                r.setLevel(resultSet.getInt("level"));
                r.setMemberId(resultSet.getInt("member_id"));

            }

            resultSet.close();
            pstmt.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return r;

    }

    public void update(RankDTO rankDTO) {
        String query = "UPDATE `rank` SET `level` = ? WHERE `member_id` = ?";

        try {
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setInt(1,rankDTO.getLevel());
            pstmt.setInt(2,rankDTO.getMemberId());

            pstmt.executeUpdate();

            pstmt.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void delete(int memberId) {
        String query = "DELETE FROM `rank` WHERE `member_id` = ?";

        try {
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setInt(1, memberId);

            pstmt.executeUpdate();

            pstmt.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
