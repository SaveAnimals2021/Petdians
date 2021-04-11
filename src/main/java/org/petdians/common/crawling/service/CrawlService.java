package org.petdians.common.crawling.service;

import org.petdians.common.crawling.domain.CrawlResultVO;
import org.petdians.common.crawling.dto.CrawlResultDTO;
import org.petdians.common.util.DateFormatter;

import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;


public interface CrawlService {
    void register(CrawlResultDTO dto) throws Exception;
    void delete(int cno);

    List<CrawlResultDTO> getListByDay(Integer day) throws Exception;


    default CrawlResultVO toDomain(CrawlResultDTO dto) throws Exception{
        Date crawlDate = DateFormatter.fromStringToDate(dto.getCrawlDate());

        CrawlResultVO vo = new CrawlResultVO();

        vo.setCrawlCount(dto.getCrawlCount());
        vo.setCrawlCount(dto.getCrawlNumber());
        vo.setNewDataCount(dto.getNewDataCount());
        vo.setModDataCount(dto.getModDataCount());
        vo.setTotalDataCount(dto.getTotalDataCount());
        vo.setMissingCount(dto.getMissingCount());
        vo.setWitnessedCount(dto.getWitnessedCount());
        vo.setRescuedCount(dto.getRescuedCount());
        vo.setAdoptedCount(dto.getAdoptedCount());
        vo.setPeriod(dto.getPeriod());
        vo.setTakingTime(dto.getTakingTime());

        vo.setCrawlDate(crawlDate);

        return vo;
    }

    default CrawlResultDTO toDTO(CrawlResultVO vo) {

        CrawlResultDTO dto = new CrawlResultDTO();

        dto.setCrawlNumber(vo.getCrawlNumber());
        dto.setCrawlCount(vo.getCrawlCount());
        dto.setNewDataCount(vo.getNewDataCount());
        dto.setModDataCount(vo.getModDataCount());
        dto.setTotalDataCount(vo.getTotalDataCount());
        dto.setMissingCount(vo.getMissingCount());
        dto.setWitnessedCount(vo.getWitnessedCount());
        dto.setRescuedCount(vo.getRescuedCount());
        dto.setAdoptedCount(vo.getAdoptedCount());
        dto.setPeriod(vo.getPeriod());
        dto.setCrawlDate(DateFormatter.fromDateToString(vo.getCrawlDate()));
        dto.setTakingTime(vo.getTakingTime());

        return dto;
    }

    default List<CrawlResultDTO> toDTOList(List<CrawlResultVO> list) {
        return list.stream().map(a -> {
            return toDTO(a);
        }).collect(Collectors.toList());
    }
}
