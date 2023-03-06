package controller;

import connector.ConnectionMaker;
import model.ShowingDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ShowingController {
    private Connection connection;

    public ShowingController(ConnectionMaker connectionMaker) {
        this.connection = connectionMaker.makeConnection();
    }

    public void insert(ShowingDTO showingDTO) {
        String query = "INSERT INTO `showing`(`film_id`,`cinema_id`,`time`,`date`,`room_id`) VALUES(?,?,?,?,?)";

        try {
            PreparedStatement pstmt = connection.prepareStatement(query);

            pstmt.setInt(1, showingDTO.getFilmId());
            pstmt.setInt(2, showingDTO.getCinemaId());
            pstmt.setString(3, showingDTO.getTime());
            pstmt.setString(4, showingDTO.getDate());
            pstmt.setInt(5,showingDTO.getRoomId());

            pstmt.executeUpdate();

            pstmt.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    // 극장 list
    public ArrayList<ShowingDTO> selectAll() {
        ArrayList<ShowingDTO> list = new ArrayList<>();

        String query = "SELECT * FROM `showing` ORDER BY `id` DESC ";

        try {
            PreparedStatement pstmt = connection.prepareStatement(query);

            ResultSet resultSet = pstmt.executeQuery();

            while (resultSet.next()) {
                ShowingDTO s = new ShowingDTO();
                s.setId(resultSet.getInt("id"));
                s.setFilmId(resultSet.getInt("film_id"));
                s.setCinemaId(resultSet.getInt("cinema_id"));
                s.setTime(resultSet.getString("time"));
                s.setDate(resultSet.getString("date"));
                s.setRoomId(resultSet.getInt("room_id"));

                list.add(s);
            }

            resultSet.close();
            pstmt.close();


        } catch (SQLException e) {
            e.printStackTrace();
        }


        return list;
    }


    public ShowingDTO selectOne(int id) {
        ShowingDTO s = null;

        String query = "SELECT * FROM `showing` WHERE `id` = ?";

        try {
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setInt(1, id);

            ResultSet resultSet = pstmt.executeQuery();

            if (resultSet.next()) {
                s = new ShowingDTO();
                s.setId(resultSet.getInt("id"));
                s.setFilmId(resultSet.getInt("film_id"));
                s.setCinemaId(resultSet.getInt("cinema_id"));
                s.setTime(resultSet.getString("time"));
                s.setDate(resultSet.getString("date"));
                s.setRoomId(resultSet.getInt("room_id"));

            }

            resultSet.close();
            pstmt.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return s;

    }

    public void update(ShowingDTO showingDTO) {
        String query = "UPDATE `showing` SET `time` = ?, `date` = ?,`film_id` = ?, `cinema_id` = ?, `room_id` = ? WHERE `id` = ?";

        try {
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setString(1, showingDTO.getTime());
            pstmt.setString(2, showingDTO.getDate());
            pstmt.setInt(3,showingDTO.getFilmId());
            pstmt.setInt(4,showingDTO.getCinemaId());
            pstmt.setInt(5,showingDTO.getRoomId());
            pstmt.setInt(6,showingDTO.getId());

            pstmt.executeUpdate();

            pstmt.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public void delete(int id) {
        String query = "DELETE FROM `showing` WHERE `id` = ?";

        try {
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setInt(1, id);

            pstmt.executeUpdate();

            pstmt.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}




