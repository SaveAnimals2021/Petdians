package org.petdians.common.crawling.service;

import org.petdians.common.crawling.dto.CrawlResultDTO;
import org.petdians.common.crawling.mapper.CrawlMapper;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@Service
public class CrawlServiceImpl implements CrawlService{

    @Autowired
    CrawlMapper mapper;

    @Override
    public void register(CrawlResultDTO dto) throws Exception {
        mapper.register(toDomain(dto));
    }

    @Override
    public void delete(int cno) {
        mapper.delete(cno);
    }

    @Override
    public List<CrawlResultDTO> getListByDay(Integer day) throws Exception{
        return toDTOList(mapper.getListByDay(day));
    }
}
