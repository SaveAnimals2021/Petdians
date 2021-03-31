package org.petdians.animal.mapper;


import org.petdians.animal.domain.ImageVO;

import java.util.List;

public interface ImageMapper {

    void register(ImageVO vo);

    List<ImageVO> getImageByAno(Integer ano);


    List<ImageVO> getAllImages();
}
