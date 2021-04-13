package org.petdians.member.domain;

import lombok.*;
import org.petdians.security.domain.AuthVO;

import java.sql.Timestamp;
import java.util.List;

@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class MemberVO {

    private String memberID;
    private String memberPW;
    private String memberName;
    private String memberEmail;
    private String memberPhone;
    private Timestamp regdate;
    private Timestamp updateDate;

    private List<AuthVO> authList;

    public void changePW(String pw){
        this.memberPW = pw;
    }

}
