package org.petdians.user.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class UserVO {

    String username;
    String userid;
    String userpw;
    String useremail;
    String userphone;
    Timestamp regdate;
    Timestamp updatedate;
}
