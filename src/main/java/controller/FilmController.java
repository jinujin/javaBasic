package controller;

import connector.ConnectionMaker;
import model.FilmDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class FilmController {
    private Connection connection;

    public FilmController(ConnectionMaker connectionMaker) {
        this.connection = connectionMaker.makeConnection();
    }

    public void insert(FilmDTO filmDTO) {
        String query = "INSERT INTO `film`(`title`, `description`, `rating`,`image`) VALUES(?,?,?,?)";

        try {
            PreparedStatement pstmt = connection.prepareStatement(query);

            pstmt.setString(1, filmDTO.getTitle());
            pstmt.setString(2, filmDTO.getDescription());
            pstmt.setString(3, filmDTO.getRating());
            pstmt.setString(4, filmDTO.getImage());

            pstmt.executeUpdate();

            pstmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public ArrayList<FilmDTO> selectAll() {
        ArrayList<FilmDTO> list = new ArrayList<>();

        String query = "SELECT * FROM `film` ORDER BY `id` DESC";

        try {
            PreparedStatement pstmt = connection.prepareStatement(query);
            ResultSet resultSet = pstmt.executeQuery();

            while (resultSet.next()) {
                FilmDTO f = new FilmDTO();
                f.setId(resultSet.getInt("id"));
                f.setTitle(resultSet.getString("title"));
                f.setDescription(resultSet.getString("description"));
                f.setRating(resultSet.getString("rating"));
                f.setImage(resultSet.getString("image"));

                list.add(f);
            }

            pstmt.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public FilmDTO selectOne(int id) {
        FilmDTO filmDTO = null;
        String query = "SELECT * FROM `film` WHERE `id` = ?";

        try {
            PreparedStatement pstmt = connection.prepareStatement(query);

            pstmt.setInt(1,id);

            ResultSet resultSet = pstmt.executeQuery();

            if (resultSet.next()) {
                filmDTO = new FilmDTO();
                filmDTO.setId(resultSet.getInt("id"));
                filmDTO.setTitle(resultSet.getString("title"));
                filmDTO.setDescription(resultSet.getString("description"));
                filmDTO.setRating(resultSet.getString("rating"));
                filmDTO.setImage(resultSet.getString("image"));

            }

            resultSet.close();
            pstmt.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return filmDTO;
    }

    public void update(FilmDTO filmDTO) {
        String query = "UPDATE `film` SET `title` = ?, `description` = ?, `rating` = ?, `image` = ? WHERE `id` = ?";

        try {
            PreparedStatement pstmt = connection.prepareStatement(query);

            pstmt.setString(1,filmDTO.getTitle());
            pstmt.setString(2,filmDTO.getDescription());
            pstmt.setString(3,filmDTO.getRating());
            pstmt.setString(4, filmDTO.getImage());
            pstmt.setInt(5,filmDTO.getId());

            pstmt.executeUpdate();

            pstmt.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public void delete(int id) {
        String query = "DELETE FROM `film` WHERE `id` = ?";

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
