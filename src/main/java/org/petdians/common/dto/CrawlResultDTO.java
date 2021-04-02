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
   // 몇일동안의 정보를 수집했는가?
   private Integer period;
   private Date crawlDate;
   private String takingTime;
}
