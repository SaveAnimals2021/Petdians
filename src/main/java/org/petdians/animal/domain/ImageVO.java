package org.petdians.animal.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ImageVO {

    private Integer ino;
    private String url;
    private Integer animalNumber;
    private String uuid;
    private String uploadPath;
    private String fileName;
    private String type;

    private Date regDate;
    private Date updateDate;

}
