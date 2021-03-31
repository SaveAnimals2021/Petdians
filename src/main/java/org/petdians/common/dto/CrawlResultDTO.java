package org.petdians.common.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;


@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data
public class CrawlResultDTO {
   private Integer crawlNumber;
   private Integer newDataNumber;
   private Integer modDataNumber;
   private Integer totalDataNumber;
   private Date crawlDate;
   private String takingTime;
}
