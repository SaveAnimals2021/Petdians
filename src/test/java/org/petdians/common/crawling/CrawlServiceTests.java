package org.petdians.common.crawling;

import lombok.extern.log4j.Log4j;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.petdians.animal.config.AnimalConfig;
import org.petdians.animal.dto.ImageDTO;
import org.petdians.animal.dto.MissingAnimalDTO;
import org.petdians.animal.service.AnimalService;
import org.petdians.animal.service.ImageService;
import org.petdians.common.config.CommonConfig;
import org.petdians.common.crawling.service.*;
import org.petdians.common.dao.AnimalInfoDAO;
import org.petdians.common.util.ImageManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {CommonConfig.class, AnimalConfig.class})
public class CrawlServiceTests {
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

    @Before
    public void setup() {
        dao = new AnimalInfoDAO();
    }

    @Test
    public void testAPMS() {
        try {
            apmsCrawlService.doCrawl();
            log.info("CRAWL OVER");
            apmsCrawlService.getAnimalList().forEach(info -> log.info(info));
            log.info("size : " + apmsCrawlService.getAnimalList().size());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Test
    public void testAngel() {
        try {
            angelCrawlService.doCrawl();
            log.info("CRAWL OVER");
            angelCrawlService.getAnimalList().forEach(info -> log.info(info));
            log.info("size : " + angelCrawlService.getAnimalList().size());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Test
    public void testAll() {
        try {

            karaservice.doCrawl();
            saacCrawlService.doCrawl();
            karmaCrawlService.doCrawl();
            iJoaCrawlService.doCrawl();

            karaservice.getAnimalList().forEach(info -> log.info(info));
            saacCrawlService.getAnimalList().forEach(info -> log.info(info));
            karmaCrawlService.getAnimalList().forEach(info -> log.info(info));
            iJoaCrawlService.getAnimalList().forEach(info -> log.info(info));

            log.info("===================================");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Test
    public void testInsert() {
        MissingAnimalDTO animalDTO = new MissingAnimalDTO();

        animalDTO.setAnimalCode("vo.getAnimalCode()");
        animalDTO.setType("vo.getType()");
        animalDTO.setServiceName("vo.getServiceName()");
        animalDTO.setName("vo.getName()");
        animalDTO.setSpecies("vo.getSpecies()");
        animalDTO.setSex("vo.getSex()");
        animalDTO.setAge("vo.getAge()");
        animalDTO.setSpecial("vo.getSpecial()");
        animalDTO.setColor("vo.getColor()");


        animalDTO.setMissingLocation("vo.getMissingLocation()");

        animalDTO.setOriginURL("vo.getOriginURL()");

        animalDTO.setSituation("vo.getSituation()");
        animalDTO.setRescueStatus(1);
        animalDTO.setGuardianName("vo.getGuardianName()");
        animalDTO.setPhoneNumber("vo.getPhoneNumber()");

        animalDTO.setRescueLocation("vo.getRescueLocation()");

        service.register(animalDTO);

    }

    @Test
    public void testInsertAll() {
        try {
            angelCrawlService.doCrawl();
            angelCrawlService.getAnimalList().forEach(info -> service.register(info));
            log.info("========================= INSERT DONE ===============================");
            apmsCrawlService.doCrawl();
            apmsCrawlService.getAnimalList().forEach(info -> service.register(info));
            log.info("========================= INSERT DONE ===============================");
            karaservice.doCrawl();
            karaservice.getAnimalList().forEach(info -> service.register(info));
            log.info("========================= INSERT DONE ===============================");
            saacCrawlService.doCrawl();
            saacCrawlService.getAnimalList().forEach(info -> service.register(info));
            log.info("========================= INSERT DONE ===============================");
            karmaCrawlService.doCrawl();
            karmaCrawlService.getAnimalList().forEach(info -> service.register(info));
            log.info("========================= INSERT DONE ===============================");
            iJoaCrawlService.doCrawl();
            iJoaCrawlService.getAnimalList().forEach(info -> service.register(info));
            log.info("========================= INSERT DONE ===============================");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Test
    public void testImageManager() throws Exception{
        saacCrawlService.doCrawl();
        saacCrawlService.getAnimalList().forEach(dto->{
            try {
                service.register(dto);
                log.info("ANIMAL NUMBER : " + dto.getAnimalNumber());

                List<ImageDTO> images = ImageManager.saveImage(dto);
                if(null != images){
                    for(int i = 0; i < images.size(); ++i){
                        imageService.register(images.get(i));
                    }

                }

            } catch(Exception e){
                e.printStackTrace();
            }
        });



    }

    @Test
    public void testJoa() {
        try {
            iJoaCrawlService.doCrawl();
            iJoaCrawlService.getAnimalList().forEach(info -> log.info(info));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
