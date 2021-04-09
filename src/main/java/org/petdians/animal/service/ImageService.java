package org.petdians.animal.service;

import org.petdians.animal.domain.ImageVO;
import org.petdians.animal.dto.ImageDTO;
import org.petdians.common.util.DateFormatter;
import org.petdians.common.util.SimpleDateFormatter;

import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

public interface ImageService {

    void register(ImageDTO dto);

    List<ImageDTO> getImageByAno(Integer ano) throws Exception;

    List<ImageDTO> getAllImages() throws Exception;

    void changeType(ImageDTO dto) throws Exception;

    void downloadAll() throws Exception;

    default ImageVO toDomain(ImageDTO dto) throws Exception{
        Date regDate = SimpleDateFormatter.fromStringToDate(dto.getRegDate());
        Date updateDate = SimpleDateFormatter.fromStringToDate(dto.getUpdateDate());

        return ImageVO.builder()
                .animalNumber(dto.getAnimalNumber()).type(dto.getType()).regDate(regDate).updateDate(updateDate)
                .uploadPath(dto.getUploadPath()).url(dto.getUrl()).fileName(dto.getFileName()).ino(dto.getIno())
                .uuid(dto.getUuid())
                .build();
    }

    default ImageDTO toDTO(ImageVO vo) {
        ImageDTO dto = new ImageDTO();

        try {
            dto.setAnimalNumber(vo.getAnimalNumber());
            dto.setType(vo.getType());
            dto.setRegDate(DateFormatter.fromDateToString(vo.getRegDate()));
            dto.setUpdateDate(DateFormatter.fromDateToString(vo.getUpdateDate()));
            dto.setFileName(vo.getFileName());
            dto.setIno(vo.getIno());
            dto.setUploadPath(vo.getUploadPath());
            dto.setUrl(vo.getUrl());
            dto.setUuid(vo.getUuid());
        } catch (Exception e){
            e.printStackTrace();
            return null;
        }

        return dto;
    }

    default List<ImageDTO> toDTOList(List<ImageVO> imageList) throws Exception{
        return imageList.stream().map(a -> {
            return toDTO(a);
        }).collect(Collectors.toList());
    }
}
