package org.petdians.crawling.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data
public class CrawlResultDTO {
   private Integer crawlNumber;

   private Integer crawlCount;
   private Integer newDataCount;
   private Integer modDataCount;
   private Integer totalDataCount;

   private Integer missingCount;
   private Integer witnessedCount;
   private Integer rescuedCount;
   private Integer adoptedCount;

   // 몇일동안의 정보를 수집했는가?
   private Integer period;
   private String crawlDate;
   private String takingTime;


}
