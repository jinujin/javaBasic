package controller;

import connector.ConnectionMaker;
import model.GradeDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class GradeController {
    private Connection connection;

    public GradeController(ConnectionMaker connectionMaker) {
        this.connection = connectionMaker.makeConnection();
    }

    public void insert(GradeDTO gradeDTO) {
        String query = "INSERT INTO `grade`(`writer_id`,`film_id`,`score`,`criticism`,`entry_date`) VALUES(?,?,?,?,NOW())";

        try {
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setInt(1,gradeDTO.getWriterId());
            pstmt.setInt(2,gradeDTO.getFilmId());
            pstmt.setDouble(3,gradeDTO.getScore());
            pstmt.setString(4,gradeDTO.getCriticism());

            pstmt.executeUpdate();

            pstmt.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public ArrayList<GradeDTO> selectAll(int filmId) {
        ArrayList<GradeDTO> list = new ArrayList<>();

        String query = "SELECT * FROM `grade` WHERE `film_id` = ?";

        try {
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setInt(1,filmId);

            ResultSet resultSet = pstmt.executeQuery();

            while (resultSet.next()) {
                GradeDTO g = new GradeDTO();
                g.setId(resultSet.getInt("id"));
                g.setWriterId(resultSet.getInt("writer_id"));
                g.setFilmId(resultSet.getInt("film_id"));
                g.setScore(resultSet.getDouble("score"));
                g.setCriticism(resultSet.getString("criticism"));
                g.setEntry_date(resultSet.getTimestamp("entry_date"));

                list.add(g);
            }

            resultSet.close();
            pstmt.close();


        } catch (SQLException e) {
            e.printStackTrace();
        }


        return list;
    }

    public GradeDTO selectOne(int id){
        GradeDTO g = null;

        String query = "SELECT * FROM `grade` WHERE `id` = ?";

        try {
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setInt(1, id);

            ResultSet resultSet = pstmt.executeQuery();

            if (resultSet.next()) {
                g = new GradeDTO();
                g.setId(resultSet.getInt("id"));
                g.setWriterId(resultSet.getInt("writer_id"));
                g.setFilmId(resultSet.getInt("film_id"));
                g.setScore(resultSet.getDouble("score"));
                g.setCriticism(resultSet.getString("criticism"));
                g.setEntry_date(resultSet.getTimestamp("entry_date"));

            }

            resultSet.close();
            pstmt.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return g;

    }

    public void update(GradeDTO gradeDTO) {
        String query = "UPDATE `grade` SET `score` = ?, `criticism` = ? WHERE `id` = ?";

        try {
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setDouble(1,gradeDTO.getScore());
            pstmt.setString(2, gradeDTO.getCriticism());
            pstmt.setInt(3,gradeDTO.getId());

            pstmt.executeUpdate();

            pstmt.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public void delete(int id) {
        String query = "DELETE FROM `grade` WHERE `id` = ?";

        try {
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setInt(1,id);

            pstmt.executeUpdate();

            pstmt.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
