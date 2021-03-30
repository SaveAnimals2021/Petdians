package org.petdians.animal.service;

import org.petdians.animal.domain.ImageVO;
import org.petdians.animal.dto.ImageDTO;
import org.petdians.common.util.SimpleDateFormatter;

import java.util.Date;

public interface ImageService {

    void register(ImageDTO dto);

    default ImageVO toDomain(ImageDTO dto) throws Exception{
        Date regDate = SimpleDateFormatter.fromStringToDate(dto.getRegDate());
        Date updateDate = SimpleDateFormatter.fromStringToDate(dto.getUpdateDate());

        return ImageVO.builder()
                .animalNumber(dto.getAnimalNumber()).type(dto.getType()).regDate(regDate).updateDate(updateDate)
                .uploadPath(dto.getUploadPath()).url(dto.getUrl()).fileName(dto.getFileName()).ino(dto.getIno())
                .uuid(dto.getUuid())
                .build();
    }


}
