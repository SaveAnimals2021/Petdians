package org.petdians.animal;


import lombok.extern.log4j.Log4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.petdians.animal.config.AnimalConfig;
import org.petdians.animal.dto.ImageDTO;
import org.petdians.animal.service.AnimalService;
import org.petdians.animal.service.ImageService;
import org.petdians.common.config.CommonConfig;
import org.petdians.crawling.config.CrawlConfig;
import org.petdians.crawling.util.*;
import org.petdians.common.dao.AnimalInfoDAO;
import org.petdians.common.dto.PageDTO;
import org.petdians.common.util.ImageManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {CommonConfig.class, AnimalConfig.class, CrawlConfig.class})
public class AnimalServiceTests {

    KaraCrawlManager karaservice;

    SaacCrawlManager saacCrawlService;

    KarmaCrawlManager karmaCrawlService;

    IJoaCrawlManager iJoaCrawlService;

    AngelCrawlManager angelCrawlService;

    APMSICrawlManager apmsCrawlService;

    AnimalInfoDAO dao;

    @Autowired
    AnimalService service;
    @Autowired
    ImageService imageService;

    int time = 90;

    // dto 모두 크롤링해서 image 모두 저장
    @Test
    public void testAnimalService() throws Exception {
        angelCrawlService.doCrawl(time);
        angelCrawlService.getAnimalList().forEach(info -> {
            log.info(info);
            try {
                service.register(info);
                info.setAnimalNumber(info.getAnimalNumber());
                List<ImageDTO> imageList = ImageManager.saveImage(info);
                imageList.forEach(i -> imageService.register(i));
            } catch (Exception e) {
                e.printStackTrace();
            }
        });
        log.info("========================= INSERT DONE : angelCrawlService ===============================");
        apmsCrawlService.doCrawl(time);
        apmsCrawlService.getAnimalList().forEach(info -> {
            try {
                service.register(info);
                info.setAnimalNumber(info.getAnimalNumber());
                List<ImageDTO> imageList = ImageManager.saveImage(info);
                imageList.forEach(i -> imageService.register(i));
            } catch (Exception e) {
                e.printStackTrace();
            }
        });
        log.info("========================= INSERT DONE : apmsCrawlService ===============================");
        karaservice.doCrawl(time);
        karaservice.getAnimalList().forEach(info -> {
            try {
                log.info(info);
                service.register(info);
                info.setAnimalNumber(info.getAnimalNumber());
                List<ImageDTO> imageList = ImageManager.saveImage(info);
                imageList.forEach(i -> {
                    log.info(i);
                    imageService.register(i);
                });
            } catch (Exception e) {
                e.printStackTrace();
            }
        });
        log.info("========================= INSERT DONE : karaservice ===============================");
        saacCrawlService.doCrawl(time);
        saacCrawlService.getAnimalList().forEach(info -> {
            try {
                log.info(info);
                service.register(info);
                info.setAnimalNumber(info.getAnimalNumber());
                List<ImageDTO> imageList = ImageManager.saveImage(info);
                imageList.forEach(i -> {
                    log.info(i);
                    imageService.register(i);
                });
            } catch (Exception e) {
                e.printStackTrace();
            }
        });
        log.info("========================= INSERT DONE :saacCrawlService ===============================");
        karmaCrawlService.doCrawl(time);
        karmaCrawlService.getAnimalList().forEach(info -> {
            try {
                service.register(info);
                info.setAnimalNumber(info.getAnimalNumber());
                log.info(info);
                List<ImageDTO> imageList = ImageManager.saveImage(info);
                if (null == imageList) {
                    log.info("NO IMAGE");
                    return;
                }

                imageList.forEach(i -> {
                    log.info(i);
                    imageService.register(i);
                });
            } catch (Exception e) {
                e.printStackTrace();
            }
        });
        log.info("========================= INSERT DONE : karmaCrawlService ===============================");
        iJoaCrawlService.doCrawl(time);
        iJoaCrawlService.getAnimalList().forEach(info -> {
            try {
                log.info(info);
                service.register(info);
                info.setAnimalNumber(info.getAnimalNumber());
                List<ImageDTO> imageList = ImageManager.saveImage(info);
                imageList.forEach(i -> {
                    log.info(i);
                    imageService.register(i);
                });
            } catch (Exception e) {
                e.printStackTrace();
            }
        });
        log.info("========================= INSERT DONE : iJoaCrawlService ===============================");
    }

    @Test
    public void testMissingList(){
        PageDTO dto = new PageDTO();
        dto.setDay("30");
        dto.setType("s");
        dto.setKeyword("0");
        dto.setPerSheet(1000);
        service.getMissingList(dto).forEach(d->log.info(d));
    }
}
