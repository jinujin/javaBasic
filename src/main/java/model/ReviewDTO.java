package model;

import lombok.Data;

import java.util.Date;

@Data
public class ReviewDTO {
    private int id;
    private int writerId;
    private int filmId;
    private String content;
    private Date entry_date;
    private Date modify_date;

}
