package org.petdians.animal.service;

import org.petdians.animal.dto.MissingAnimalDTO;
import org.petdians.animal.mapper.AnimalInfoMapper;
import org.petdians.common.dto.PageDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AnimalServiceImpl implements AnimalService{

    @Autowired
    AnimalInfoMapper mapper;

    @Override
    public void register(MissingAnimalDTO dto) {
        try {
            mapper.register(toDomain(dto));
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
    public List<MissingAnimalDTO> getPagedList(PageDTO pageDTO) {
        return toDTOList(mapper.getPagedList(pageDTO.getSkip(), pageDTO.getPerSheet(), pageDTO.getArr(), pageDTO.getType()));
    }
}
