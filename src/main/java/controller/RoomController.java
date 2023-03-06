package controller;

import connector.ConnectionMaker;
import model.RoomDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class RoomController {
    private Connection connection;

    public RoomController(ConnectionMaker connectionMaker) {
        this.connection = connectionMaker.makeConnection();
    }

    public void insert(RoomDTO roomDTO) {
        String query = "INSERT INTO `room`(`seats`,`name`) VALUES(?,?)";

        try {
            PreparedStatement pstmt = connection.prepareStatement(query);

            pstmt.setInt(1, roomDTO.getSeats());
            pstmt.setInt(2, roomDTO.getName());

            pstmt.executeUpdate();

            pstmt.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public ArrayList<RoomDTO> selectAll() {
        ArrayList<RoomDTO> list = new ArrayList<>();

        String query = "SELECT * FROM `room` ORDER BY `id` DESC";

        try {
            PreparedStatement pstmt = connection.prepareStatement(query);

            ResultSet resultSet = pstmt.executeQuery();

            while (resultSet.next()) {
                RoomDTO r = new RoomDTO();
                r.setId(resultSet.getInt("id"));
                r.setName(resultSet.getInt("name"));
                r.setSeats(resultSet.getInt("seats"));

                list.add(r);
            }

            resultSet.close();
            pstmt.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;

    }

    public RoomDTO selectOne(int id) {
        RoomDTO r = null;

        String query = "SELECT * FROM `room` WHERE `id` = ?";

        try {
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setInt(1, id);

            ResultSet resultSet = pstmt.executeQuery();

            if (resultSet.next()) {
                r = new RoomDTO();
                r.setId(resultSet.getInt("id"));
                r.setName(resultSet.getInt("name"));
                r.setSeats(resultSet.getInt("seats"));

            }

            resultSet.close();
            pstmt.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return r;

    }

    public void update(RoomDTO roomDTO) {
        String query = "UPDATE `room` SET `name` = ?, `seats` = ? WHERE `id` = ?";

        try {
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setInt(1,roomDTO.getName());
            pstmt.setInt(2, roomDTO.getSeats());
            pstmt.setInt(3,roomDTO.getId());

            pstmt.executeUpdate();
            pstmt.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void delete(int id) {
        String query = "DELETE FROM `room` WHERE `id` = ? ";

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
