package org.petdians.user.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.petdians.security.domain.AuthVO;

import java.sql.Timestamp;
import java.util.List;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class UserDTO {

    String username;
    String userid;
    String userpw;
    String useremail;
    String userphone;
    Timestamp regdate;
    Timestamp updatedate;

    private List<AuthVO> authList;
}
