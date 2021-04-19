package org.petdians.pet.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PetImageVO {

    private Integer pino;
    private Integer pno;
    private String uuid; //100
    private String uploadPath; //100
    private String fileName; //100
    private String type; //50

    private Timestamp regDate;
    private Timestamp updateDate;

}
