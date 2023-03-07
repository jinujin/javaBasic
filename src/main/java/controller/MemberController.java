package controller;

import connector.ConnectionMaker;
import model.MemberDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MemberController {
    private Connection connection;
    private ArrayList<MemberDTO> rankList;
//    private ArrayList<MemberDTO> criticList;
    public MemberController(ConnectionMaker connectionMaker){
        this.connection = connectionMaker.makeConnection();
    }

    public boolean insert(MemberDTO memberDTO) {
        String query ="INSERT INTO `member`(`username`, `password`, `nickname`,`level`,`email`) VALUES(?,?,?,?,?)";
        try {
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setString(1, memberDTO.getUsername());
            pstmt.setString(2, memberDTO.getPassword());
            pstmt.setString(3, memberDTO.getNickname());
            pstmt.setInt(4, memberDTO.getLevel());
            pstmt.setString(5,memberDTO.getEmail());

            pstmt.executeUpdate();

            pstmt.close();
        } catch (SQLException e) {
            return false;
        }
        return true;
    }
    public boolean validateUsername(String username) {
        String query = "SELECT * FROM `member` WHERE `username` = ?";
        boolean result = true;
        try {
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setString(1, username);
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

    public MemberDTO auth(String username, String password){
        String query = "SELECT * FROM `member` WHERE `username` = ? AND `password` = ?";

        try {
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setString(1,username);
            pstmt.setString(2,password);

            ResultSet resultSet = pstmt.executeQuery();

            if (resultSet.next()) {
                MemberDTO memberDTO = new MemberDTO();
                memberDTO.setId(resultSet.getInt("id"));
                memberDTO.setUsername(resultSet.getString("username"));
                // password는 보안상 좋지 않음
//                memberDTO.setPassword(resultSet.getString("password"));
                memberDTO.setNickname(resultSet.getString("nickname"));
                memberDTO.setLevel(resultSet.getInt("level"));

                return memberDTO;
            }

            resultSet.close();
            pstmt.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    public void update(MemberDTO memberDTO) {
        String query = "UPDATE `member` SET `password` = ?, `nickname` = ?, `email` = ? WHERE `id` = ?";

        try {
            PreparedStatement pstmt = connection.prepareStatement(query);

            pstmt.setString(1,memberDTO.getPassword());
            pstmt.setString(2,memberDTO.getNickname());
            pstmt.setString(3, memberDTO.getEmail());
//            pstmt.setInt(5,memberDTO.getLevel());
            pstmt.setInt(4,memberDTO.getId());

            pstmt.executeUpdate();

            pstmt.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public void delete(int id) {
        String query = "DELETE FROM `member` WHERE `id` =?";

        try {
            PreparedStatement pstmt = connection.prepareStatement(query);

            pstmt.setInt(1,id);

            pstmt.executeUpdate();

            pstmt.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public MemberDTO selectOne(int id) {
        MemberDTO m = null;
        String query = "SELECT * FROM `member` WHERE `id` = ?";

        try {
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setInt(1,id);

            ResultSet resultSet = pstmt.executeQuery();

            if (resultSet.next()) {
                m = new MemberDTO();
                m.setUsername(resultSet.getString("username"));
                m.setId(resultSet.getInt("id"));
                m.setNickname(resultSet.getString("nickname"));
                m.setEmail(resultSet.getString("email"));
                m.setLevel(resultSet.getInt("level"));
                m.setPassword(resultSet.getString("password"));
                m.setEmail(resultSet.getString("email"));

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return m;
    }

    public ArrayList<MemberDTO> selectAll() {
        ArrayList<MemberDTO> list = new ArrayList<>();
        String query = "SELECT * FROM `member` ORDER BY `id`";

        try {
            PreparedStatement pstmt = connection.prepareStatement(query);
            ResultSet resultSet = pstmt.executeQuery();

            while (resultSet.next()) {
                MemberDTO m = new MemberDTO();
                m.setUsername(resultSet.getString("username"));
                m.setId(resultSet.getInt("id"));
                m.setNickname(resultSet.getString("nickname"));
                m.setEmail(resultSet.getString("email"));
                m.setLevel(resultSet.getInt("level"));
                m.setPassword(resultSet.getString("password"));

                list.add(m);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;

    }

    public void rankUp(int id, int level) {
        MemberDTO m = new MemberDTO();
        String query = "UPDATE `member` SET `level` = ? WHERE `id` = ?";

        try {
            PreparedStatement pstmt = connection.prepareStatement(query);

            pstmt.setInt(1,level);
            pstmt.setInt(2, id);

            pstmt.executeUpdate();

            pstmt.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }



}
