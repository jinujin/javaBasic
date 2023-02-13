package model;

import lombok.Data;

@Data
public class UserDTO {
    private int id;
    private String username; // id
    private String password;
    private String nickname;

}
// 얕은 복사 : 주소값만 복사됨
// 깊은 복사 : a객체 별도 공간으로 b객체 별도 공간을 넣음
