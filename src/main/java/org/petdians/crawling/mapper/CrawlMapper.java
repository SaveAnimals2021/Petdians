package org.petdians.crawling.mapper;

import org.apache.ibatis.annotations.Param;
import org.petdians.crawling.domain.CrawlResultVO;

import java.util.List;

public interface CrawlMapper {

    void register(CrawlResultVO vo);
    void delete(int cno);

    List<CrawlResultVO> getListByDay(@Param("day") Integer day);

}
