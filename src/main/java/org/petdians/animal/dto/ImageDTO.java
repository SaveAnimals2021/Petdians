package org.petdians.animal.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.File;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ImageDTO {
    private Integer ino;
    private String url;
    private Integer animalNumber;
    private String uuid;
    private String uploadPath;
    private String fileName;
    private String type;

    private String regDate;
    private String updateDate;

    public String getFullURL(){
        String newPath = uploadPath.replace("C:\\", "C:\\\\");
        return newPath + File.separator + fileName;
    }

}
