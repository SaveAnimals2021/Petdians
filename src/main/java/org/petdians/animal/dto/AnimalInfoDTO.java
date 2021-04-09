package org.petdians.animal.dto;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class AnimalInfoDTO {

    private Integer dogCount;
    private Integer catCount;
    private Integer etcCount;
    private Integer unknownCount;
    private Integer totalCount;


}
