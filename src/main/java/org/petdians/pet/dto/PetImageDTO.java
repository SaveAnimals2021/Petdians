package org.petdians.pet.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PetImageDTO {

    private Integer pino;
    private Integer pno;
    private String uuid;
    private String uploadPath;
    private String fileName;
    private String type;

    private Timestamp regDate;
    private Timestamp updateDate;
}
