package org.petdians.animal.service;

import org.petdians.animal.domain.MissingAnimalVO;
import org.petdians.animal.dto.ImageDTO;
import org.petdians.animal.dto.MissingAnimalDTO;
import org.petdians.animal.mapper.AnimalInfoMapper;
import org.petdians.common.dto.PageDTO;
import org.petdians.common.util.ImageManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AnimalServiceImpl implements AnimalService{

    @Autowired
    AnimalInfoMapper mapper;

    @Autowired
    ImageService imageService;

    @Override
    public void register(MissingAnimalDTO dto) {
        try {
            MissingAnimalVO vo = toDomain(dto);
            mapper.register(vo);
            dto.setAnimalNumber(vo.getAnimalNumber());

            // 이미지를 파일로 저장하고
            List<ImageDTO> imageList = ImageManager.saveImage(dto);
            if(null == imageList){
                return;
            }

            // 이미지를 DB에 등록한다.
            imageList.forEach(i->{

                String fileName = i.getFileName();
                Integer dotIndex = fileName.lastIndexOf(".");

                if(dotIndex == fileName.length() - 4){
                    i.setType(fileName.substring(dotIndex));
                }

                imageService.register(i);
            });
        } catch (Exception e){
            e.printStackTrace();
        }

    }

    @Override
    public void setIsAdopted(MissingAnimalDTO dto) {
        try {
            mapper.setIsAdopted(toDomain(dto));
        } catch (Exception e){
            e.printStackTrace();
        }
    }


    @Override
    public List<MissingAnimalDTO> getAllList() {
        return toDTOList(mapper.getAllList());
    }

    @Override
    public List<MissingAnimalDTO> getUncompletedList() {
        return toDTOList(mapper.getUncompletedList());
    }

    @Override
    public Integer getTotalCount(PageDTO pageDTO) {
        return mapper.getTotalCount(pageDTO.getArr(), pageDTO.getKeyword(), pageDTO.getDay());
    }

    @Override
    public Integer getMissingTotal(PageDTO pageDTO) {
        return mapper.getMissingTotal(pageDTO.getArr(), pageDTO.getKeyword(), pageDTO.getDay());
    }

    @Override
    public Integer getAllDogCount() {
        return mapper.getAllDogCount();
    }

    @Override
    public Integer getAllCatCount() {
        return mapper.getAllCatCount();
    }

    @Override
    public Integer getAllEtcCount() {
        return mapper.getAllEtcCount();
    }

    @Override
    public Integer getAllUnknownCount() {
        return mapper.getAllUnknownCount();
    }

    @Override
    public Integer getAllCount() {
        return mapper.getAllCount();
    }

    @Override
    public Integer getWeekDogCount() {
        return mapper.getWeekDogCount();
    }

    @Override
    public Integer getWeekCatCount() {
        return mapper.getWeekCatCount();
    }

    @Override
    public Integer getWeekEtcCount() {
        return mapper.getWeekEtcCount();
    }

    @Override
    public Integer getWeekUnknownCount() {
        return mapper.getWeekUnknownCount();
    }


    @Override
    public List<MissingAnimalDTO> getPagedList(PageDTO pageDTO) {
        return toDTOList(mapper.getPagedList(pageDTO.getSkip(), pageDTO.getPerSheet(), pageDTO.getArr(), pageDTO.getType(), pageDTO.getDay()));
    }

    @Override
    public List<MissingAnimalDTO> getMissingList(PageDTO pageDTO) {
        return toDTOList(mapper.getMissingList(pageDTO.getSkip(), pageDTO.getPerSheet(),pageDTO.getDay()));
    }
}
