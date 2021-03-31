package org.petdians.animal.mapper;

import org.apache.ibatis.annotations.Param;
import org.petdians.animal.domain.MissingAnimalVO;

import java.util.List;

public interface AnimalInfoMapper {

    void register(MissingAnimalVO vo);

    void setIsAdopted(MissingAnimalVO vo);

    List<MissingAnimalVO> getAllList();

    List<MissingAnimalVO> getUncompletedList();

    List<MissingAnimalVO> getPagedList(@Param("skip") Integer skip,
                                     @Param("perSheet") Integer perSheet,
                                     @Param("arr") String[] arr,
                                     @Param("keyword") String keyword);

    Integer getTotalCount(@Param("arr") String[] arr,
                          @Param("keyword") String keyword);


}
