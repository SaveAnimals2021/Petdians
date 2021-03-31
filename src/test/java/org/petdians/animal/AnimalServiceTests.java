package org.petdians.animal;


import lombok.extern.log4j.Log4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.petdians.animal.config.AnimalConfig;
import org.petdians.animal.dto.ImageDTO;
import org.petdians.animal.service.AnimalService;
import org.petdians.animal.service.ImageService;
import org.petdians.common.config.CommonConfig;
import org.petdians.common.crawling.config.CrawlConfig;
import org.petdians.common.crawling.service.*;
import org.petdians.common.dao.AnimalInfoDAO;
import org.petdians.common.util.ImageManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {CommonConfig.class, AnimalConfig.class, CrawlConfig.class})
public class AnimalServiceTests {
    @Autowired
    KaraCrawlService karaservice;
    @Autowired
    SaacCrawlService saacCrawlService;
    @Autowired
    KarmaCrawlService karmaCrawlService;
    @Autowired
    IJoaCrawlService iJoaCrawlService;
    @Autowired
    AngelCrawlService angelCrawlService;
    @Autowired
    APMSCrawlService apmsCrawlService;

    AnimalInfoDAO dao;

    @Autowired
    AnimalService service;
    @Autowired
    ImageService imageService;

    // dto 모두 크롤링해서 image 모두 저장
    @Test
    public void testAnimalService() throws Exception {
        angelCrawlService.doCrawl();
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
        apmsCrawlService.doCrawl();
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
        karaservice.doCrawl();
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
        saacCrawlService.doCrawl();
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
        karmaCrawlService.doCrawl();
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
        iJoaCrawlService.doCrawl();
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
}
