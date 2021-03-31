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
    public List<MissingAnimalDTO> getPagedList(PageDTO pageDTO) {
        return toDTOList(mapper.getPagedList(pageDTO.getSkip(), pageDTO.getPerSheet(), pageDTO.getArr(), pageDTO.getType()));
    }


}
