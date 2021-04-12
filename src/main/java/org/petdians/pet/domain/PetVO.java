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
public class PetVO {
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

}
