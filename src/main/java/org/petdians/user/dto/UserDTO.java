package org.petdians.user.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.petdians.animal.dto.ImageDTO;

import java.sql.Timestamp;
import java.util.ArrayList;
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


}
