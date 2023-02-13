package model;

import lombok.Data;

import java.util.Date;
@Data
public class ReplyDTO {
    private String username;
    private  int id;
    private String content;
    private int boardId;
    private int writerId;
    private String writeNickname;

    private Date entryDate;
    private Date modifyDate;

}
