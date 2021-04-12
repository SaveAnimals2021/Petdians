package org.petdians.pet.dto;


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
public class PetDTO {

    Integer pno;
    String userid;
    String petname;
    Timestamp regdate;
    Timestamp updatedate;
    String species;
    Integer sex;
    Boolean isNeutralized;
    Integer age;
    String type;

    @Builder.Default
    private List<ImageDTO> imageList = new ArrayList<>();

}
