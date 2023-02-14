package controller;

import connector.ConnectionMaker;
import model.CinemaDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CinemaController {


    private Connection connection;

    public CinemaController(ConnectionMaker connectionMaker) {
        this.connection = connectionMaker.makeConnection();
    }

    public void insert(CinemaDTO cinemaDTO) {
        String query = "INSERT INTO `cinema`(`film_id`,`name`,`location`,`number`) VALUES(?,?,?,?)";

        try {
            PreparedStatement pstmt = connection.prepareStatement(query);

            pstmt.setInt(1, cinemaDTO.getFilmId());
            pstmt.setString(2, cinemaDTO.getName());
            pstmt.setString(3, cinemaDTO.getLocation());
            pstmt.setString(4, cinemaDTO.getNumber());

            pstmt.executeUpdate();

            pstmt.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    // 극장 list
    public ArrayList<CinemaDTO> selectAll() {
        ArrayList<CinemaDTO> list = new ArrayList<>();

        String query = "SELECT * FROM `cinema` ORDER BY `id` DESC ";

        try {
            PreparedStatement pstmt = connection.prepareStatement(query);

            ResultSet resultSet = pstmt.executeQuery();

            while (resultSet.next()) {
                CinemaDTO c = new CinemaDTO();
                c.setId(resultSet.getInt("id"));
                c.setName(resultSet.getString("name"));
                c.setFilmId(resultSet.getInt("film_id"));
                c.setLocation(resultSet.getString("location"));
                c.setNumber(resultSet.getString("number"));

                list.add(c);
            }

            resultSet.close();
            pstmt.close();


        } catch (SQLException e) {
            e.printStackTrace();
        }


        return list;
    }

    // showing 하고 film하고 연결된... list? 만들까?

    public CinemaDTO selectOne(int id) {
        CinemaDTO c = null;

        String query = "SELECT * FROM `cinema` WHERE `id` = ?";

        try {
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setInt(1, id);

            ResultSet resultSet = pstmt.executeQuery();

            if (resultSet.next()) {
                c = new CinemaDTO();
                c.setId(resultSet.getInt("id"));
                c.setName(resultSet.getString("name"));
                c.setFilmId(resultSet.getInt("film_id"));
                c.setLocation(resultSet.getString("location"));
                c.setNumber(resultSet.getString("number"));

            }

            resultSet.close();
            pstmt.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return c;

    }

    public void update(CinemaDTO cinemaDTO) {
        String query = "UPDATE `cinema` SET `name` = ?, `location` = ?, `number` = ? WHERE `id` = ?";

        try {
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setString(1, cinemaDTO.getName());
            pstmt.setString(2, cinemaDTO.getLocation());
            pstmt.setString(3, cinemaDTO.getNumber());
            pstmt.setInt(4,cinemaDTO.getId());

            pstmt.executeUpdate();

            pstmt.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public void delete(int id) {
        String query = "DELETE FROM `cinema` WHERE `id` = ?";

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


