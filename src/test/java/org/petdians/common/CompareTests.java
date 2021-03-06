package org.petdians.common;

import lombok.extern.log4j.Log4j;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.petdians.animal.config.AnimalConfig;
import org.petdians.animal.dto.AnimalInfoDTO;
import org.petdians.animal.dto.MissingAnimalDTO;
import org.petdians.animal.mapper.AnimalInfoMapper;
import org.petdians.animal.service.AnimalService;
import org.petdians.common.config.CommonConfig;
import org.petdians.crawling.util.IJoaCrawlManager;
import org.petdians.crawling.util.KaraCrawlManager;
import org.petdians.crawling.util.KarmaCrawlManager;
import org.petdians.crawling.util.SaacCrawlManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.ArrayList;
import java.util.List;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes={CommonConfig.class, AnimalConfig.class})
public class CompareTests {

    KaraCrawlManager karaservice;
    SaacCrawlManager saacCrawlService;
    KarmaCrawlManager karmaCrawlService;

    IJoaCrawlManager iJoaCrawlService;

    @Autowired
    AnimalInfoMapper mapper;

    @Autowired
    AnimalService service;

    @Before
    public void setup(){
        karaservice = new KaraCrawlManager();
        saacCrawlService = new SaacCrawlManager();
        karmaCrawlService = new KarmaCrawlManager();

        iJoaCrawlService = new IJoaCrawlManager();
    }

    @Test
    public void testCompare() throws Exception{
        // CRAWLING LIST
        List<MissingAnimalDTO> crawledList = new ArrayList<>();

        karaservice.doCrawl(30);
        saacCrawlService.doCrawl(30);
        karmaCrawlService.doCrawl(30);
        iJoaCrawlService.doCrawl(30);

        log.info("====================== CRAWL OVER ======================");

        // DB LIST
         List<MissingAnimalDTO> dbList =  service.getAllList();


        for(int i = 0; i < crawledList.size(); ++i){
            MissingAnimalDTO cdto = crawledList.get(i);
            AnimalInfoDTO temp = null;

            for(int j = 0; j < dbList.size(); ++j){
                MissingAnimalDTO ddto = dbList.get(j);

                if( cdto.getAnimalCode().equals(ddto.getAnimalCode()) ){
                    // ????????? ??????
                    crawledList.remove(i);
                    dbList.remove(j);
                    --j;
                    --i;
                    break;
                }
            }
            // ????????? ?????????... => ????????? ?????? ??????
            // for i ends
        }

        int csize = crawledList.size();

        for(int i = 0; i < csize; ++i){
            // 2????????? = insert??????.
            service.register(crawledList.get(i));
        }


        int dsize = dbList.size();

        for(int i = 0; i < dsize; ++i){
            // 1????????? = modify?????? ????????? isAdopted = true; ??? ?????????.
            dbList.get(i).setRescueStatus(4);
            service.setIsAdopted(dbList.get(i));
        }

        log.info("crawledList : " + crawledList);
        log.info("dbList : " + dbList);
    }
}


