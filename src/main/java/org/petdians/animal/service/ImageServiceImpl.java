package org.petdians.animal.service;


import org.petdians.animal.dto.ImageDTO;
import org.petdians.animal.mapper.ImageMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class ImageServiceImpl implements ImageService{

    @Autowired
    ImageMapper mapper;

    @Override
    public void register(ImageDTO dto) {
        try {
            mapper.register(toDomain(dto));
        } catch (Exception e){
            e.printStackTrace();
        }
    }
}
