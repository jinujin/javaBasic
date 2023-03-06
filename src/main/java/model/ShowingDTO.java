package model;

import lombok.Data;

@Data
public class ShowingDTO {
    private int id;
    private int filmId;
    private int cinemaId;
    private String time;
    private String date;
    private int roomId;
}
