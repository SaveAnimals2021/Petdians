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
                                     @Param("keyword") String keyword,
                                     @Param("day") String day);

    List<MissingAnimalVO> getMissingList(@Param("skip") Integer skip,
                                         @Param("perSheet") Integer perSheet,
                                       @Param("day") String day);

    Integer getTotalCount(@Param("arr") String[] arr,
                          @Param("keyword") String keyword, @Param("day") String day);

    Integer getMissingTotal(@Param("arr") String[] arr,
                          @Param("keyword") String keyword, @Param("day") String day);

    Integer getAllDogCount();
    Integer getAllCatCount();
    Integer getAllEtcCount();
    Integer getAllUnknownCount();
    Integer getAllCount();

    Integer getWeekDogCount();
    Integer getWeekCatCount();
    Integer getWeekEtcCount();
    Integer getWeekUnknownCount();


}
