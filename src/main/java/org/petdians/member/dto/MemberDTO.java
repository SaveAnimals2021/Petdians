package org.petdians.member.dto;

import lombok.Builder;
import lombok.Data;
import org.petdians.security.domain.AuthVO;

import java.sql.Timestamp;
import java.util.List;

@Data
@Builder
public class MemberDTO {

    private String memberID;
    private String memberPW;
    private String memberName;
    private String memberEmail;
    private String memberPhone;
    private Timestamp regdate;
    private Timestamp updateDate;

    private List<AuthVO> authList;

}
