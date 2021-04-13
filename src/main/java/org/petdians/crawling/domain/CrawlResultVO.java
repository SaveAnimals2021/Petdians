package org.petdians.crawling.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;


@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data
public class CrawlResultVO {

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
    private Date crawlDate;
    private String takingTime;


}
