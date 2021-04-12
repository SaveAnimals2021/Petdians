package org.petdians.admin.domain;

import lombok.*;

import java.sql.Timestamp;

@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Admin {

    private String adminID;
    private String adminPW;
    private String adminName;
    private Timestamp regdate;
    private Timestamp updateDate;

}
