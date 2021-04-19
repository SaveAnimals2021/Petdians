package org.petdians.pet.mapper;

import org.apache.ibatis.annotations.Param;
import org.petdians.pet.domain.PetVO;

import java.util.List;

public interface PetMapper {

    void register(PetVO vo);

    List<PetVO> getPagedList(@Param("skip") Integer skip,
                             @Param("perSheet") Integer perSheet,
                             @Param("arr") String[] arr,
                             @Param("keyword") String keyword,
                             @Param("day") String day);

    void modify(PetVO vo);

    void delete(Integer pno);

    Integer getTotalCount();

    PetVO selectOne(Integer pno);

}
