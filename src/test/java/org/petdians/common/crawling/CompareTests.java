package org.petdians.common.crawling;

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
import org.petdians.common.crawling.service.IJoaCrawlService;
import org.petdians.common.crawling.service.KaraCrawlService;
import org.petdians.common.crawling.service.KarmaCrawlService;
import org.petdians.common.crawling.service.SaacCrawlService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.ArrayList;
import java.util.List;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes={CommonConfig.class, AnimalConfig.class})
public class CompareTests {

    KaraCrawlService karaservice;
    SaacCrawlService saacCrawlService;
    KarmaCrawlService karmaCrawlService;

    IJoaCrawlService iJoaCrawlService;

    @Autowired
    AnimalInfoMapper mapper;

    @Autowired
    AnimalService service;

    @Before
    public void setup(){
        karaservice = new KaraCrawlService();
        saacCrawlService = new SaacCrawlService();
        karmaCrawlService = new KarmaCrawlService();

        iJoaCrawlService = new IJoaCrawlService();
    }

    @Test
    public void testCompare() throws Exception{
        // CRAWLING LIST
        List<MissingAnimalDTO> crawledList = new ArrayList<>();

        karaservice.doCrawl();
        saacCrawlService.doCrawl();
        karmaCrawlService.doCrawl();
        iJoaCrawlService.doCrawl();

        log.info("====================== CRAWL OVER ======================");

        // DB LIST
         List<MissingAnimalDTO> dbList =  service.getAllList();


        for(int i = 0; i < crawledList.size(); ++i){
            MissingAnimalDTO cdto = crawledList.get(i);
            AnimalInfoDTO temp = null;

            for(int j = 0; j < dbList.size(); ++j){
                MissingAnimalDTO ddto = dbList.get(j);

                if( cdto.getAnimalCode().equals(ddto.getAnimalCode()) ){
                    // 중복인 상황
                    crawledList.remove(i);
                    dbList.remove(j);
                    --j;
                    --i;
                    break;
                }
            }
            // 끝나서 왔는지... => 중복이 없는 상황
            // for i ends
        }

        int csize = crawledList.size();

        for(int i = 0; i < csize; ++i){
            // 2번상황 = insert한다.
            service.register(crawledList.get(i));
        }


        int dsize = dbList.size();

        for(int i = 0; i < dsize; ++i){
            // 1번상황 = modify해서 상태를 isAdopted = true; 로 바꾼다.
            dbList.get(i).setRescueStatus(4);
            service.setIsAdopted(dbList.get(i));
        }

        log.info("crawledList : " + crawledList);
        log.info("dbList : " + dbList);
    }
}


