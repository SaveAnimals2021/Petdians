package org.petdians.animal.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class LocationVO {
    Integer lno;
    String missingLocation;
    Integer animalNumber;
    Double xPosition;
    Double yPosition;

    Date regDate;
    Date updateDate;
}
