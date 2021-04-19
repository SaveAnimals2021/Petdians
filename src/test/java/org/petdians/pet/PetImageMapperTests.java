package org.petdians.pet;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.petdians.common.config.CommonConfig;
import org.petdians.pet.config.PetConfig;
import org.petdians.pet.domain.PetImageVO;
import org.petdians.pet.mapper.PetImageMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {CommonConfig.class, PetConfig.class})
public class PetImageMapperTests {

    @Autowired
    private PetImageMapper mapper;

    @Test
    public void testRegister() {

        String uploadFolder = "C:\\upload";

        log.info("---------------------------------------");

        String folderPath = getFolder(); //현재날짜의 폴더경로를 만드는 메서드 -> 2021\03\17

        //Java API에서 Path는 폴더도 된다. //c드라이브 경로부터 쓰지 않기 위함
        File uploadPath = new File(uploadFolder, folderPath); //파일을 담는 폴더 경로(처음 위치, 하위 위치)

        if (uploadPath.exists() == false) {

            uploadPath.mkdirs(); //폴더 생성

        }

        List<PetImageVO> list = new ArrayList<>();

        String fileName = "test";

        UUID uuid = UUID.randomUUID(); //랜덤 UUID 생성 -> 중복을 방지하기 위함

        String type = "jpg";

        PetImageVO petImageVO = PetImageVO.builder().pno(2)
                .fileName(fileName)
                .uuid(uuid.toString())
                .type(type)
                .uploadPath(uploadPath.toString())
                .build();

        log.info(petImageVO);

        mapper.imageRegister(petImageVO);

    }

    private String getFolder() {

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); //바로 \\등을 쓰지 않는 이유 - 운영체제마다 다르니까 -> windosw 2021-03-17

        String str = sdf.format(new Date()); //현재 시간으로 폴더 경로를 잡는다.

        return str.replace("-", File.separator); //"-"을 운영체제에 따라 바꿔준다. 2021-03-17 -> 2021\03\17

    }

}
