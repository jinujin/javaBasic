package controller;

import connector.ConnectionMaker;
import model.MemberDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberController {
    private Connection connection;
    public MemberController(ConnectionMaker connectionMaker){
        this.connection = connectionMaker.makeConnection();
    }

    public void insert(MemberDTO memberDTO) {
        String query ="INSERT INTO `member`(`username`, `password`, `nickname`,`level`) VALUES(?,?,?,?)";
        try {
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setString(1, memberDTO.getUsername());
            pstmt.setString(2, memberDTO.getPassword());
            pstmt.setString(3, memberDTO.getNickname());
            pstmt.setInt(4, memberDTO.getLevel());

            pstmt.executeUpdate();

            pstmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

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
                memberDTO.setNickname(resultSet.getString("nickname"));

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
        String query = "UPDATE `member` SET `password` = ?, `nickname` = ? WHERE `id` = ?";

        try {
            PreparedStatement pstmt = connection.prepareStatement(query);

            pstmt.setString(1,memberDTO.getPassword());
            pstmt.setString(2,memberDTO.getNickname());
            pstmt.setInt(3,memberDTO.getId());

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
                m.setId(resultSet.getInt("id"));
                m.setNickname(resultSet.getString("nickname"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return m;
    }


}
