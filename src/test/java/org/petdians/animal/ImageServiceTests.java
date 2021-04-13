package org.petdians.animal;


import lombok.extern.log4j.Log4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.petdians.animal.config.AnimalConfig;
import org.petdians.animal.dto.ImageDTO;
import org.petdians.animal.service.ImageService;
import org.petdians.common.config.CommonConfig;
import org.petdians.crawling.config.CrawlConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;


@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {CommonConfig.class, AnimalConfig.class, CrawlConfig.class})
public class ImageServiceTests {

    @Autowired
    ImageService service;

    @Test
    public void testDownloadAll(){
        try {
            service.downloadAll();
        }catch(Exception e){
            e.printStackTrace();
        }
    }

    @Test
    public void changeType() {
        try {
             List<ImageDTO> list = service.getAllImages();
            Integer length = list.size();

            for(int i = 0; i < length; ++i){
                ImageDTO temp =  list.get(i);

                if(10420 == temp.getAnimalNumber()){
                    int a = 0;
                }

                String fileName = temp.getFileName();
                Integer dotIndex = fileName.lastIndexOf(".");
                Integer filelength = fileName.length();
                if(dotIndex == filelength - 4){
                    String type = fileName.substring(dotIndex + 1);
                    log.info(temp.getIno() + " : " + type);
                    temp.setType(type);
                    service.changeType(temp);
                }
            }

        } catch(Exception e){
            e.printStackTrace();
        }

    }

}
