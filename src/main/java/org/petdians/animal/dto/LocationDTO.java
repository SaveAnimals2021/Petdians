package org.petdians.animal.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class LocationDTO {
    Integer lno;
    String missingLocation;
    Integer animalNumber;
    Double xPosition;
    Double yPosition;

    String regDate;
    String updateDate;
}
