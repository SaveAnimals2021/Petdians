package org.petdians.animal.service;


import lombok.extern.log4j.Log4j;
import org.petdians.animal.dto.ImageDTO;
import org.petdians.animal.mapper.ImageMapper;
import org.petdians.common.util.ImageManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Log4j
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

    public List<ImageDTO> getImageByAno(Integer ano) throws Exception{
        return toDTOList( mapper.getImageByAno(ano) );
    }

    public List<ImageDTO> getAllImages() throws Exception{
        return toDTOList( mapper.getAllImages() );
    }

    @Override
    public void changeType(ImageDTO dto) throws Exception{

        mapper.changeType(toDomain(dto));
    }

    public void downloadAll() throws Exception{
        List<ImageDTO> list = toDTOList( mapper.getAllImages());

        int size = list.size();
        for(int i = 0; i < size; ++i){
            ImageDTO dto = list.get(i);

            ImageManager.saveImageDTO(dto);
        }
    }
}
