package model;

import lombok.Data;

import java.util.Date;

@Data
public class GradeDTO {
    private int id; // 평점 번호
    private int writerId; // 작성 회원 번호
    private int filmId;// 영화 번호
    private double score; //평점
    private String criticism; //평론
    private Date entry_date;

}
