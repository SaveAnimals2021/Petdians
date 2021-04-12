package org.petdians.admin.dto;

import lombok.Builder;
import lombok.Data;

import java.sql.Timestamp;

@Data
@Builder
public class AdminDTO {

    private String adminID;
    private String adminPW;
    private String adminName;
    private Timestamp regdate;
    private Timestamp updateDate;

}
